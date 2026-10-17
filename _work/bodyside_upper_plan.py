# -*- coding: utf-8 -*-
# 台账：D400-D734 每一条含「本体侧」的行落成一行工单判词，四类别 REPAIR/KEEP/JUDGMENT/WAIVER。
# 只有 REPAIR 可改；本轮受 inflight 停手约束，REPAIR 亦只登记不执行。只读笔记。
import io, re, glob, os

NS = u'研究笔记'
BS = u'本体侧'

# ---- 人工复核表（逐行判词，优先级最高）----
OV = {
 (u'D595', 252): (u'REPAIR', u'量词误用有逐字重述，坏形全文两次（正文 250 与申报 252），回填后落为一'),
 (u'D570', 255): (u'REPAIR', u'第四类笔误给出逐字读法，坏形含残片 -cover 两次（正文 137 与申报 255），可就地换串'),
 (u'D542', 308): (u'REPAIR', u'错字申报逐字给出本意数词，坏串两次（正文 302 与申报 308），可就地换串；本意整语另含"派单底线"，取词内最小替换'),
 (u'D494', 299): (u'REPAIR', u'词序错落有逐字重述；坏形只在正文 287 一处，回填后归零，属规则二的单点例外'),
 (u'D486', 253): (u'REPAIR', u'第三类括注残片给出两条逐字正确读法，其中 §12 一处可就地换串（正文 174）；§10 一处同条改素材行号，另计 JUDGMENT'),
 (u'D543', 268): (u'REPAIR', u'收尾补记逐字给出正确表述两处（正文 250 的混排残片），可就地换串；同条其三为节数口径，另计 JUDGMENT'),
 (u'D452', 229): (u'JUDGMENT', u'逐字替换齐全但该稿在飞（inflight 列名），本轮跳过并登记；内容多为未译术语替换'),
 (u'D452', 223): (u'JUDGMENT', u'整块删重申请，规则二禁止改行数，规则六禁止删重复块'),
 (u'D448', 318): (u'JUDGMENT', u'失句逐字回填需插入新句并搬回两句，行数与整块搬动都越界'),
 (u'D478', 130): (u'JUDGMENT', u'失句附逐字文本但恢复点在段外/题前，插入必增行，违反行数不变'),
 (u'D416', 564): (u'JUDGMENT', u'被删子句只给等价陈述位置，未给逐字原句，回填需造语'),
 (u'D537', 197): (u'JUDGMENT', u'整块搬迁指示，无逐字新句'),
 (u'D537', 217): (u'JUDGMENT', u'节块搬正与标题行归位，属结构工单'),
 (u'D541', 393): (u'WAIVER', u'三处给出的正确读法均为禁串改写方案，属违禁短语清理通道'),
 (u'D569', 267): (u'JUDGMENT', u'误删整节已在本节逐字重刊，剩处置为编号与搬正'),
 (u'D569', 289): (u'JUDGMENT', u'同上，逐字恢复已在盘，需搬正与编号处置'),
 (u'D574', 220): (u'JUDGMENT', u'D 类失句只给内容提示未给逐字句；A/B/C/E 类属禁串、定界符、术语通道'),
 (u'D646', 251): (u'JUDGMENT', u'补录与整块搬回、类别七前向指号需核素材'),
 (u'D437', 166): (u'JUDGMENT', u'引用范围数字写反的更正是素材行号口径，非锚位损坏句'),
 (u'D437', 360): (u'JUDGMENT', u'自检句行号笔误，改的是自指计数不是句子'),
 (u'D493', 286): (u'JUDGMENT', u'纯计数更正（四十三→四十二、两处→四处、词型数），无句子损坏'),
 (u'D474', 301): (u'JUDGMENT', u'计数口径更正，非表述损坏'),
 (u'D435', 374): (u'JUDGMENT', u'取证次数与节数口径更正，属事实账'),
 (u'D521', 318): (u'JUDGMENT', u'口径自相矛盾以新条为准，需人裁哪句作废'),
 (u'D576', 232): (u'JUDGMENT', u'错字浸入/浸人为普通别字且两处同形，非锚位事故族，另列待裁'),
 (u'D689', 450): (u'JUDGMENT', u'小节 0 到 17 的连续性陈述与实际节数不符，属事实口径'),
 (u'D543', 266): (u'JUDGMENT', u'十七个小节为节数口径错，非句子损坏'),
 (u'D642', 209): (u'JUDGMENT', u'指引编号与内容归属错位，改的是节号指向'),
 (u'D643', 476): (u'JUDGMENT', u'缺号、前向引用错位与标题不符，均结构/编号类'),
 (u'D481', 182): (u'JUDGMENT', u'前向指引错位与译名错译，后支属规则六禁改的术语'),
 (u'D543', 248): (u'JUDGMENT', u'勘误之勘误段，声明无效并更正他段，处置需整段读判'),
 (u'D452', 227): (u'JUDGMENT', u'改账补记以新段为准，旧句不回改'),
 (u'D452', 221): (u'WAIVER', u'首块体量缺口，盘上无法回填'),
 (u'D452', 223): (u'JUDGMENT', u'整块重复删除申请'),
 (u'D605', 564): (u'WAIVER', u'禁串命中登记，属违禁短语清理通道'),
 (u'D714', 662): (u'WAIVER', u'禁串自述与申报已过期，属清理通道与陈旧声明'),
 (u'D714', 571): (u'WAIVER', u'衔接词命中类，属清理通道'),
 (u'D717', 599): (u'WAIVER', u'衔接词命中类，属清理通道'),
 (u'D594', 1542): (u'WAIVER', u'登记处自造禁串，属清理通道'),
 (u'D696', 368): (u'WAIVER', u'禁串与长停顿号两处，属清理通道'),
 (u'D578', 454): (u'WAIVER', u'对举句式命中，属清理通道'),
 (u'D570', 193): (u'WAIVER', u'残留汇总段，禁串与术语交它通道'),
 (u'D570', 255): (u'REPAIR', u'第四类笔误给出逐字读法，坏形含残片 -cover 两次（正文 137 与申报 255），可就地换串'),
 (u'D465', 366): (u'JUDGMENT', u'引用了正文整句做定位，需人判是否移动'),
 (u'D573', 232): (u'JUDGMENT', u'段落截半需整块搬回原位'),
 (u'D573', 310): (u'JUDGMENT', u'三条正文句定位，处置为搬动'),
 (u'D597', 268): (u'WAIVER', u'术语混排需本体侧统一取词，规则六禁改译名'),
 (u'D454', 263): (u'WAIVER', u'未译术语的期望改法，属译名替换'),
 (u'D643', 480): (u'WAIVER', u'台账表头文字命中，规则六禁改表头'),
 (u'D642', 277): (u'WAIVER', u'按类别的禁串与术语汇总，不复现字形'),
 (u'D448', 318): (u'JUDGMENT', u'失句逐字回填需插入新句并搬回两句，行数与整块搬动都越界'),
 (u'D561', 206): (u'JUDGMENT', u'整块错位与标题行补回，另（五）给的是公式形态'),
 (u'D560', 286): (u'JUDGMENT', u'标题行被消耗，需补行与搬块'),
 (u'D472', 579): (u'JUDGMENT', u'整块落位缺陷，需搬迁工具'),
 (u'D475', 221): (u'JUDGMENT', u'重复块删除加原块搬回'),
 (u'D492', 739): (u'JUDGMENT', u'两段重复落盘，删重属越界'),
 (u'D545', 465): (u'JUDGMENT', u'整段重复副本搬正'),
 (u'D461', 966): (u'JUDGMENT', u'整块搬正申请，行数与字节需不变由工具做'),
 (u'D478', 246): (u'JUDGMENT', u'两处新增都在同一类，处置为搬动与删重'),
 (u'D478', 248): (u'JUDGMENT', u'同条延续搬块指示'),
 (u'D569', 267): (u'JUDGMENT', u'误删整节已逐字重刊，剩编号处置'),
 (u'D691', 838): (u'JUDGMENT', u'只请本体侧按需修句，未给逐字文本，最大不可执行族代表'),
 (u'D690', 617): (u'KEEP', u'待核说明，无工单'),
 (u'D697', 555): (u'KEEP', u'核对结果登记，无缺陷工单'),
 (u'D611', 319): (u'KEEP', u'收束叙述提及本体侧核验，无工单'),
 (u'D637', 392): (u'WAIVER', u'七类缺陷汇总，禁串/破折/术语为主'),
 (u'D695', 357): (u'WAIVER', u'禁串四类计数登记'),
 (u'D568', 271): (u'WAIVER', u'禁串与残留族的补注计数'),
 (u'D646', 245): (u'WAIVER', u'闸门自检叙述，命中交它通道'),
 (u'D494', 299): (u'REPAIR', u'词序错落有逐字重述；坏形只在正文 287 一处，回填后归零，属规则二的单点例外'),
 (u'D425', 202): (u'WAIVER', u'按类别的混排残留与探针回执，交它通道'),
 (u'D418', 439): (u'WAIVER', u'中英混排残留与多余空格，交它通道'),
 (u'D467', 187): (u'WAIVER', u'残留词与记号漏展开，交它通道'),
 (u'D467', 205): (u'WAIVER', u'记号展开策略陈述，已落盘部分待本体侧展开'),
 (u'D643', 476): (u'JUDGMENT', u'缺号、前向引用错位与标题不符，均结构/编号类'),
 (u'D706', 457): (u'WAIVER', u'禁串命中数增补，交它通道'),
 (u'D489', 246): (u'JUDGMENT', u'引用正文原句申报其位置，需人判是否改写'),
 (u'D480', 270): (u'JUDGMENT', u'小标题引用，属结构指示'),
 (u'D502', 266): (u'JUDGMENT', u'与命题 8 矛盾的陈述需内容核对'),
 (u'D524', 281): (u'JUDGMENT', u'两句正文的定位与归属，需搬动判断'),
 (u'D527', 276): (u'JUDGMENT', u'定理名与恒等式的称谓更正，属内容口径'),
 (u'D531', 148): (u'JUDGMENT', u'短语指向内容的移动或改写未定'),
 (u'D597', 329): (u'JUDGMENT', u'引用正文小标题，处置未逐字给出'),
 (u'D605', 370): (u'WAIVER', u'剩余两处禁串，交它通道'),
 (u'D641', 169): (u'WAIVER', u'术语（无挠）译名问题'),
 (u'D692', 522): (u'JUDGMENT', u'措辞次序建议，无逐字新句'),
 (u'D696', 495): (u'JUDGMENT', u'§9 末段位置相关，需搬动判断'),
 (u'D708', 424): (u'KEEP', u'重申落盘后不就地替换的纪律，无工单'),
 (u'D708', 517): (u'KEEP', u'同上'),
 (u'D430', 311): (u'JUDGMENT', u'见 §N 回指与自由速率提法需内容核对'),
 (u'D727', 343): (u'KEEP', u'回指自查叙述'),
 (u'D457', 203): (u'WAIVER', u'进而/因而/遂为类衔接词，交它通道'),
 (u'D457', 211): (u'WAIVER', u'同上'),
 (u'D492', 739): (u'JUDGMENT', u'两段重复落盘，删重属越界'),
 (u'D543', 250): (u'JUDGMENT', u'术语逐行账本身交它通道；其中登记句两处混排残片的回填见 L268 条'),
}

