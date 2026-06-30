((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,B={
r2(d){return new B.hK(d,null)},
hK:function hK(d,e){this.c=d
this.a=e},
ki:function ki(d){this.a=d},
vG(){return new B.cH()},
bq:function bq(d,e,f,g,h,i,j){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j},
cH:function cH(){this.b=null},
m0:function m0(){},
m1:function m1(d){this.a=d},
vF(){return new B.db(null)},
db:function db(d){this.a=d},
lT:function lT(d){this.a=d},
lU:function lU(d){this.a=d},
lV:function lV(d){this.a=d},
lW:function lW(d){this.a=d},
lX:function lX(d){this.a=d},
lY:function lY(d){this.a=d},
lZ:function lZ(d){this.a=d},
m_:function m_(d){this.a=d},
y1(d,e){var x,w,v,u,t
if(d.length===0)return
x={type:"application/json"}
w=b.G
v=A.o(new w.Blob(A.a([d],y.s),x))
u=A.y(w.URL.createObjectURL(v))
t=A.o(w.document.createElement("a"))
t.href=u
t.download=e
t.click()
w.URL.revokeObjectURL(u)}},E,D
J=c[1]
A=c[0]
C=c[2]
B=a.updateHolder(c[3],B)
E=c[10]
D=c[7]
B.hK.prototype={
v(d){var x,w,v=null,u="0 0 24 24",t=y.N,s=A.M(["data-text-end","Downloaded!","data-text-initial","Download file"],t,t),r=y.i
s=A.v(A.a([],r),s,"tooltip",v)
x=A.M(["height","20","width","20","fill","none","stroke","currentColor","stroke-width","2","stroke-linecap","round","stroke-linejoin","round"],t,t)
x=D.pM(A.a([new A.N("path",v,v,v,A.M(["d","M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"],t,t),v,A.a([],r),v),new A.N("polyline",v,v,v,A.M(["points","7 10 12 15 17 10"],t,t),v,A.a([],r),v),new A.N("line",v,v,v,A.M(["x1","12","y1","15","x2","12","y2","3"],t,t),v,A.a([],r),v)],r),x,"clipboard",u)
w=A.M(["style","enable-background:new 0 0 512 512","y","0","x","0","height","18","width","18","version","1.1","xml:space","preserve"],t,t)
t=A.M(["fill","currentColor"],t,t)
return A.aX(A.a([s,A.v(A.a([x,D.pM(A.a([new A.N("g",v,v,v,v,v,A.a([D.qJ(A.a([],r),t,"M9.707 19.121a.997.997 0 0 1-1.414 0l-5.646-5.647a1.5 1.5 0 0 1 0-2.121l.707-.707a1.5 1.5 0 0 1 2.121 0L9 14.171l9.525-9.525a1.5 1.5 0 0 1 2.121 0l.707.707a1.5 1.5 0 0 1 0 2.121z")],r),v)],r),w,"checkmark",u)],r),v,v,v)],r),v,"copy",v,new B.ki(this),v)}}
B.bq.prototype={
aE(d,e,f,g,h,i,j,k){var x,w,v,u,t=this,s=h==null?t.a:h,r=j==null?t.b:j
if(e)x=null
else x=f==null?t.c:f
w=i==null?t.d:i
v=d==null?t.e:d
u=g==null?t.f:g
return new B.bq(s,r,x,w,v,u,k==null?t.r:k)},
iW(d){var x=null
return this.aE(x,!1,x,x,d,x,x,x)},
eV(d,e){var x=null
return this.aE(x,d,x,x,x,x,e,x)},
j4(d,e){var x=null
return this.aE(x,!1,d,x,x,x,e,x)},
j3(d,e){var x=null
return this.aE(x,!1,d,x,e,x,x,x)},
iV(d){var x=null
return this.aE(x,!1,x,d,x,x,x,x)},
iZ(d){var x=null
return this.aE(x,!1,x,x,x,x,x,d)},
iX(d){var x=null
return this.aE(x,!1,x,x,x,d,x,x)},
iR(d){var x=null
return this.aE(d,!1,x,x,x,x,x,x)},
gk5(){var x,w,v,u=this.b
if(u.length===0)return"0 lines \u2022 0 B"
x=u.split("\n").length
w=C.p.U(u).length
v=w<1024?""+w+" B":C.e.dA(w/1024,1)+" KB"
return""+x+" lines \u2022 "+v}}
B.cH.prototype={
aq(){return E.I},
d_(d){var x,w,v,u,t
if(y.P.b(d)){x=d.gN()
w=x.aT(x)
C.b.bd(w,new B.m0())
v=A.C(y.N,y.z)
for(x=w.length,u=0;u<w.length;w.length===x||(0,A.K)(w),++u){t=w[u]
v.k(0,t,this.d_(d.n(0,t)))}return v}else if(y.j.b(d)){x=J.r_(d,new B.m1(this),y.z)
x=A.al(x,x.$ti.h("a1.E"))
return x}return d},
aL(){var x,w,v,u,t,s,r,q=this
if(C.a.ad(q.gi().a).length===0){q.si(q.gi().eV(!0,""))
return}try{x=C.D.f0(q.gi().a,null)
if(q.gi().r)x=q.d_(x)
w=C.a.aB(" ",q.gi().f)
v=q.gi().d?C.D.jf(x,null):A.t0(x,null,w)
q.si(q.gi().eV(!0,v))}catch(s){u=A.R(s)
r=J.aU(u)
t=A.hI(r,"FormatException: ","")
q.si(q.gi().j4("Invalid JSON: "+A.l(t),""))}}}
B.db.prototype={
v(d){var x,w,v,u,t,s,r,q,p=null,o="tool-checkbox-label",n="input",m="custom-checkbox",l="btn-secondary",k="tool-editor-col tool-relative",j="tool-editor-header",i="tool-editor-label",h="tool-header-actions",g=$.uV(),f=D.qa(d,g,y.l)
g=g.gdq()
x=A.iK(d,!1)
w=y.b.a(A.b2.prototype.gu.call(x)).d.du(g,y.h)
g=y.i
x=A.au(A.a([A.cY(A.a([A.v(A.a([new A.ak("/",p)],g),p,"accent",p),new A.ak("json-formatter",p)],g),"hero-title"),A.U(A.a([new A.ak("format-validate-minify-and-sort-json-data.",p)],g),"hero-subtitle",p)],g),"glass-wrap")
v=f.e
u=y.X
t=D.bv(A.a([A.ba(p,v,n,p,new B.lT(w),p,p,C.j,p,u),A.v(A.a([],g),p,m,p),new A.ak("Auto-format",p)],g),o)
s=D.bv(A.a([A.ba(p,f.d,n,p,new B.lU(w),p,p,C.j,p,u),A.v(A.a([],g),p,m,p),new A.ak("Minify",p)],g),o)
u=D.bv(A.a([A.ba(p,f.r,n,p,new B.lV(w),p,p,C.j,p,u),A.v(A.a([],g),p,m,p),new A.ak("A-Z Sort",p)],g),o)
r=f.f
r=A.a([t,s,u,A.ul(A.a([A.pH(A.a([new A.ak("2 Spaces",p)],g),r===2,"2"),A.pH(A.a([new A.ak("4 Spaces",p)],g),r===4,"4")],g),"tool-select",new B.lW(w))],g)
if(!v)r.push(A.aX(A.a([new A.ak("Format",p)],g),p,"btn-primary",p,new B.lX(w),p))
r.push(A.aX(A.a([new A.ak("Sample Data",p)],g),p,l,p,new B.lY(w),p))
r.push(A.aX(A.a([new A.ak("Clear",p)],g),p,l,p,new B.lZ(w),p))
v=A.i(r,"tool-controls",p,p)
u=A.v(A.a([new A.ak("Input",p)],g),p,i,p)
t=f.a
u=A.i(A.a([u,A.i(A.a([new D.bN(t,p),B.r2(t)],g),h,p,p)],g),j,p,p)
s=f.c
r=s!=null
q=r?"tool-textarea-error":""
q=A.a([u,A.k7(A.a([new A.ak(t,p)],g),!1,"tool-textarea "+q,p,new B.m_(w),"Paste your JSON here...",!1,!1)],g)
if(r)q.push(A.U(A.a([new A.ak(s,p)],g),"tool-error",p))
u=A.i(q,k,p,p)
t=A.U(A.a([new A.ak("Output",p)],g),i,p)
s=A.v(A.a([new A.ak(f.gk5(),p)],g),p,"tool-stats",p)
r=f.b
return A.i(A.a([x,A.au(A.a([v,A.i(A.a([u,A.i(A.a([A.i(A.a([t,A.i(A.a([s,new D.bN(r,p),B.r2(r)],g),h,p,p)],g),j,p,p),A.k7(A.a([new A.ak(r,p)],g),!1,"tool-textarea tool-textarea-readonly",p,p,"Formatted JSON will appear here...",!0,!1)],g),k,p,p)],g),"tool-editor-wrap",p,p)],g),p)],g),"container gap-60",p,p)}}
var z=a.updateTypes(["bq()","cH()"])
B.ki.prototype={
$0(){return B.y1(this.a.c,"download.json")},
$S:0}
B.m0.prototype={
$2(d,e){return C.a.aD(A.y(d).toLowerCase(),A.y(e).toLowerCase())},
$S:95}
B.m1.prototype={
$1(d){return this.a.d_(d)},
$S:14}
B.lT.prototype={
$1(d){var x=this.a
x.si(x.gi().iR(!x.gi().e))
if(x.gi().e&&x.gi().a.length!==0)x.aL()
return null},
$S:1}
B.lU.prototype={
$1(d){var x=this.a
x.si(x.gi().iX(!x.gi().d))
if(x.gi().a.length!==0&&x.gi().c==null)x.aL()
return null},
$S:1}
B.lV.prototype={
$1(d){var x=this.a
x.si(x.gi().iZ(!x.gi().r))
if(x.gi().a.length!==0&&x.gi().c==null)x.aL()
return null},
$S:1}
B.lW.prototype={
$1(d){var x=this.a,w=A.fb(y.a.a(d),y.N)
w=A.c0(w==null?"":w,null)
x.si(x.gi().iV(w))
if(x.gi().a.length!==0&&!x.gi().d&&x.gi().c==null)x.aL()
return null},
$S:22}
B.lX.prototype={
$0(){return this.a.aL()},
$S:0}
B.lY.prototype={
$0(){var x=this.a
x.si(x.gi().j3(null,'{"version":1.0,"type":"Web Framework","project":"Jaspr","isAwesome":true,"features":["SSR","CSR","Riverpod"],"nested":{"z":1,"a":2}}'))
x.aL()
return null},
$S:0}
B.lZ.prototype={
$0(){this.a.si(E.I)
return E.I},
$S:0}
B.m_.prototype={
$1(d){var x
A.y(d)
x=this.a
x.si(x.gi().iW(d))
if(x.gi().e)x.aL()
return null},
$S:6};(function installTearOffs(){var x=a._static_0,w=a._instance_0u
x(B,"yi","vG",1)
w(B.cH.prototype,"gd8","aq",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.w,[B.hK,B.db])
x(A.cA,[B.ki,B.lX,B.lY,B.lZ])
w(B.bq,A.k)
w(B.cH,D.ce)
w(B.m0,A.dW)
x(A.aw,[B.m1,B.lT,B.lU,B.lV,B.lW,B.m_])})()
A.jH(b.typeUniverse,JSON.parse('{"hK":{"w":[],"m":[]},"cH":{"ce":["bq"],"a3":["bq","bq"],"a3.0":"bq","a3.1":"bq"},"db":{"w":[],"m":[]}}'))
var y=(function rtii(){var x=A.T
return{i:x("q<m>"),s:x("q<d>"),h:x("cH"),l:x("bq"),a:x("n<d>"),j:x("n<@>"),P:x("P<d,@>"),N:x("d"),b:x("cl"),z:x("@"),X:x("k?")}})();(function constants(){E.I=new B.bq("","",null,!1,!0,2,!1)})();(function lazyInitializers(){var x=a.lazyFinal
x($,"zz","uV",()=>D.q8(B.yi(),y.h,y.l))})()};
(a=>{a["6xcX7WPdqHWb3vTU+Lv97UWZj18="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_2.part.js.map
