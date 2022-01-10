<template>
	<view class="drivermsg">
		<driverMessage></driverMessage>
		<view class="btn">
			<!-- <u-button type="success" @tap="jump_map">查看详情</u-button> -->
			<button type="primary" @tap="jump_map">查看详情</button>
		</view>
	</view>
</template>
<script>
	import driverMessage from "../components/driverMessage.vue"
	export default {
		onShow() {
			wx.hideHomeButton();
		},
		components:{
			driverMessage
		},
		methods: {
			jump_map() {
				uni.navigateTo({
					url: '../buyseller/ditu'
				})
			}
		}
	}
</script>
<style scoped lang="scss">
	.drivermsg{
		width: 100%;
		// height: 100%;
		min-height: 100vh;
		padding-top: 20rpx;
		background-color: #f3f4f6;
		
		.btn {
			width: 100%;
			display: flex;
			justify-content: center;
			margin-top: 40rpx;
			button {
				display: flex;
				justify-content: center;
				align-items: center;
				font-size: 1rem;
				width: 90%;
				height: 90rpx;
			}
		}
	}
</style>