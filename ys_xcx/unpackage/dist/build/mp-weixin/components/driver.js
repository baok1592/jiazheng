(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/driver"],{"45ca":function(e,n,t){"use strict";(function(e){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var t={methods:{jump_xiangqing:function(){var n=e.getStorageSync("name");"seller"==n?e.navigateTo({url:"../driver/drivermsg"}):"driver"==n?e.navigateTo({url:"../driver/detailed/detailed"}):"admin"==n&&e.navigateTo({url:"../../driver/detailed/detailed"})}}};n.default=t}).call(this,t("543d")["default"])},"4cc1":function(e,n,t){},7423:function(e,n,t){"use strict";t.r(n);var r=t("45ca"),u=t.n(r);for(var i in r)"default"!==i&&function(e){t.d(n,e,(function(){return r[e]}))}(i);n["default"]=u.a},9250:function(e,n,t){"use strict";var r=t("4cc1"),u=t.n(r);u.a},b53b:function(e,n,t){"use strict";t.d(n,"b",(function(){return u})),t.d(n,"c",(function(){return i})),t.d(n,"a",(function(){return r}));var r={uLine:function(){return t.e("node-modules/uview-ui/components/u-line/u-line").then(t.bind(null,"85e9"))}},u=function(){var e=this,n=e.$createElement;e._self._c},i=[]},f34a:function(e,n,t){"use strict";t.r(n);var r=t("b53b"),u=t("7423");for(var i in u)"default"!==i&&function(e){t.d(n,e,(function(){return u[e]}))}(i);t("9250");var a,c=t("f0c5"),o=Object(c["a"])(u["default"],r["b"],r["c"],!1,null,"5b6b3697",null,!1,r["a"],a);n["default"]=o.exports}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/driver-create-component',
    {
        'components/driver-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('543d')['createComponent'](__webpack_require__("f34a"))
        })
    },
    [['components/driver-create-component']]
]);
