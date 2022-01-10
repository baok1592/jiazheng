<template>
	<view class="index">
		<!-- logo -->
		<view class="logo">
			<image class="img" src="../../static/logo.jpg" mode=""></image>
		</view>
		<!-- 轮播图 -->
		<view class="index_header">
			<u-swiper :list="list" img-mode="scaleToFill"></u-swiper>
		</view>
		
		<div class="index_body">
			<!-- 第一部分 -->
			<view class="index_body_top">
				<!-- <view class="index_body_top_image" v-if="auth != 'admin' && auth != 'driver'">
					<view class="index_body_top_1" @click="jump_huoyuan('search')" :style="{'width': auth == 'buy'?'100%':'47%'}">
						<view class="index_body_top_1_1">
							<text>查快递</text>
						</view>
					</view>
					<view class="index_body_top_2" @click="jump_huoyuan('order')" v-if="auth != 'buy'">
						<view class="index_body_top_2_1">
							<text>下单</text>
						</view>
					</view>
				</view> -->
				<!-- 通知 -->
				<view class="index_body_top_message">
					<view class="index_body_top_message_right">
						<u-notice-bar :is-circular="false" :duration="5000" mode="horizontal" :list="message"></u-notice-bar>
					</view>
				</view>
			</view>
			<!-- 第二部分 -->
			<!-- <view class="pic-upload" v-if="auth == 'driver'" @tap="useCamera">
				<text>上传回单</text>
			</view> -->
			<view class="t-btn t-btn_1 t-btn_text_lag" @tap="jump_huoyuan('search')">
				<text>运单查询</text>
			</view>
			<view class="t-btn t-btn_text_lag" @tap="jump_upload">
				<text>回单上传</text>
			</view>
			<!-- <view class="index_body_section" v-if="auth != 'seller' && auth != 'buy' && auth != 'driver'">
				<view class="index_body_section_top">
					<text>常用功能</text>
				</view>
				<view class="index_body_section_foot">
					<view class="index_body_section_foot_1" @click="jump_park" v-if="auth == 'driver'">
						<view class="index_body_section_foot_1_top">
							<i class="iconfont icontingchechang1"></i>
						</view>
						<view class="index_body_section_foot_1_foot">
							<text style="display:flex; justify-content: center; align-items: center;">
								<template>
									停车场
								</template>
							</text>
						</view>
					</view>
					<view class="index_body_section_foot_1" @tap="jump_jiayou">
						<view class="index_body_section_foot_1_top">
							<template v-if="auth == 'driver'">
								<i class="iconfont icongas-station"></i>
							</template>
							<template v-else>
								<i class="iconfont iconmaijia1"></i>
							</template>
						</view>
						<view class="index_body_section_foot_1_foot">
							<text style="display:flex; justify-content: center; align-items: center;">
								<template v-if="auth == 'driver'">
									加油
								</template>
								<template v-else>
									新增计划
								</template>
							</text>
						</view>
					</view>
					<view class="index_body_section_foot_1" @click="jump_shouru">
						<view class="index_body_section_foot_1_top">
							<template v-if="auth == 'driver'">
								<i class="iconfont iconshouru"></i>
							</template>
							<template v-else>
								<i class="iconfont iconmaijia2"></i>
							</template>
						</view>
						<view class="index_body_section_foot_1_foot">
							<text style="display:flex; justify-content: center; align-items: center;">
								<template v-if="auth == 'driver'">
									收入
								</template>
								<template v-else>
									车辆调度
								</template>
							</text>
						</view>
					</view>
					<view class="index_body_section_foot_1" @click="jump_chedui" v-if="auth != 'driver'">
						<view class="index_body_section_foot_1_top">
							<i class="iconfont iconchedui"></i>
						</view>
						<view class="index_body_section_foot_1_foot">
							<text style="display:flex; justify-content: center; align-items: center;">财务统计</text>
						</view>
					</view>
				</view>
			</view> -->
			<!-- 第三部分 -->
			<view class="index_body_message" v-if="auth != 'driver'">
				<template v-for="(item,index) in news">
					<view class="index_body_message_1" @tap="jump_newsDetail(item.id)">
						<!-- 左边部分 -->
						<view class="index_body_message_1_left">
							<u-image :src="item.img" width="100%" height="100%"></u-image>
						</view>
						<!-- 右边部分 -->
						<view class="index_body_message_1_right">
							<!-- 上 -->
							<view class="index_body_message_1_right_top">
								<text>{{item.title}}</text>
							</view>
							<!-- 下 -->
							<view class="index_body_message_1_right_top_botton">
								<text>{{item.summary}}</text>
							</view>
						</view>
					</view>
				</template>
				
			</view>
		</div>
		<!-- <tabbar></tabbar> -->
		<!-- <u-back-top :scroll-top="scrollTop"></u-back-top> -->
		<!-- <re></re> -->
	</view>