# ---- 特征词 ----
DEFV = [u'残片', u'残句', u'残缺', u'截断', u'截在', u'截成', u'粘连', u'缺主语', u'词序', u'语序',
        u'量词', u'单位', u'错字', u'笔误', u'潦草', u'混排', u'夹了', u'夹杂', u'漏抄', u'误夹', u'多字', u'漏字']
MOVE = [u'整块', u'搬迁', '搬回', '搬正', '搬移', '移到', '挪', '删除', '删去', '删重', '重印', '重复落盘',
        '整段重复', '重复块', '补回', '补录', '插入', '归位', '剪切', '搬动', '丢句', '失句', '丢失', '被覆盖删除',
        '误删', '吞掉']
NUMB = [u'计数', u'次数', u'口径', u'节数', u'行号', u'字节', u'总数', u'实测', u'数目', u'个小节', u'数据行']
BANW = [u'禁串', u'禁令', u'违禁', u'禁用', u'禁用语', u'禁止性', u'禁写', u'被禁', u'长停顿', u'长破折',
        u'双逗号', u'顿逗', u'装饰', u'定界符', u'反引号', u'竖线', u'表头', u'分隔行', u'单元格', u'逆接',
        u'转折对比', u'转折类', u'转折关联', u'转折连词', u'转折搭桥', u'转折短语', u'转折对照', u'替代式转折',
        u'两字转折', u'四字改口', u'对举', u'连词', u'清理通道', u'机械清理', u'机械通道', u'停顿号', u'横线',
        u'破折号', u'违例', u'禁串字形', u'语形', u'禁串形态', u'违禁词族', u'禁串命中', u'违规']
