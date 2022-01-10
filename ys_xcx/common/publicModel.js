import http from '@/main.js'

// 上传回单
function uploadImg(data) {
	let url = '/admin/common/user_sign';
	return rePOST(url, data);
}

// 根据单号查询订单
function searchOrder(order_num) {
	let url = '/user/order/get_order_by_num';
	return reGET(url, {order_num: order_num});
}

// 获取所有广告
function getBannerAll() {
	let url = '/admin/banner/get_all';
	return reGET(url);
}

//-----------通知
// 获取所有通知
function getNoticeAll() {
	let url = 'admin/common/get_notice';
	return reGET(url);
}

//-----------文章
// 获取所有文章
function getArticleAll() {
	let url = '/admin/common/article/get_all_article';
	return reGET(url);
}

// 获取单个文章信息
function getArticleByID(id) {
	let url = '/admin/common/article/get_one_article';
	return reGET(url, {id: id});
}

//-----------返回结果
function reGET(url, data) {
	return http.$u.get(url, data).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}
function rePOST(url, data) {
	return http.$u.post(url, data).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}
function rePUT(url, data) {
	return http.$u.put(url, data).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}
function reDELETE(url, data) {
	return http.$u.delete(url, data).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}

//----------同步返回结果
async function reAsyncGET(url, data) {
	return await http.$u.get(url).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}
async function reAsyncPOST(url, data) {
	return await http.$u.post(url).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}

export default {
	uploadImg, // 上传回单
	searchOrder, // 根据单号查询订单
	getBannerAll, // 获取所有广告
	getNoticeAll, // 获取所有通知
	getArticleAll, // 获取所有文章
	getArticleByID, // 获取单个文章信息
}