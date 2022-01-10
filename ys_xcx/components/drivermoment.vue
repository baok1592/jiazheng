<template>
	<!-- 司机列表 -->
	<view class="drivermoment">
		<view class="drivermoment-left">
			<image src="../static/mayun.jpg" mode="aspectFill" style="width: 100%; height: 100%;" @click="jump_personal"></image>
		</view>
		<view class="drivermoment-center">
			<view class="drivermoment-center-top">
				<text @click="jump_personal">颜如玉</text>
			</view>
			<view class="drivermoment-center-bt">
				<text>严于律己，刻苦学习！！</text>
			</view>
		</view>
		<view class="drivermoment-right">
			<u-icon name="arrow-right" @click="jump_personal"></u-icon>
		</view>
	</view>
</template>
<script>
	export default {
		props: {
			type: {
				type: String
			},
		},
		data() {
			return {
			};
		},
		methods:{
			jump_personal(){
				if(this.type == 'driverList') {
					uni.navigateTo({
						url:"../admin/driver/driver"
					})
				}
				else if(this.type == 'cars') {
					uni.navigateTo({
						url:"../admin/carDetail/carDetail"
					})
				}
				
			}
		}
	}
</script>
<style lang="scss">
	.drivermoment{
		// * {
		// 	border: 1px solid red;
		// }
		width: 100%;
		height:170upx ;
		display: flex;
		justify-content: space-around;
		align-items: center;
		// border: 1upx solid orange;
		border-bottom: 2upx solid $uni-border-color ;
		.drivermoment-left{
			width: 110rpx;
			height: 110rpx;
			// border: 1upx solid orange;
			border-radius: 50%;
			overflow: hidden;
		}
		.drivermoment-center{
			width: 50%;
			height: 80%;
			// border: 1upx solid orange;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			.drivermoment-center-top{
				width: 100%;
				height: 40%;
				// border: 1upx solid orange;
				text{
					font-size: 28upx;
					font-weight: bold;
					font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
				}
			}
			.drivermoment-center-bt{
				width: 100%;
				height: 40%;
				// border: 1upx solid orange;
				text{
					font-size: 24upx;
					opacity: .6;
					font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
					display: flex;
					flex-direction: row;
					justify-content: flex-start;
					justify-items: center;
				}
			}
		}
		.drivermoment-right{
			width: 15%;
			height: 80%;
			// border: 1upx solid orange;
			display: flex;
			justify-content: flex-end;
			align-items: center;
		}
	}
</style>
