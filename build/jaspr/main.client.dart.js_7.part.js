((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,D,E,B={
v5(){return new B.cz()},
hT:function hT(d,e){this.a=d
this.b=e},
hU:function hU(d,e){this.a=d
this.b=e},
bm:function bm(d,e,f,g,h,i,j,k,l,m,n,o){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j
_.w=k
_.x=l
_.y=m
_.z=n
_.Q=o},
cz:function cz(){this.b=null},
v6(){return new B.d0(null)},
d0:function d0(d){this.a=d},
kE:function kE(d){this.a=d},
kF:function kF(d){this.a=d},
kG:function kG(d){this.a=d},
kH:function kH(d){this.a=d},
kI:function kI(d){this.a=d},
kJ:function kJ(d){this.a=d},
kK:function kK(d){this.a=d},
kL:function kL(d){this.a=d},
kM:function kM(d){this.a=d},
kN:function kN(d){this.a=d},
kO:function kO(d){this.a=d}},C
J=c[1]
A=c[0]
D=c[2]
E=c[7]
B=a.updateHolder(c[5],B)
C=c[8]
B.hT.prototype={
a_(){return"Base64Mode."+this.b}}
B.hU.prototype={
a_(){return"Base64Variant."+this.b}}
B.bm.prototype={
ak(d,e,f,g,h,i,j,k,a0,a1,a2,a3,a4,a5){var x,w,v,u,t,s=this,r=i==null?s.a:i,q=a1==null?s.b:a1,p=a0==null?s.c:a0,o=a4==null?s.d:a4,n=a5==null?s.e:a5,m=a3==null?s.f:a3,l=d==null?s.r:d
if(e)x=null
else x=g==null?s.w:g
w=j==null?s.x:j
v=a2==null?s.y:a2
u=k==null?s.z:k
if(f)t=null
else t=h==null?s.Q:h
return new B.bm(r,q,p,o,n,m,l,x,w,v,u,t)},
j5(d,e){var x=null
return this.ak(x,!1,!1,x,x,d,e,x,x,x,x,x,x,x)},
eX(d,e,f,g){var x=null
return this.ak(x,d,e,x,x,x,x,x,x,f,g,x,x,x)},
j6(d,e,f,g,h){var x=null
return this.ak(x,d,!1,x,e,x,x,f,x,g,h,x,x,x)},
eW(d,e){var x=null
return this.ak(x,!1,d,e,x,x,x,x,x,x,x,x,x,x)},
iS(d){var x=null
return this.ak(d,!1,!1,x,x,x,x,x,x,x,x,x,x,x)},
j_(d){var x=null
return this.ak(x,!1,!1,x,x,x,x,x,x,x,x,d,x,x)},
j1(d){var x=null
return this.ak(x,!1,!1,x,x,x,x,x,x,x,x,x,x,d)},
j0(d){var x=null
return this.ak(x,!1,!1,x,x,x,x,x,x,x,x,x,d,x)},
j8(d,e,f,g,h,i,j){var x=null
return this.ak(x,d,e,x,x,f,g,x,h,i,j,x,x,x)},
j7(d,e,f,g,h,i){var x=null
return this.ak(x,d,e,x,x,f,g,x,h,i,x,x,x,x)}}
B.cz.prototype={
aq(){return C.B},
dJ(d){this.si(this.gi().j8(!0,!0,"",0,d,"",0))},
dK(d){var x=this
x.si(x.gi().j0(d))
if(x.gi().r&&x.gi().a.length!==0)x.b0()},
b0(){var x=this
if(x.gi().a.length===0){x.si(x.gi().eX(!0,!0,"",0))
return}if(x.gi().c===C.k)x.hJ()
else x.hD()},
hJ(){var x,w,v,u,t,s=this
try{x=D.p.U(s.gi().a)
w=null
u=y.i.h("bn.S")
if(s.gi().d===C.u){u=u.a(x)
w=C.A.gbu().U(u)}else{u=u.a(x)
w=D.r.gbu().U(u)}if(s.gi().e)w=s.iC(w)
s.si(s.gi().eX(!0,!0,w,J.aF(w)))}catch(t){v=A.R(t)
s.si(s.gi().eW(!0,"Encoding failed: "+A.l(v)))}},
hD(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i=this
try{x=i.gi().a
if(i.gi().f){n=x
m=A.bW("\\s",!0)
x=A.hI(n,m,"")}w=A.bW("^data:[^;]+;base64,",!1)
n=A.y(x)
m=w.b
v=m.test(n)
if(v)x=J.r0(x,w,"")
u=J.dP(x,"-")||J.dP(x,"_")
t=null
if(u||i.gi().d===C.u)t=D.v.U(C.A.dn(x))
else{s=x
while(D.d.R(J.aF(s),4)!==0)s=J.kd(s,"=")
t=D.v.U(A.y(s))}r=i.hE(t)
q=r!=null
p=null
o=null
if(q){p="[Binary Image Data - "+r+"]"
n=y.i.h("bn.S").a(t)
o="data:"+r+";base64,"+D.r.gbu().U(n)}else{p=D.i.f_(t,!0)
if(J.kg(p,"data:image/"))o=p}n=i.gi()
m=p
l=J.aF(t)
k=o
i.si(n.j6(!0,o,k!=null,m,l))}catch(j){i.si(i.gi().eW(!0,"Invalid Base64 input. Make sure the input is properly encoded."))}},
hE(d){var x,w,v,u
y.w.a(d)
w=d.length
if(w<4)return null
v=d[0]
if(v===137&&d[1]===80&&d[2]===78&&d[3]===71)return"image/png"
if(v===255&&d[1]===216&&d[2]===255)return"image/jpeg"
if(v===71&&d[1]===73&&d[2]===70&&d[3]===56)return"image/gif"
if(v===82&&d[1]===73&&d[2]===70&&d[3]===70)if(w>=12&&d[8]===87&&d[9]===69&&d[10]===66&&d[11]===80)return"image/webp"
try{x=D.a.ad(D.i.de(A.ek(d,0,A.eJ(A.b5(Math.min(w,100)),"count",y.e),A.aZ(d).h("D.E")).aT(0))).toLowerCase()
if(!J.kg(x,"<svg"))w=J.kg(x,"?xml")&&J.dP(x,"<svg")
else w=!0
if(w)return"image/svg+xml"}catch(u){}return null},
jI(d){var x,w,v,u,t
try{v=A.bW("\\s",!0)
x=A.hI(d,v,"")
w=A.bW("^data:[^;]+;base64,",!1)
v=A.y(x)
u=w.b
if(u.test(v))x=J.r0(x,w,"")
if(J.dP(x,"-")||J.dP(x,"_"))D.v.U(C.A.dn(x))
else D.v.U(D.r.dn(x))
return!0}catch(t){return!1}},
iC(d){var x,w,v,u
for(x=d.length,w=0,v="";w<x;w=u){u=w+76
v+=D.a.t(d,w,u>x?x:u)+"\n"}return D.a.ku(v.charCodeAt(0)==0?v:v)},
gfX(){var x,w,v,u,t=this
if(t.gi().a.length===0)return""
x=t.gi().x>0?D.e.dA(t.gi().y/t.gi().x*100,1):"0"
w=t.gi()
v=t.gi()
u=t.gi().c===C.k?"chars":"bytes"
return"Input: "+w.x+" bytes  \u2192  Output: "+v.y+" "+u+"  ("+x+"%)"},
gfg(){var x=this
return x.gi().c===C.t&&x.gi().a.length!==0&&x.jI(x.gi().a)}}
B.d0.prototype={
v(a4){var x,w,v,u,t,s,r,q,p,o,n,m=this,l=null,k=" active",j="b64-mode-icon",i="tool-checkbox-label",h="input",g="custom-checkbox",f="tool-editor-col tool-relative",e="tool-editor-header",d="tool-editor-label",a0="tool-header-actions",a1="tool-stats",a2=$.uS(),a3=E.qa(a4,a2,y.p)
a2=a2.gdq()
x=A.iK(a4,!1)
w=y.y.a(A.b2.prototype.gu.call(x)).d.du(a2,y.E)
a2=y.F
x=A.au(A.a([A.cY(A.a([A.v(A.a([new A.c("/",l)],a2),l,"accent",l),new A.c("Base64",l)],a2),"hero-title"),A.U(A.a([new A.c("Encode and decode Base64 strings \u2014 with URL-safe variant, line wrapping, image preview, and more.",l)],a2),"hero-subtitle",l)],a2),"glass-wrap")
v=a3.c
u=v===C.k
t=u?k:""
t=A.aX(A.a([A.v(A.a([new A.c("\u21e1",l)],a2),l,j,l),new A.c("Encode",l)],a2),l,"b64-mode-btn"+t,l,new B.kE(w),l)
s=A.aX(A.a([new A.c("\u21c4 Swap",l)],a2),l,"b64-swap-btn",l,new B.kF(w),l)
v=v===C.t
r=v?k:""
r=A.i(A.a([t,s,A.aX(A.a([A.v(A.a([new A.c("\u21e3",l)],a2),l,j,l),new A.c("Decode",l)],a2),l,"b64-mode-btn"+r,l,new B.kG(w),l)],a2),"b64-mode-bar",l,l)
s=A.v(A.a([new A.c("Variant",l)],a2),l,"b64-option-label",l)
t=a3.d
q=t===C.C?k:""
q=A.aX(A.a([new A.c("Standard",l)],a2),l,"cp-toggle-btn"+q,l,new B.kH(w),l)
t=t===C.u?k:""
t=A.a([A.i(A.a([s,A.i(A.a([q,A.aX(A.a([new A.c("URL-safe",l)],a2),l,"cp-toggle-btn"+t,l,new B.kI(w),l)],a2),"cp-toggle-group",l,l)],a2),"b64-option-group",l,l)],a2)
if(u)t.push(E.bv(A.a([A.ba(l,a3.e,h,l,new B.kJ(w),l,l,D.j,l,y.q),A.v(A.a([],a2),l,g,l),new A.c("Wrap at 76 chars (MIME)",l)],a2),i))
if(v)t.push(E.bv(A.a([A.ba(l,a3.f,h,l,new B.kK(w),l,l,D.j,l,y.q),A.v(A.a([],a2),l,g,l),new A.c("Strip whitespace before decoding",l)],a2),i))
s=a3.r
t.push(E.bv(A.a([A.ba(l,s,h,l,new B.kL(w),l,l,D.j,l,y.q),A.v(A.a([],a2),l,g,l),new A.c("Auto process",l)],a2),i))
t.push(A.aX(A.a([new A.c("Clear",l)],a2),l,"btn-secondary",l,new B.kM(w),l))
if(!s)t.push(A.aX(A.a([new A.c(u?"Encode":"Decode",l)],a2),l,"btn-primary",l,new B.kN(w),l))
t=A.a([r,A.i(t,"b64-options-bar",l,l)],a2)
if(v&&a3.a.length!==0){v=w.gfg()?" valid":" invalid"
t.push(A.i(A.a([A.i(A.a([new A.c(w.gfg()?"\u2713 Valid Base64":"\u2715 Invalid Base64",l)],a2),"b64-validity-badge"+v,l,l)],a2),"b64-validation-bar",l,l))}v=A.i(A.a([A.U(A.a([new A.c(u?"Plain Text":"Base64 Input",l)],a2),d,l),A.i(A.a([A.v(A.a([new A.c(""+a3.x+" bytes",l)],a2),l,a1,l)],a2),a0,l,l)],a2),e,l,l)
s=a3.w
r=s==null
q=!r
p=q?" tool-textarea-error":""
o=a3.a
p=A.a([v,A.k7(A.a([new A.c(o,l)],a2),!0,"tool-textarea"+p,l,new B.kO(w),"Type or paste content here...",!1,!1)],a2)
v=o.length!==0
if(v)p.push(new E.bN(o,l))
p=A.i(p,f,l,l)
o=A.U(A.a([new A.c(u?"Base64 Output":"Decoded Text",l)],a2),d,l)
n=a3.y
u=u?"chars":"bytes"
u=A.i(A.a([o,A.i(A.a([A.v(A.a([new A.c(""+n+" "+u,l)],a2),l,a1,l)],a2),a0,l,l)],a2),e,l,l)
u=A.a([u,A.k7(A.a([new A.c(q?"":a3.b,l)],a2),!1,"tool-textarea",l,l,"Output will appear here...",!0,!1)],a2)
o=a3.b
if(o.length!==0&&r)u.push(new E.bN(o,l))
t.push(A.i(A.a([p,A.i(u,f,l,l)],a2),"tool-editor-wrap",l,l))
if(q)t.push(A.i(A.a([A.U(A.a([new A.c(s,l)],a2),"tool-error",l)],a2),"b64-error-bar",l,l))
if(v&&r)t.push(A.i(A.a([A.v(A.a([new A.c(w.gfX(),l)],a2),l,"b64-stats-text",l)],a2),"b64-stats-bar",l,l))
if(a3.z&&a3.Q!=null){v=A.U(A.a([new A.c("Image Preview",l)],a2),d,l)
u=a3.Q
u.toString
t.push(A.i(A.a([v,A.aD("Decoded image preview","b64-preview-img",u,l,l)],a2),"b64-image-preview",l,l))}t.push(A.i(A.a([A.U(A.a([new A.c("Quick Reference",l)],a2),d,l),A.i(A.a([m.bQ("Standard Base64","Uses A-Z, a-z, 0-9, +, /\nPadded with = to multiple of 4"),m.bQ("URL-safe Base64","Uses - instead of +\nUses _ instead of /\nSafe for URLs and filenames"),m.bQ("MIME (76-char wrap)","Used in email attachments\nLine break every 76 characters"),m.bQ("Size overhead","Base64 is ~33% larger\n3 bytes \u2192 4 Base64 chars")],a2),"b64-ref-grid",l,l)],a2),"b64-reference",l,l))
return A.i(A.a([x,A.au(t,l)],a2),"container gap-60",l,l)},
bQ(d,e){var x=null,w=y.F
return A.i(A.a([A.U(A.a([new A.c(d,x)],w),"b64-ref-title",x),A.U(A.a([new A.c(e,x)],w),"b64-ref-body",x)],w),"b64-ref-card",x,x)}}
var z=a.updateTypes(["bm()","cz()"])
B.kE.prototype={
$0(){return this.a.dJ(C.k)},
$S:0}
B.kF.prototype={
$0(){var x=this.a,w=x.gi().b,v=x.gi().c===C.k?C.t:C.k
x.si(x.gi().j7(!0,!0,w,D.p.U(w).length,v,""))
x.b0()
return null},
$S:0}
B.kG.prototype={
$0(){return this.a.dJ(C.t)},
$S:0}
B.kH.prototype={
$0(){return this.a.dK(C.C)},
$S:0}
B.kI.prototype={
$0(){return this.a.dK(C.u)},
$S:0}
B.kJ.prototype={
$1(d){var x=this.a
x.si(x.gi().j1(!x.gi().e))
if(x.gi().r&&x.gi().a.length!==0)x.b0()
return null},
$S:1}
B.kK.prototype={
$1(d){var x=this.a
x.si(x.gi().j_(!x.gi().f))
if(x.gi().r&&x.gi().a.length!==0)x.b0()
return null},
$S:1}
B.kL.prototype={
$1(d){var x=this.a
x.si(x.gi().iS(!x.gi().r))
return null},
$S:1}
B.kM.prototype={
$0(){this.a.si(C.B)
return C.B},
$S:0}
B.kN.prototype={
$0(){return this.a.b0()},
$S:0}
B.kO.prototype={
$1(d){var x
A.y(d)
x=this.a
x.si(x.gi().j5(d,D.p.U(d).length))
if(x.gi().r)x.b0()
return null},
$S:6};(function installTearOffs(){var x=a._static_0,w=a._instance_0u
x(B,"xU","v5",1)
w(B.cz.prototype,"gd8","aq",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.fR,[B.hT,B.hU])
w(B.bm,A.k)
w(B.cz,E.ce)
w(B.d0,A.w)
x(A.cA,[B.kE,B.kF,B.kG,B.kH,B.kI,B.kM,B.kN])
x(A.aw,[B.kJ,B.kK,B.kL,B.kO])})()
A.jH(b.typeUniverse,JSON.parse('{"cz":{"ce":["bm"],"a3":["bm","bm"],"a3.0":"bm","a3.1":"bm"},"d0":{"w":[],"m":[]}}'))
var y={i:A.T("dT"),E:A.T("cz"),p:A.T("bm"),F:A.T("q<m>"),w:A.T("n<f>"),y:A.T("cl"),e:A.T("f"),q:A.T("k?")};(function constants(){C.ae=new A.hS(!0)
C.A=new A.dT(C.ae)
C.k=new B.hT(0,"encode")
C.t=new B.hT(1,"decode")
C.C=new B.hU(0,"standard")
C.B=new B.bm("","",C.k,C.C,!1,!0,!0,null,0,0,!1,null)
C.u=new B.hU(1,"urlSafe")})();(function lazyInitializers(){var x=a.lazyFinal
x($,"zv","uS",()=>E.q8(B.xU(),y.E,y.p))})()};
(a=>{a["8udv+Xgy4+sjLOBOjy3md4iOp2A="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_7.part.js.map
