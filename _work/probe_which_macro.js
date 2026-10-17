// Find which macro triggers "tokens is not iterable" by removing macros one at a time.
const fs = require('fs'); const path = require('path'); const katex = require('katex');
const B = String.fromCharCode(92), D = String.fromCharCode(36), BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const WORK = path.join('E:' + B + B + 'math', '_work');
const MACROS = JSON.parse(fs.readFileSync(path.join(WORK, 'katex_macros.json'), 'utf8'));
const DIG = '0123456789';
function fenceMask(t){const L=t.split('\n');const o=[];let inf=false,tok=null;for(const l of L){const s=l.trim();if(/^(?:`{3,}|~{3,})/.test(s)){if(!inf){inf=true;tok=s[0]+s[0]+s[0];o.push('');continue;}if(tok&&s.startsWith(tok)){inf=false;tok=null;o.push('');continue;}}if(inf)o.push('');else o.push(l.replace(new RegExp(BT+'+[^'+BT+B+'n]*'+BT+'+','g'),m=>' '.repeat(m.length)));}return o.join('\n');}
function spans(m){const r=[];const n=m.length;let i=0;while(i<n){if(m[i]!==D){i++;continue;}if(m[i+1]===D){let j=i+2;while(j<n&&!(m[j]===D&&m[j+1]===D))j++;if(j>=n)break;r.push({k:'D',b:m.slice(i+2,j)});i=j+2;continue;}if(i+1>=n||' \t\n'.includes(m[i+1])){i++;continue;}let j=i+1,c=-1;while(j<n){if(m[j]===D&&!' \t\n'.includes(m[j-1])&&!DIG.includes(m[j+1]===D?'':m[j+1]||'')){c=j;break;}j++;}if(c<0)break;r.push({k:'I',b:m.slice(i+1,c)});i=c+1;}return r;}

// collect one representative span per macro that triggers the error with full macros
const files=fs.readdirSync(ROOT).filter(f=>/^D.*\.md$/.test(f)).sort();
const reps={}; // macro -> span
for(const f of files){const text=fs.readFileSync(path.join(ROOT,f),'utf8');const mask=fenceMask(text);
  for(const s of spans(mask)){
    let e=null;
    try{katex.renderToString(s.b,{throwOnError:true,strict:false,displayMode:s.k==='D',macros:MACROS});}catch(x){e=x;}
    if(e && String(e.message).includes('tokens is not iterable')){
      for(const key of Object.keys(MACROS)){ if(s.b.includes(key)){ if(!(key in reps)) reps[key]=s.b; } }
    }
  }
}
console.log('macros appearing in tokens-error spans:', Object.keys(reps).length);
// for each representative macro, test: does removing it fix the span?
const culprits=new Set();
for(const key of Object.keys(reps)){
  const span=reps[key];
  const m2=Object.assign({},MACROS); delete m2[key];
  let e2=null;
  try{katex.renderToString(span,{throwOnError:true,strict:false,displayMode:false,macros:m2});}catch(x){e2=x;}
  if(!e2 || !String(e2.message).includes('tokens is not iterable')) culprits.add(key);
}
console.log('culprit macros (removing fixes the span):');
for(const c of [...culprits].sort()) console.log('  ', c, '=>', JSON.stringify(MACROS[c]));
console.log('total culprits', culprits.size);
