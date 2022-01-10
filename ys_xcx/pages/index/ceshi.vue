<template>
	<view class="ceshi">
		<view class="ceshi-main">
			<view class="ceshi-btn" @click="jump_login('buy')">
				<!-- <u-button type="success" size="medium" :ripple="true" @click="jump_login('buy')">买家</u-button> -->
				<!-- <button type="primary">买家</button> -->
				买家
			</view>
			<view class="ceshi-btn" @click="jump_login('seller')">
				<!-- <u-button type="primary" size="medium" :ripple="true" @click="jump_login('seller')">卖家</u-button> -->
				卖家
			</view>
			<view class="ceshi-btn" @click="jump_login('driver')">
				<!-- <u-button type="warning" size="medium" :ripple="true" @click="jump_login('driver')">司机</u-button> -->
				司机
			</view>
			<!-- <view class="ceshi-btn" @click="jump_login('admin')">
				管理
			</view> -->
		</view>
	</view>
</template>
<script>
	export default {
		methods: {
			// 跳转login
			jump_login(name) {
				uni.setStorageSync('name', name)
				if(name == 'buy') {
					// 买家无需登录
					// this.$u.route({
					// 	url: '/pages/index/index',
					// 	type: 'reLaunch',
					// })
					uni.reLaunch({
						url: "./index"
					})
				}
				else {
					this.$u.route({
						url: '/pages/user/user',
						type: 'navigateTo',
					})
				}
			},
			jump_admin() {
				uni.setStorageSync('name', "admin")
				this.$u.route({
					url: '/pages/index/index',
					type: 'navigateTo',
				})
			},
			jump_driver() {
				uni.setStorageSync('name', "driver");
				this.$u.route({
					url: '/pages/index/index',
					type: 'navigateTo'
				})
			},
			jump_buy() {
				uni.setStorageSync('name', "buy");
				this.$u.route({
					url: '/pages/index/index',
					type: 'navigateTo'
				})
			},
			jump_seller() {
				uni.setStorageSync('name', "seller");
				this.$u.route({
					url: '/pages/index/index',
					type: 'reLaunch'
				})
			},
		},
		onShareAppMessage() {
			return {
				title: '永顺物流',
				path: '/pages/index/ceshi'
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
	.ceshi {
		width: 100vw;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-wrap: wrap;
		padding-top: 50rpx;
		.ceshi-main {
			width: 90%;
			display: flex;
			justify-content: space-between;
			flex-wrap: wrap;
			.ceshi-btn {
				display: flex;
				justify-content: center;
				align-items: center;
				color: white;
				font-size: 1.1rem;
				width: 46%;
				height: 400rpx;
				margin-bottom: 30rpx;
				box-shadow: 0 0 10rpx 0 #bbb;
				&:nth-child(1) {
					background-color: #1AAD19;
				}
				&:nth-child(2) {
					background-color: #2979FF;
				}
				&:nth-child(3) {
					background-color: #FF9900;
				}
				&:nth-child(4) {
					background-color: #FA3534;
				}
				
				.btn {
					display: block;
					width: 100%;
					height: 100%;
					margin-bottom: 20rpx;
					font-size: 1.5em;
					button {
						width: 100% !important;
						height: 100% !important;
					}
				}
				button {
					display: flex;
					justify-content: center;
					align-items: center;
					border-radius: 0;
					width: 100% !important;
					height: 100% !important;
				}
			}
		}
	}
</style>
