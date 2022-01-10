import Vue from 'vue'
import uView from "uview-ui";
import MapModel from './common/mapModel.js'
import PublicModel from './common/publicModel.js';
import Config from './common/config.js'


Vue.use(uView);
Vue.prototype.mapModel = MapModel;
Vue.prototype.publicModel = PublicModel;
Vue.prototype.config = Config;


import App from './App'

Vue.config.productionTip = false

App.mpType = 'app'

const app = new Vue({
    ...App
})

// http拦截器，此为需要加入的内容，如果不是写在common目录，请自行修改引入路径
import httpInterceptor from '@/common/http.interceptor.js'
// 这里需要写在最后，是为了等Vue创建对象完成，引入"app"对象(也即页面的"this"实例)
Vue.use(httpInterceptor, app)

app.$mount()

export default app