import sqlite3, json, sys, datetime, os

DB = r"C:/Users/hp/.zcode/cli/db/db.sqlite"
con = sqlite3.connect("file:" + DB.replace("\\", "/") + "?mode=ro", uri=True)


def load(sid):
    msgs = {r[0]: json.loads(r[1]) for r in
            con.execute("select id,data from message where session_id=?", (sid,))}
    parts = {}
    for mid, d in con.execute("select message_id,data from part where session_id=? order by sequence", (sid,)):
        parts.setdefault(mid, []).append(json.loads(d))
    return sorted(msgs.items(), key=lambda kv: (kv[1]["time"]["created"], kv[0])), parts


def render(sid, out, tools=True, notes=True):
    order, parts = load(sid)
    for mid, m in order:
        kind = (m.get("semantics") or {}).get("kind")
        role = m.get("role")
        for p in parts.get(mid, []):
            t = p.get("type")
            if t in ("step-start", "step-finish", "reasoning"):
                continue
            if t == "text":
                txt = (p.get("text") or "").strip()
                if not txt:
                    continue
                if kind == "user_prompt":
                    out.write(f"\n===== USER =====\n{txt}\n")
                elif kind == "compact_summary":
                    out.write(f"\n===== COMPACT SUMMARY =====\n{txt}\n")
                elif kind == "background_notification":
                    out.write(f"\n----- NOTIFICATION -----\n{txt[:600]}\n")
                elif role == "assistant":
                    out.write(f"\n[ASSISTANT]\n{txt}\n")
                else:
                    out.write(f"\n[{kind or role}]\n{txt[:600]}\n")
            elif t == "tool" and tools:
                tool = p.get("tool") or p.get("name") or "?"
                inp = ((p.get("state") or {}).get("input")) or p.get("input") or {}
                if tool == "Agent":
                    out.write(f"\n[DISPATCH {inp.get('subagent_type','')} :: {inp.get('description','')}]\n{(inp.get('prompt') or '')[:300]}\n")
                elif tool in ("TodoWrite",):
                    for td in (inp.get("todos") or []):
                        out.write(f"    todo[{td.get('status')}]: {td.get('content')}\n")
                elif tool in ("Bash", "Read", "Edit", "Write", "Grep", "Glob", "WebFetch", "WebSearch"):
                    key = inp.get("description") or inp.get("file_path") or inp.get("pattern") or inp.get("query") or ""
                    out.write(f"    {tool}: {str(key)[:110]}\n")
                else:
                    out.write(f"    {tool}: {json.dumps(inp, ensure_ascii=False)[:150]}\n")


def main():
    sid, out_path = sys.argv[1], sys.argv[2]
    title, tc = con.execute("select title,time_created from session where id=?", (sid,)).fetchone()
    with open(out_path, "w", encoding="utf-8") as out:
        out.write(f"### SESSION {sid}\nTITLE: {title}\nSTART: " +
                  datetime.datetime.fromtimestamp(tc / 1000).strftime("%Y-%m-%d %H:%M") + "\n")
        render(sid, out)
    print(out_path, os.path.getsize(out_path))


main()
