<template>
<view class="admin-header">
	<!-- 搜索框 -->
	<view class="search">
		<u-search placeholder="输入订单号" @custom="search" @search="search" v-model="search_value"></u-search>
	</view>
	<view class="admin-header-top">
		<view class="admin-header-top-1">
			<!-- 分片 -->
			<u-tabs-swiper class="tabs-swiper" :current="current" @change="tabsChange" ref="tabs" :list="list" :is-scroll="false"></u-tabs-swiper>
			
			<swiper :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish" class="swiper">
				<swiper-item class="swiper-item" v-for="(item, index) in tabs" :key="index">
					<scroll-view scroll-y style="height: 100%">
						<view class="order-lists">
							<template v-for="i in 10">
								<admin class="list" :type="current"></admin>
							</template>
						</view>
						
					</scroll-view>
				</swiper-item>
			</swiper>
			<!-- 筛选 -->
			<!-- <view class="admin-header-top-1-div">
				<picker mode="date" :value="time_start" @change="changeTimeStart">
					<view class="uni-input">
						<text>始发地</text>
						<u-icon name="arrow-down" style="margin-left: 20upx;"></u-icon>
					</view>
				</picker>
			</view>
			<view class="admin-header-top-1-div">
				<picker mode="date" :value="time_end" @change="changeTimeEnd">
					<view class="uni-input">
						<text>目的地</text>
						<u-icon name="arrow-down" style="margin-left: 20upx;"></u-icon>
					</view>
				</picker>
			</view>
			<view class="admin-header-top-1-div">
				<text>高级筛选</text>
			</view> -->
		</view>
	</view>
	<!-- <view class="order-lists">
		<template v-for="i in 10">
			<admin></admin>
		</template>
	</view> -->
	<tabbar></tabbar>
</view>
</template>
<script>
	import admin from "../components/admin.vue"
	import tabbar from "../components/tabbar.vue"
	
	export default {
		components:{
			admin,
			tabbar,
		},
		data() {
			return {
				show: false,
				show2: false,
				// 保存筛选初始时间
				time_start: '',
				// 保存筛选结束时间
				time_end: '',
				// 模拟数据
				dat_temp: [],
				// 搜索关键词
				search_value: '',
				// 分片数据
				list: [
					{
						name: '所有计划'
					},
					{
						name: '待调度'
					},
					{
						name: '运输中',
					},
					{
						name: '已完成',
					},
				],
				tabs: [
					{
						name: '所有计划'
					},
					{
						name: '待调度'
					},
					{
						name: '运输中',
					},
					{
						name: '已完成',
					},
				],
				// 当前分片所在位置
				current: 0,
				swiperCurrent: 0,
			}
		},
		onLoad(options) {
			if(options.swiperCurrent) {
				this.swiperCurrent = Number(options.swiperCurrent);
				// #ifdef APP-PLUS
				this.current = Number(options.swiperCurrent);
				// #endif
			}
		},
		onShow() {
			wx.hideHomeButton();
		},
		methods: {
			// 改变筛选初始时间
			changeTimeStart(e) {
				this.time_start = e.detail.value;
				this.screenEff('yes');
			},
			// 改变筛选初始时间
			changeTimeEnd(e) {
				this.time_end = e.detail.value;
				this.screenEff('yes');
			},
			// 筛选
			screenEff() {
				console.log('start:', this.time_start)
				console.log('end:', this.time_end)
				
				let start = '';
				let end = '';
				start = new Date(Date.parse(this.time_start.replace(/-/g, '/')));
				end = new Date(Date.parse(this.time_end.replace(/-/g, '/')));
				
				if(this.time_start == '') {
					console.log('<< end')
				}
				else if(this.time_end == '') {
					console.log('>> start')
				}
				else {
					if(start.getTime() > end.getTime()) {
						console.log('start > end')
					}
					else {
						console.log('start < end')
					}
				}
			},
			// 搜索
			search(value) {
				console.log(value)
			},
			// 分片改变
			tabsChange(index) {
				this.swiperCurrent = index;
			},
			// swiper-item左右移动，通知tabs的滑块跟随移动
			transition(e) {
				let dx = e.detail.dx;
				this.$refs.tabs.setDx(dx);
			},
			// 由于swiper的内部机制问题，快速切换swiper不会触发dx的连续变化，需要在结束时重置状态
			// swiper滑动结束，分别设置tabs和swiper的状态
			animationfinish(e) {
				let current = e.detail.current;
				// this.$refs.uTabs.setFinishCurrent(current);
				this.swiperCurrent = current;
				this.current = current;
			},
		},
	}
</script>
<style scoped lang="scss">
	.admin-header{
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
		height: 100vh;
		
		.search {
			margin-top: 20rpx;
			margin-bottom: 20rpx;
			width: 90%;
		}
		
		.admin-header-top{
			width: 100%;
			height: 100%;
			// height: 70upx;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			.admin-header-top-1{
				width: 100%;
				height: 100%;
				border-bottom: 1upx solid #dcdfe6 ;
				display: flex;
				flex-direction: column;
				align-items: center;
				
				.tabs-swiper {
					width: 100%;
				}
				
				// swiper
				.swiper {
					width: 100%;
					height: 100%;
					margin-top: 20rpx;
					
					.list {
						margin-top: 40rpx;
						&:last-child {
							margin-bottom: 40rpx;
						}
					}
					
					.order-lists {
						padding-bottom: 100rpx;
					}
				}
				// swiper end
				
				.admin-header-top-1-div{
					width: 33%;
					height: 100%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
					text{
						font-family: Arial, Helvetica, sans-serif;
						font-size: 20upx;
						font-weight: bold;
					}
				}
			}
			// .admin-header-top-2{
			// 	width: 100%;
			// 	height: 50%;
			// 	// border: 1upx solid orange;
			// 	border-bottom: 1upx solid#dcdfe6 ;
			// 	display: flex;
			// 	justify-content: space-between;
			// 	align-items: center;
			// 	.admin-header-top-2-div{
			// 		width: 33%;
			// 		height: 100%;
			// 		// border: 1upx solid orange;
			// 		display: flex;
			// 		justify-content: center;
			// 		align-items: center;
			// 		text{
			// 			font-family: Arial, Helvetica, sans-serif;
			// 			font-size: 20upx;
			// 			font-weight: bold;
			// 		}
			// 	}
			// }
		}
	}
</style>