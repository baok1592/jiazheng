import http from '../main.js'

// 查询轨迹
const getTrsearch = function(data) {
	let url = 'https://tsapi.amap.com/v1/track/terminal/trsearch';
	return reGET(url, data);
}

// 通过订单 id 查询车辆轨迹
const getTrack = function(id) {
	let url = '/map/get_trace';
	return reGET2(url, {id: id});
}

// ----------返回结果
function reGET(url, data) {
	return new Promise((resolve, reject) => {
		uni.request({
			url: url,
			method: 'GET',
			data: data,
			success(res) {
				resolve(res.data);
			},
			fail(err) {
				reject(err);
			}
		})
	})
}

//-----------返回结果
function reGET2(url, data) {
	return http.$u.get(url, data).then(res => {
		return res;
	}).catch(err => {
		return err;
	});
}

export default {
	getTrsearch,
	getTrack,
}