(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-49089c58"],{"18d7":function(t,o,s){"use strict";s.r(o);var e=function(){var t=this,o=t.$createElement,s=t._self._c||o;return s("div",{staticClass:"root"},[s("div",{staticClass:"noprint"},[s("div",{staticClass:"pair_head"},[s("el-row",{staticStyle:{padding:"15px"}},[s("el-col",{staticStyle:{"text-align":"left"},attrs:{span:12}},[s("el-button",{attrs:{type:"primary",size:"mini"},on:{click:t.back}},[t._v("返回")])],1)],1)],1)]),s("div",{staticClass:"pair_body"},[t._m(0),s("div",{staticClass:"body_item_02"},[s("table",{staticStyle:{margin:"0 auto","text-align":"center"},attrs:{cellspacing:"0",cellpadding:"0",border:""}},[s("col",{attrs:{width:"166"}}),s("col",{attrs:{width:"182",span:"3"}}),s("col",{attrs:{width:"143"}}),s("col",{attrs:{width:"85"}}),s("col",{attrs:{width:"108"}}),s("col",{attrs:{width:"95"}}),s("tr",[s("td",{attrs:{width:"166"}},[t._v("进厂日期：")]),s("td",{attrs:{colspan:"3",width:"216"}},[s("el-date-picker",{staticStyle:{width:"100%"},attrs:{size:"mini",type:"date",placeholder:"选择日期","value-format":"yyyy-MM-dd"},model:{value:t.form.in_time,callback:function(o){t.$set(t.form,"in_time",o)},expression:"form.in_time"}})],1),s("td",{attrs:{width:"143"}},[t._v("出厂日期：")]),s("td",{attrs:{colspan:"3",width:"288"}},[s("el-date-picker",{staticStyle:{width:"100%"},attrs:{size:"mini",type:"date",placeholder:"选择日期","value-format":"yyyy-MM-dd"},model:{value:t.form.out_time,callback:function(o){t.$set(t.form,"out_time",o)},expression:"form.out_time"}})],1)]),s("tr",[s("td",[t._v("车牌号：")]),s("td",{attrs:{colspan:"2"}},[s("el-input",{attrs:{size:"mini"},model:{value:t.form.car_num,callback:function(o){t.$set(t.form,"car_num",o)},expression:"form.car_num"}})],1),s("td",[t._v("司机姓名：")]),s("td",[s("el-input",{attrs:{size:"mini"},model:{value:t.form.dirver,callback:function(o){t.$set(t.form,"dirver",o)},expression:"form.dirver"}})],1),s("td",[t._v("联系电话：")]),s("td",{attrs:{colspan:"2"}},[s("el-input",{staticStyle:{width:"100%"},attrs:{size:"mini"},model:{value:t.form.tel,callback:function(o){t.$set(t.form,"tel",o)},expression:"form.tel"}})],1)]),s("tr",[s("td",{attrs:{rowspan:"3"}},[t._v("车辆故障描述：")]),s("td",{attrs:{colspan:"7",rowspan:"3"}},[s("textarea",{directives:[{name:"model",rawName:"v-model",value:t.form.question_des,expression:"form.question_des"}],staticStyle:{width:"99%","min-height":"70px"},domProps:{value:t.form.question_des},on:{input:function(o){o.target.composing||t.$set(t.form,"question_des",o.target.value)}}})])]),s("tr"),s("tr"),t._m(1),t._l(t.goods,(function(o,e){return s("tr",[s("td",[t._v(t._s(e+1))]),s("td",[s("el-select",{attrs:{size:"mini",placeholder:"请选择"},on:{change:function(o){return t.change_select(e,o)}},model:{value:t.goods[e].lpj,callback:function(o){t.$set(t.goods[e],"lpj",o)},expression:"goods[index].lpj"}},t._l(t.group_goods,(function(t){return s("el-option",{key:t.id,attrs:{label:t.num,value:t.num}})})),1)],1),s("td",[t._v("\n\t\t\t\t\t\t"+t._s(t.goods[e].sku)+"\n\t\t\t\t\t")]),s("td",[s("el-input",{staticStyle:{width:"100%"},attrs:{size:"mini"},model:{value:t.goods[e].num,callback:function(o){t.$set(t.goods[e],"num",o)},expression:"goods[index].num"}})],1),s("td",[t._v("\n\t\t\t\t\t\t"+t._s(t.goods[e].uni_price)+"\n\t\t\t\t\t")]),s("td",[t._v("\n\t\t\t\t\t\t"+t._s(t.uni_total[e])+"\n\t\t\t\t\t\t")]),s("td",[s("el-input",{staticStyle:{width:"100%"},attrs:{size:"mini"},model:{value:t.goods[e].wx,callback:function(o){t.$set(t.goods[e],"wx",o)},expression:"goods[index].wx"}})],1),s("td",[s("el-input",{staticStyle:{width:"100%"},attrs:{size:"mini"},model:{value:t.goods[e].gs_money,callback:function(o){t.$set(t.goods[e],"gs_money",o)},expression:"goods[index].gs_money"}})],1)])})),s("tr",[s("td",[t._v("零配件费用合计：")]),s("td",{staticStyle:{padding:"10px"},attrs:{colspan:"5"}},[t._v(t._s(t.lpj_total))]),s("td",[t._v("工时费合计：")]),s("td",[t._v(t._s(t.gsf_total))])]),s("tr",[s("td",{staticStyle:{padding:"10px"},attrs:{colspan:"8"}},[t._v("总合计大写:_______万______仟_____佰______元______角______分（总合计小写：___"+t._s(t.lpj_total+t.gsf_total)+"___元）")])]),s("tr",{staticStyle:{"text-align":"left"}},[s("td",{staticStyle:{padding:"10px"},attrs:{colspan:"8",rowspan:"4",width:"813"}},[t._v("备注："),s("br"),s("textarea",{directives:[{name:"model",rawName:"v-model",value:t.form.msg,expression:"form.msg"}],staticStyle:{width:"99%","min-height":"70px"},domProps:{value:t.form.msg},on:{input:function(o){o.target.composing||t.$set(t.form,"msg",o.target.value)}}})])]),s("tr"),s("tr"),s("tr"),t._m(2),s("tr"),s("tr")],2)])]),s("div",{staticClass:"pair_foot"},[s("div",{staticClass:"btn_01"},[s("el-button",{attrs:{size:"mini",type:"primary"},on:{click:t.goods_add}},[t._v("配件数量+")]),t.goods.length>1?s("el-button",{attrs:{size:"mini",type:"primary"},on:{click:t.goods_reduce}},[t._v("配件数量-")]):t._e()],1),s("div",{staticClass:"btn_02"},[s("el-button",{attrs:{size:"mini",type:"primary"},on:{click:t.submit}},[t._v("提交")])],1)])])},i=[function(){var t=this,o=t.$createElement,s=t._self._c||o;return s("div",{staticClass:"body_item_01"},[s("div",{staticClass:"body_item_01_1"},[s("div",{staticStyle:{"font-size":"30px"}},[t._v("车辆维修单")])])])},function(){var t=this,o=t.$createElement,s=t._self._c||o;return s("tr",[s("td",[t._v("序号")]),s("td",[t._v("零配件编号")]),s("td",[t._v("规格")]),s("td",[t._v("数量")]),s("td",[t._v("单价")]),s("td",[t._v("小计")]),s("td",[t._v("维修、保养")]),s("td",[t._v("工时费")])])},function(){var t=this,o=t.$createElement,s=t._self._c||o;return s("tr",[s("td",{staticStyle:{padding:"10px"},attrs:{colspan:"8",rowspan:"3"}},[t._v("司机（签字）：  ____________维修人员（签字）：_____________收银员（签字）：________________")])])}],n={data:function(){return{group_goods:[],form:{},goods:[{lpj:"",sku:"",num:"",uni_price:"",uni_total:"",wx:"",gs_money:""}]}},computed:{uni_total:function(){var t=0,o=[];for(var s in this.goods){var e=this.goods[s];t=1*e.num*(1*e.uni_price),e.uni_total=t,o.push(t)}return o},lpj_total:function(){var t=0;for(var o in this.goods){var s=this.goods[o];t+=s.uni_total}return this.form.lpj_total=t,t},gsf_total:function(){var t=0;for(var o in this.goods){var s=this.goods[o];t+=1*s.gs_money}return this.form.gsf_total=t,t}},mounted:function(){this.get_group_goods()},methods:{change_select:function(t,o){for(var s in console.log(t,o),this.group_goods){var e=this.group_goods[s];e.num==o&&(this.goods[t].sku=e.model,this.goods[t].uni_price=e.price)}},get_group_goods:function(){var t=this;this.http.get("admin/parts/get_parts?group=20").then((function(o){t.group_goods=o.data}))},submit:function(){var t=this;this.form["goods"]=this.goods,this.form.total_money=this.lpj_total+this.gsf_total;var o={json:this.form};console.log(o),this.http.post_show("admin/car_repaire/add_repaire",o).then((function(o){t.$message({message:"开单成功",type:"success"}),setTimeout((function(){t.$router.push({path:"/pair_show",query:{id:o.data.id}})}),2e3)}))},goods_add:function(){this.goods.push({lpj:"",sku:"",num:"",uni_price:"",uni_total:"",wx:"",gs_money:""})},goods_reduce:function(){this.goods.splice(this.goods.length-1,1)},back:function(){this.$router.go(-1)},do_print:function(){window.print()}}},a=n,r=(s("20fc"),s("cba8")),_=Object(r["a"])(a,e,i,!1,null,null,null);o["default"]=_.exports},"20fc":function(t,o,s){"use strict";s("d85e")},d85e:function(t,o,s){}}]);