TERM = [u'未译', u'译名', u'术语残留', u'英文残留', u'外文残留', u'残留词', u'音译', u'生造词', u'英文词',
        u'外来词', u'英文片段', u'英文名', u'拉丁', u'英文形容词', u'英文名词', u'英文分词', u'英文占位',
        u'术语不一致', u'未翻', u'残留词形', u'术语']
FLOW = [u'取证', u'调用', u'首次落盘', u'配额', u'上限', u'越界动作', u'锚点', u'窗口', u'探针', u'回执',
        u'未读取', u'git', u'临时文件']
GAP = [u'缺口', u'低于', u'下限', u'体量不足', u'字节不足', u'永久缺口', u'体量', u'字节不足']
VERB = [u'应作', u'应为', u'应写作', u'应读作', u'读法', u'回填', u'照抄', u'逐字', u'正确', u'期望', u'本意',
        u'实为', u'改为', u'替换', u'恢复', u'重述', u'原文', u'原句', u'表述应']

def spans(l):
    out = []
    for a, b in [(u'“', u'”'), (u'「', u'」')]:
        for m in re.finditer(re.escape(a) + u'(.*?)' + re.escape(b), l):
            if m.group(1):
                out.append(m.group(1))
    parts = l.split(u'"')
    for k in range(0, len(parts) - 1, 2):
        if parts[k + 1]:
            out.append(parts[k + 1])
    return out