</template>
<script>
	// import tabbar from "../../components/tabbar.vue"
	// import re from "../../components/return.vue"
	export default {
		components: {
			// tabbar,
			// re
		},
		data() {
			return {
				api: this.config.Api_url,
				auth: "",
				// 轮播数据
				list: [],
				message: [],
				// 新闻数据
				news: [],
				name: '',
				nbTitle: '标题',
				titleIcon: '/static/logo.png',
				titleIconRadius: '20px',
				subtitleText: 'subtitleText',
				nbLoading: false,
				nbFrontColor: '#000000',
				nbBackgroundColor: '#ffffff',
			}
		},
		mounted() {
			// this.auth = uni.getStorageSync('name');
			this.getBannerAll();
			this.getNoticeAll();
			this.getArticleAll();
		},
		onLoad() {
			if(uni.getStorageSync('name')) {
				uni.removeStorageSync('name');
			}
		},
		onShow() {
			  wx.hideHomeButton();
		},
		methods: {
			// 获取新闻列表
			getArticleAll() {
				const _this = this;
				this.publicModel.getArticleAll().then(res => {
					_this.news = res.data;
				})
			},
			// 获取所有广告
			getBannerAll() {
				const _this = this;
				this.publicModel.getBannerAll().then(res => {
					_this.list = res.data;
					for(let i = 0; i < _this.list.length; i++)
					{
						_this.list[i].image = _this.api + _this.list[i].url;
					}
				})
			},
			// 获取所有通知
			getNoticeAll() {
				const _this = this;
				this.publicModel.getNoticeAll().then(res => {
					for(let k in res.data)
					{
						_this.message.push(res.data[k].content);
					}
				})
			},
			// 跳转 司机
			jump_siji() {
				uni.navigateTo({
					url: "../../admin/driverlist"
				})
			},
			// 跳转 车队
			jump_chedui() {
				// 车队
				// uni.navigateTo({
				// 	url: "../../admin/cars"
				// })
				// 车队 end
			},
			// 跳转 订单
			jump_dindan() {
				uni.navigateTo({
					url: "../../admin/adminindex"
				})
				// uni.switchTab({
				// 	url: "../../admin/adminindex"
				// })
			},
			// 跳转 收入
			jump_shouru() {
				if(uni.getStorageSync('name') == 'admin') {
					// uni.navigateTo({
					// 	url: "../../admin/peopleList/peopleList?type=seller"
					// })
					uni.navigateTo({
						url: "../../admin/adminindex?swiperCurrent=1"
					})
				}
				// else if(uni.getStorageSync('name') == 'driver') {
				// 	uni.navigateTo({
				// 		url: "../../driver/drawal/drawal"
				// 	})
				// }
			},
			// 跳转 停车场
			jump_park() {
				uni.navigateTo({
					url: "../../admin/parkinglot"
				})
			},
			// 跳转 加油
			jump_jiayou() {
				// 新增计划
				uni.navigateTo({
					url: '../../buyseller/huoyuan/huoyuan'
				})
			},
			// 跳转 新闻详细
			jump_newsDetail(id) {
				uni.navigateTo({
					url: '../newsDetail/newsDetail?id=' + id
				})
			},
			// 查快递	下单 查快递
			jump_huoyuan(flag) {
				if(flag == 'order') {
					uni.navigateTo({
						url: "../../buyseller/huoyuan/huoyuan"
					})
				}
				else if(flag == 'search') {
					uni.navigateTo({
						url: "../../buyseller/buy"
					})
				}
			},
			// 跳转 回单上传
			jump_upload() {
				uni.navigateTo({
					url: '../picUpload/picUpload'
				})
			}
		},
		onShareAppMessage() {
			return {
				title: '永顺物流',
				path: '/pages/index/index'
			}
		},
		onPullDownRefresh() {
			setTimeout(function () {
				uni.stopPullDownRefresh();
			}, 1000);
		},
	}
