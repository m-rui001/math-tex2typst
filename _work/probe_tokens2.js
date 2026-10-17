// Classify "tokens is not iterable": does removing macros change the error?
const fs = require('fs');
const path = require('path');
const katex = require('katex');
const B = String.fromCharCode(92), D = String.fromCharCode(36), BT = String.fromCharCode(96);
const ROOT = path.join('E:' + B + B + 'math', '研究笔记');
const WORK = path.join('E:' + B + B + 'math', '_work');
const MACROS = JSON.parse(fs.readFileSync(path.join(WORK, 'katex_macros.json'), 'utf8'));
const DIG = '0123456789';
function fenceMask(text){const lines=text.split('\n');const out=[];let inf=false,tok=null;for(const l of lines){const s=l.trim();if(/^(?:`{3,}|~{3,})/.test(s)){if(!inf){inf=true;tok=s[0]+s[0]+s[0];out.push('');continue;}if(tok&&s.startsWith(tok)){inf=false;tok=null;out.push('');continue;}}if(inf)out.push('');else out.push(l.replace(new RegExp(BT+'+[^'+BT+B+'n]*'+BT+'+','g'),m=>' '.repeat(m.length)));}return out.join('\n');}
function spans(m){const r=[];const n=m.length;let i=0;while(i<n){if(m[i]!==D){i++;continue;}if(m[i+1]===D){let j=i+2;while(j<n&&!(m[j]===D&&m[j+1]===D))j++;if(j>=n)break;r.push({k:'D',b:m.slice(i+2,j)});i=j+2;continue;}if(i+1>=n||' \t\n'.includes(m[i+1])){i++;continue;}let j=i+1,c=-1;while(j<n){if(m[j]===D&&!' \t\n'.includes(m[j-1])&&!DIG.includes(m[j+1]===D?'':m[j+1]||'')){c=j;break;}j++;}if(c<0)break;r.push({k:'I',b:m.slice(i+1,c)});i=c+1;}return r;}
const files=fs.readdirSync(ROOT).filter(f=>/^D.*\.md$/.test(f)).sort();
let causedByMacros=0, latent=0, shown=0;
for(const f of files){const text=fs.readFileSync(path.join(ROOT,f),'utf8');const mask=fenceMask(text);
  for(const s of spans(mask)){
    let e1=null,e0=null;
    try{katex.renderToString(s.b,{throwOnError:true,strict:false,displayMode:s.k==='D',macros:MACROS});}catch(e){e1=e;}
    try{katex.renderToString(s.b,{throwOnError:true,strict:false,displayMode:s.k==='D',macros:{}});}catch(e){e0=e;}
    if(e1 && String(e1.message).includes('tokens is not iterable')){
      const m0=String(e0?e0.message:'');
      if(!m0.includes('tokens is not iterable')){ causedByMacros++; if(shown<5){console.log('MACRO-TRIGGERED',f,'|',s.b.slice(0,90));} if(shown<5)shown++; }
      else { latent++; }
    }
  }
}
console.log('causedByMacros=',causedByMacros,'latent(in both)=',latent);