def anyw(l, ws):
    return [w for w in ws if w in l]

rows = []
audit = []
files = {}
cnt = {}
for p in sorted(glob.glob(NS + '/D*.md')):
    m = re.match(r'D(\d+)', os.path.basename(p))
    if not m:
        continue
    n = int(m.group(1))
    if not (400 <= n <= 734):
        continue
    d = 'D%03d' % n
    t = io.open(p, encoding='utf-8', errors='replace').read()
    files[d] = (t, t.split(u'\n'))
for p in sorted(glob.glob(NS + '/D*.md')):
    m = re.match(r'D(\d+)', os.path.basename(p))
    if not m:
        continue
    n = int(m.group(1))
    if not (400 <= n <= 734):
        continue
    d = 'D%03d' % n
    t, lines = files[d]
    for i, l in enumerate(lines):
        if BS not in l:
            continue
        ln = i + 1
        key = (d, ln)
        if key in OV:
            c, why = OV[key]
        else:
            sp = spans(l)
            paired = []
            for s in sp:
                occ = [j + 1 for j, x in enumerate(lines) if s in x]
                if t.count(s) == 2 and len(occ) == 2 and ln in occ:
                    paired.append((s, [x for x in occ if x != ln][0]))
            dv = anyw(l, DEFV)
            mv = anyw(l, MOVE)
            nm = anyw(l, NUMB)
            bn = anyw(l, BANW)
            tm = anyw(l, TERM)
            fl = anyw(l, FLOW)
            gp = anyw(l, GAP)
            vb = anyw(l, VERB)
            if bn:
                c, why = u'WAIVER', u'命中禁串/破折/定界/表头类，交统一清理通道，本族不执行 (' + bn[0] + u')'
            elif tm:
                c, why = u'WAIVER', u'未译术语或译名替换，规则六禁改术语 (' + tm[0] + u')'
            elif mv:
                c, why = u'JUDGMENT', u'搬块/删重/失句插入类工单，与行数不变硬条件冲突 (' + mv[0] + u')'
            elif paired and dv:
                c, why = u'JUDGMENT', u'坏形与正文位成对且带损坏词，未逐条复核，登记不猜句 (' + dv[0] + u')'
            elif paired:
                c, why = u'JUDGMENT', u'引号片段在盘上成对，成对项系整句定位引用而非坏形替换'
            elif dv and vb:
                c, why = u'JUDGMENT', u'含损坏词与读法词，但盘上无成对坏形可定位，需造语 (' + dv[0] + u')'
            elif gp:
                c, why = u'WAIVER', u'体量缺口类申报，盘上无法以回填弥合 (' + gp[0] + u')'
            elif fl:
                c, why = u'WAIVER', u'流程与取证预算账，非语言缺陷 (' + fl[0] + u')'
            elif nm:
                c, why = u'JUDGMENT', u'计数或口径更正，非句子表述损坏 (' + nm[0] + u')'
            elif dv:
                c, why = u'JUDGMENT', u'仅指认损坏形态、未给逐字原句 (' + dv[0] + u')'
            elif vb:
                c, why = u'JUDGMENT', u'给出读法或本意但未与盘上唯一缺陷位配对'
            else:
                c, why = u'KEEP', u'叙述性提及本体侧通道或自检声明，无就地工单'
            if bn and paired and dv and vb:
                audit.append((d, ln, c, dv[0], bn[0]))
        cnt[c] = cnt.get(c, 0) + 1
        rows.append((d, ln, c, why))

