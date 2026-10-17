// 展开前的安全带检查：这批控制字命中有没有落在行内代码或围栏代码块里。
// 勘误节与逐字引用段里的宏名是要保持原样的，跟着展开会把引文改坏（D377 就是先探再改）。
//   node macro_site_probe.js D49 529 R,dd,E,Prob,supp
const fs = require('fs');
const path = require('path');

const B = String.fromCharCode(92);
const TICK = String.fromCharCode(96);
const NOTES = path.join('E:' + B + B + 'math', '研究笔记');
const TBL = JSON.parse(fs.readFileSync('preamble_tables.json', 'utf8'));
const key = process.argv[2];
const from = Number(process.argv[3]);
const macs = process.argv[4].split(',');

const file = fs.readdirSync(NOTES).filter((f) => f.startsWith(key + '-'));
if (file.length !== 1) throw new Error('glob ambiguity ' + file.length);
const text = fs.readFileSync(path.join(NOTES, file[0]), 'utf8');
const lines = text.split('\n');

let inFence = false;
let total = 0;
let risky = 0;
for (let i = from - 1; i < lines.length; i++) {
  const L = lines[i];
  const fence = L.trim().startsWith(TICK + TICK + TICK);
  if (fence) inFence = !inFence;
  for (const mac of macs) {
    const re = new RegExp(B + B + mac.replace(/[.*+?^${}()|[\]\\]/g, B + '$&') + '(?![A-Za-z])', 'g');
    let m;
    while ((m = re.exec(L))) {
      total++;
      const before = L.slice(0, m.index).split(TICK).length - 1;
      const inCode = (before % 2 === 1) || inFence;
      if (inCode) {
        risky++;
        console.log('RISK line ' + (i + 1) + ' \\' + mac + ' | ' + L.slice(0, 120));
      }
    }
  }
}
const e = TBL[key] || {};
console.log(key + ' from=' + from + ' sites=' + total + ' insideCode=' + risky +
  ' unresolved=' + JSON.stringify(e.unresolved || []));