</script>
<style scoped lang="scss">
	
	.index {
		width: 100vw;
		// min-height: 100vh;
		// border: 1upx solid orange;
		display: flex;
		flex-flow: column;
		// justify-content: center;
		align-items: center;
		box-sizing: border-box;
		padding: .5vw;
		background-color: #fff;
		border-radius: 15upx;
		overflow: scroll;
		padding-bottom: 120rpx;
		.logo {
			height: 180rpx;
			width: 100%;
			background-color: #ddd;
			overflow: hidden;
			display: flex;
			justify-content: center;
			align-items: center;
			.img {
				width: 100%;
			}
		}
		// 导航
		.navbar {}
		// 轮播图
		.index_header {
			width: 94vw;
			height: 18vh;
			// border: 1upx solid orange;
			// box-sizing: border-box;
			border-radius: 15upx;
			margin-top: 1vh;
			// padding-left: 40upx;
			// padding-right: 40upx;
			margin-bottom: 10rpx;
		}
		.index_body {
			width: 94vw;
			// height: 95%;
			// border: 1upx solid orange;
			margin-top: 40upx;
			border-radius: 15upx;
			display: flex;
			flex-flow: column;
			justify-content: center;
			align-items: center;
			// 中间第一部分
			.index_body_top {
				width: 100%;
				height: 31%;
				// border: 1upx solid orange;
				display: flex;
				flex-flow: column;
				justify-content: center;
				align-items: center;
				.index_body_top_image {
					width: 100%;
					// height: 60%;
					// border: 1upx solid orange;
					margin-bottom: 3%;
					display: flex;
					justify-content: space-between;
					align-items: center;
					.index_body_top_1 {
						width: 47%;
						// height: 95%;
						// border: 1upx solid orange;
						display: flex;
						flex-flow: column;
						justify-content: center;
						align-items: center;
						background-color: #f19066;
						border-radius: 15upx;
						color: white;
						// 内部文字
						.index_body_top_1_1 {
							width: 80%;
							height: 60px;
							display: flex;
							justify-content: center;
							align-items: center;
							// height: 25%;
							// border: 1upx solid orange;
							text {
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								opacity: .8;
								font-size: 1.1em;
							}
						}
						.index_body_top_1_2 {
							width: 80%;
							
							// height: 25%;
							// border: 1upx solid orange;
							padding-left: 20upx;
							text {
								font-size: 35upx;
								font-weight: bold;
							}
						}
					}
					.index_body_top_2 {
						width: 47%;
						// height: 95%;
						// border: 1upx solid orange;
						background-color: #63cdda;
						border-radius: 15upx;
						display: flex;
						flex-flow: column;
						justify-content: center;
						align-items: center;
						color: white;
						.index_body_top_2_1 {
							width: 80%;
							// height: 25%;
							height: 60px;
							display: flex;
							justify-content: center;
							align-items: center;
							// border: 1upx solid orange;
							text {
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								opacity: .8;
								font-size: 1.1em;
							}
						}
						.index_body_top_2_2 {
							width: 80%;
							height: 25%;
							// border: 1upx solid orange;
							padding-left: 20upx;
							text {
								font-size: 35upx;
								font-weight: bold;
							}
						}
					}
				}
				.index_body_top_message {
					width: 100%;
					height: 32%;
					display: flex;
					justify-content: space-between;
					align-items: center;
					.index_body_top_message_right {
						width: 100%;
						height: 95%;
						border-radius: 15upx;
						// border: 1upx solid orange;
					}
				}
			}
			// 中间第二部分
			.index_body_section {
				width: 100%;
				margin-top: 40rpx;
				background-color: white;
				// border-radius: 15upx;
				// padding: 10rpx;
				// background-color: #f19066;
				border-top: 2rpx solid #eee;
				border-bottom: 2rpx solid #eee;
				// box-shadow: 0 0 4rpx 0rpx #f19066 inset;
				
				i {
					font-size: 1.5em;
					color: #f19066;
				}
				
				.index_body_section_top {
					width: 100%;
					height: 20%;
					display: flex;
					justify-content: space-between;
					align-items: center;
					margin-bottom: 40rpx;
					// background-color: #eee;
					border-bottom: 1px solid #eee;
					color: #777;
					text {
						padding: 10upx;
						font-family: Arial, Helvetica, sans-serif;
						font-weight: bold;
					}
					text:nth-child(2) {
						opacity: .6;
					}
				}
				.index_body_section_foot {
					width: 100%;
					height: 78%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: row;
					flex-wrap: wrap;
					justify-content: start;
					align-items: center;
					.index_body_section_foot_1 {
						width: 21%;
						// height: 40%;
						// border: 1upx solid orange;
						display: flex;
						flex-flow: column;
						justify-content: center;
						align-items: center;
						margin-bottom: 30rpx;
						margin-right: 5%;
						&:nth-child(4n) {
							margin-right: 0;
						}
						.index_body_section_foot_1_top {
							width: 90rpx;
							height: 90rpx;
							// border: 1upx solid orange;
							margin-bottom: 10upx;
							display: flex;
							justify-content: center;
							align-items: center;
							border-radius: 50%;
							// background-color: blue;
							box-shadow: 0upx 0upx 10upx 0upx #f1caaf inset;
						}
						.index_body_section_foot_1_foot {
							width: 90%;
							height: 20%;
							// border: 1upx solid orange;
							margin-top: 12upx;
							// display: flex;
							// justify-content: center;
							// align-items: center;
							text {
								font-family: Arial, Helvetica, sans-serif;
								font-size: 28upx;
								font-weight: bold;
							}
						}
					}
				}
			}
			// 中间第三部分
			.index_body_message {
				width: 100%;
				margin-top: 20px;
				// height: 31%;
				// border: 1upx solid orange;
				display: flex;
				flex-flow: column;
				justify-content: center;
				align-items: center;
				font-size: 1.3rem;
				
				.index_body_message_1 {
					width: 96%;
					// height: 48%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: space-around;
					align-items: center;
					// background-color: white;
					border-bottom: 1px solid #eee;
					padding: 20rpx 0;
					margin-bottom: 20rpx;
					// * {
					// 	border: 1px solid red;
					// }
					// &:last-child {
					// 	border-bottom: none;
					// }
					// 左边部分
					.index_body_message_1_left {
						width: 50px;
						height: 50px;
						// border: 1upx solid orange;
						border-radius: 15upx;
					}
					// 右边部分
					.index_body_message_1_right {
						width: 75%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						flex-flow: column;
						justify-content: space-around;
						align-items: center;
						.index_body_message_1_right_top {
							width: 95%;
							height: 40%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							margin-bottom: 10rpx;
							text {
								font-family: Arial, Helvetica, sans-serif;
								font-weight: bold;
								font-weight: 30upx;
								text-overflow: ellipsis;
								white-space: nowrap;
								overflow: hidden;
								color: #444;
							}
						}
						.index_body_message_1_right_top_botton {
							width: 95%;
							height: 30%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 2;
								overflow: hidden;
								font-family: Arial, Helvetica, sans-serif;
								font-size: 1rem;
								color: #aaa;
							}
						}
					}
				}
				.index_body_message_2 {
					width: 96%;
					height: 2%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
				}
				.index_body_message_3 {
					width: 96%;
					height: 48%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: space-around;
					align-items: center;
					.index_body_message_1_left {
						width: 18%;
						height: 70%;
						// border: 1upx solid orange;
						border-radius: 15upx;
					}
					// 右边部分
					.index_body_message_1_right {
						width: 75%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						flex-flow: column;
						justify-content: space-around;
						align-items: center;
						.index_body_message_1_right_top {
							width: 95%;
							height: 40%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								font-family: Arial, Helvetica, sans-serif;
								font-weight: bold;
								font-weight: 30upx;
							}
						}
						.index_body_message_1_right_top_botton {
							width: 95%;
							height: 30%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								font-family: Arial, Helvetica, sans-serif;
								font-weight: bold;
								opacity: .8;
							}
						}
					}
				}
			}
		}
		// .index_tabbar {
		// 	width: 94vw;
		// 	height: 12vh;
		// 	border: 1upx solid orange;
		// 	margin-top: 2vh;
		// }
	}
	
	.pic-upload {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 150rpx;
		width: 400rpx;
		height: 400rpx;
		border-radius: 50%;
		box-shadow: 0 0 50rpx 0 #888;
		font-size: 1.5em;
		background-color: #2979FF;
		color: white;
	}
	
	// 需求二
	.t-btn {
		width: 100%;
		margin-top: 30rpx;
		box-shadow: 0 0 6rpx 0 #888;
		border-radius: 15rpx;
		background-color: #2979FF;
		padding: 30rpx 10rpx;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
		&_1 {
			background-color: #f19066;
		}
		&_2 {
			background-color: #2979FF;
		}
		&_text_lag {
			font-size: 1.3rem;
		}
	}
	// 需求二 end
</style>