hdr = [u'# bodyside_upper plan  range=D400-D734  hitlines=%d  REPAIR=%d KEEP=%d JUDGMENT=%d WAIVER=%d'
       % (len(rows), cnt.get('REPAIR', 0), cnt.get('KEEP', 0), cnt.get('JUDGMENT', 0), cnt.get('WAIVER', 0))]
hdr.append(u'# 类别含义：REPAIR=作者已逐字给出重述且盘上缺陷位可定位，只有本类可改；KEEP=原句完好、无工单；'
           u'JUDGMENT=真缺陷但非机械可执行（搬块、计数、需造语、内容核对）；WAIVER=交其它通道（禁串/破折/定界/表头/术语）。')
io.open('_work/bodyside_upper_plan.txt', 'wb').write(
    (u'\n'.join(hdr) + u'\n' + u'\n'.join(u'%s L%d %s %s' % r for r in rows) + u'\n').encode('utf-8'))
io.open('_work/bodyside_upper_audit.txt', 'wb').write(
    (u'\n'.join(u'%s L%d -> %s (dmg=%s ban=%s)' % a for a in audit) + u'\n').encode('utf-8'))
print('hitlines=%d REPAIR=%d KEEP=%d JUDGMENT=%d WAIVER=%d audit=%d' % (
    len(rows), cnt.get('REPAIR', 0), cnt.get('KEEP', 0), cnt.get('JUDGMENT', 0),
    cnt.get('WAIVER', 0), len(audit)))
