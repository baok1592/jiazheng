<template>
	<view class="ditu">
		<view class="ditu-main">
			<view class="ditu-top">
				<map class="map" v-if="is_show_map" id="map" :longitude="longitude" :scale="zoom" :latitude="latitude" :markers="markers" :polyline="polyline"></map>
				<!-- <image class="ditu-img" src="../static/ditu.png" mode=""></image> -->
				<!-- <el-amap class="map" id="ditu"></el-amap> -->
			</view>
			<view class="ditu-section">
				<u-time-line>
					<u-time-line-item nodeTop="2" v-if="state == 2">
						<template v-slot:node>
							<view class="u-node" style="background: #19be6b;">
								<u-icon name="pushpin-fill" color="#fff" :size="24"></u-icon>
							</view>
						</template>
						<template v-slot:content>
							<view>
								<view class="u-order-title">当前位置</view>
								<view class="u-order-desc">
									{{location_now || '暂无更新'}}
								</view>
								<view class="u-order-time">2019-05-08 12:12</view>
							</view>
						</template>
					</u-time-line-item>
					<u-time-line-item nodeTop="2">
						<!-- 此处自定义了左边内容，用一个图标替代 -->
						<template v-slot:node>
							<view class="u-node" style="background: #19be6b;">
								<!-- 此处为uView的icon组件 -->
								<u-icon name="pushpin-fill" color="#fff" :size="24"></u-icon>
							</view>
						</template>
						<template v-slot:content>
							<view>
								<view class="u-order-title">起始地</view>
								<view class="u-order-desc">
									{{location_start}}
								</view>
								<view class="u-order-time">2019-05-08 12:12</view>
							</view>
						</template>
					</u-time-line-item>
					<u-time-line-item nodeTop="2">
						<template v-slot:node>
							<view class="u-node" style="background: #19be6b;">
								<u-icon name="pushpin-fill" color="#fff" :size="24"></u-icon>
							</view>
						</template>
						<template v-slot:content>
							<view>
								<view class="u-order-title">目的地</view>
								<view class="u-order-desc">
									{{location_end}}
								</view>
								<view class="u-order-time">2019-05-08 12:12</view>
							</view>
						</template>
					</u-time-line-item>
				</u-time-line>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		data () {
			return {
				is_show_map: false,
				map: {},
				longitude: 104.919096,
				latitude: 25.103308,
				center: [104.919096, 25.103308],
				zoom: 7,
				key: this.config.map_key,
				markers_list: [
					{
						id: 1,
						// longitude: 104.922352,
						// latitude: 25.103961,
						longitude: 0,
						latitude: 0,
						iconPath: '../static/map-end.png',
						width: 50,
						height: 50
					},
					{
						id: 1,
						// longitude: 104.922352,
						// latitude: 25.103961,
						longitude: 0,
						latitude: 0,
						iconPath: '../static/map.png',
						width: 50,
						height: 50
					}
				],
				markers: [
					{
						id: 1,
						longitude: 0,
						latitude: 0,
						iconPath: '../static/map-start.png',
						width: 50,
						height: 50
					}
				],
				polyline: [{
					points: [
						// {longitude: 104.916591, latitude: 25.101824},
						// {longitude: 104.916902, latitude: 25.102368},
						// {longitude: 104.920056, latitude: 25.101134},
						// {longitude: 104.921537, latitude: 25.104243},
						// {longitude: 104.922352, latitude: 25.103961},
					],
					width: 5,
					arrowLine: true,
					color: "#ff0000",
				}],
				lineArr: [
					[104.916591, 25.101824],
					[104.916902, 25.102368],
					[104.920056, 25.101134],
					[104.921537, 25.104243],
					[104.922352, 25.103961],
				],
				location_now: '',
				location_start: '',
				location_end: '',
				state: -1,
			}
		},
		created() {
			// this.getLocation();
		},
		onLoad(option) {
			if(option.id) {
				this.getTrack(option.id);
			}
		},
		mounted() {
			let _this = this;
			// setTimeout(() => {
			// 	// _this.initMap();
			// 	_this.init();
			// }, 500);
			// this.init();
		},
		// onShow() {
		// 	this.init();
		// },
		methods: {
			// 获取当前坐标
			getLocation() {
				let longitude = 0;
				let latitude = 0;
				let that = this;
				uni.getLocation({
					type: 'gcj02',
					success: function(res) {
						that.longitude = res.longitude;
						that.latitude = res.latitude;
					}
				})
			},
			// 通过订单 id 查询车辆轨迹
			getTrack (id) {
				const _this = this;
				let lineArr = [];
				let startPoint = [];
				let endPoint = [];
				this.mapModel.getTrack(id).then(res => {
					if(res.status == 200) {
						let dat = res.data;
						_this.location_now = dat.now_address;
						_this.location_start = dat.send_address;
						_this.location_end = dat.received_address;
						_this.state = dat.state;
						
						dat.positions.forEach(item => {
							lineArr.push(item);
						})
						startPoint = dat.positions[0];
						endPoint = dat.positions[dat.positions.length - 1];
						if(dat.state == 2) {
							_this.markers.push(_this.markers_list[1]);
						}
						else {
							_this.markers.push(_this.markers_list[0]);
						}
						
						_this.markers[0].longitude	= startPoint[0];
						_this.markers[0].latitude	= startPoint[1];
						_this.markers[1].longitude	= endPoint[0];
						_this.markers[1].latitude	= endPoint[1];
						
						_this.polyline[0].points = [];
						let temp_data = [];
						lineArr.forEach(item => {
							let temp_ll = {};
							temp_ll.longitude = item[0];
							temp_ll.latitude = item[1];
							temp_data.push(temp_ll);
							temp_ll = {};
						})
						_this.polyline[0].points = temp_data;
						_this.is_show_map = true;
					}
				})
			},
			init () {
				// console.log('获取数据中')
				const _this = this;
				//---------
				// this.map = uni.createMapContext('map', this);
				//---------
				let lineArr = [];
				let startPoint = [];
				let endPoint = [];
				this.mapModel.getTrsearch({
					tid: '318004500',
					trid: '40',
					sid: '217457',
					key: _this.key,
				}).then(res => {
					if(res.errcode == 10000) {
						let dat = res.data.tracks[0];
						startPoint = dat.startPoint.location.split(',');
						endPoint = dat.endPoint.location.split(',');
						dat.points.forEach(item => {
							lineArr.push(item.location.split(','));
						})
						
						_this.markers[0].longitude	= startPoint[0];
						_this.markers[0].latitude	= startPoint[1];
						_this.markers[1].longitude	= endPoint[0];
						_this.markers[1].latitude	= endPoint[1];
						
						_this.polyline[0].points = [];
						let temp_data = [];
						lineArr.forEach(item => {
							let temp_ll = {};
							temp_ll.longitude = item[0];
							temp_ll.latitude = item[1];
							temp_data.push(temp_ll);
							temp_ll = {};
						})
						// for(let i = 0; i < lineArr.length; i++)
						// {
						// 	let temp_ll = {};
						// 	temp_ll.longitude = lineArr[i][0];
						// 	temp_ll.latitude = lineArr[i][1];
						// 	temp_data.push(temp_ll);
						// 	temp_ll = {};
						// }
						_this.polyline[0].points = temp_data;
						_this.is_show_map = true;
						// console.log('数据获取成功')
					}
				})
			},
			// 高德地图初始化
			initMap() {
				let _this = this;
				let lineArr = [];
				let startPoint = [];
				let endPoint = [];
				this.mapModel.getTrsearch({
					tid: '318004500',
					trid: '40',
					sid: '217457',
					key: _this.key,
				}).then(res => {
					let dat = res.data.tracks[0];
					startPoint = dat.startPoint.location.split(',');
					lineArr.push(startPoint);
					dat.points.forEach(item => {
						lineArr.push(item.location.split(','));
					})
					endPoint = dat.endPoint.location.split(',');
					lineArr.push(endPoint);
					// console.log(lineArr);
					_this.map = new AMap.Map('ditu', {
						zoom: _this.zoom,
						center: startPoint,
					})
					_this.polyline = new AMap.Polyline({
						map: _this.map,
						path: lineArr,
						strokeColor: "#d8182b",
					})
					_this.markers = new AMap.Marker({
						map: _this.map,
						position: startPoint,
					})
					_this.markers = new AMap.Marker({
						map: _this.map,
						position: endPoint,
					})
				})
			},
		}
	}
