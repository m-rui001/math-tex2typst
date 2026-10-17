## 17:30 增量（账面复量腿：`dispatched-without-file=7` 拆成一枚豁免加六枚假无档，落地号与派单号错位不改记录；D544 的 0 字节残桩搬出笔记目录）

在飞清零后跑一遍跨队列账面复量，抓出两笔需要判形的旗标，都没有回改成内容。

第一笔 `_tools/dispatch_audit.py` 打 `dispatched=560 rows-in-queue=560 notes=737 dup-row=0 bad-row=0 dir-mismatch=0 dispatched-without-file=7`。七枚 NOFILE 逐枚定位：`WITHDRAWN-2026-10-06 row=498` 就是既有的撤稿豁免（`other_cover` 那句 `remaining=1` 的原主）；D681 至 D686 六枚对应的行 496、497、499 至 502 全部由已落地的 D771 至 D776 六篇逐字认领（量法：`其他队列第\s*(\d{1,3})\s*行` 带「其他」前缀那枚正则全文扫，一枚行号只有一位声明者，故 `dup-row=0` 与「谁占了这行」两问同时有答）。结论是派单记录里的笔记号与写手实际取号错位，内容一件没丢：`queue=560 covered=559 remaining=1 covered-with-decl=559 lean-covered=159 covered-ready=718 covered-weak=0` 一字未变。处置为登记不改账，理由与行号冻结律同源：改 `.tools` 的派单号会让六篇笔记的归属串与记录重新错配，收益只是让一个计数器好看。

第二笔是 `研究笔记/` 顶层一枚 0 字节残桩 `D544-标架系数空间里的一个非零满旗`（无扩展名，mtime 10-11 11:04），真稿在同目录 `D544-标架系数空间里活下来的满旗系数.md`（82,297 B／247 行／heads 16／CR 0）：同一号先落了一个空壳、十一分钟后按正式题名重落，空壳是那次失败的痕迹。这类桩的代价是全局普查读数：`wrap_strict` 报 `files=741`、笔记侧实数 740，多出来的正是它；`gate_all total=734 bad=0` 与 `pipe_census2` 都不吃它，所以既有账面没被污染。处置是整枚搬进 `_work/strays/`（改名不删，字节仍为 0），搬后顶层文件 741 枚、闸门与两本覆盖账全字不动。顺带普查「无扩展名或 0 字节」这一道只报出这一枚，另有一枚 `素材` 是目录。**判式：NOFILE 有两形，撤稿豁免与号位错位，两者的内容都在；先拿带「其他」前缀的行号正则找认领者，找不到才谈重派。**

同轮把三条质量腿的现状钉一遍供后续引用：行内式腿 `wrap1=3 wrapN=28 unclosed=0 files_hit=24`，余量全在既有分类里（围栏引文、跨行 code span、表格行、级联孤符），无机械可并项；宏族腿按 `census_after_unclosed_fix` 的口径 `spans=828,063 katex_refused=3,114 files_hit=318`，前十条命令占 1,607 跨（51.6%），这是全库通改的体量，未经用户明示不动；主线1 `cov.py covered 162 open 0`。两个只读普查子 agent 仍在跑（`_work/refleak_occ.json` 在 17:26 还在长），交付后只执行 ORDER 类定点修补。