</script>
<style scoped lang="scss">
	.ditu{
		display: flex;
		justify-content: center;
		align-items: center;
		.ditu-main{
			width: 100%;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			.ditu-top{
				width: 100%;
				height: 600upx;
				display: flex;
				// flex-direction: column;
				justify-content: center;
				align-items: center;
				// border: 1upx solid orange;
				// background-image: url(../static/ditu.png);
				background-repeat: no-repeat;
				background-size: cover;
				overflow: hidden;
				.map {
					width: 100%;
					height: 100%;
				}
				.ditu-img {
					width: 100%;
					height: 100%;
				}
			}
			.ditu-section{
				width: 100%;
				display: flex;
				height: 630upx;
				// flex-direction: column;
				// justify-content: center;
				// align-items: center;
				// border: 1upx solid orange;
				overflow: scroll;
				padding-left: 40upx;
				padding-right: 40upx;
				margin-top: 20upx;
				.u-node {
					width: 44upx;
					height: 44upx;
					border-radius: 100upx;
					display: flex;
					justify-content: center;
					align-items: center;
					background: #d0d0d0;
				}
				.u-order-title {
					color: #333333;
					font-weight: bold;
					font-size: 32upx;
				}
				.u-order-desc {
					color: rgb(150, 150, 150);
					font-size: 28upx;
					margin-bottom: 6upx;
					margin-top: 20rpx;
				}
				.u-order-time {
					color: rgb(200, 200, 200);
					font-size: 26upx;
				}
			}
		}
	}
</style>