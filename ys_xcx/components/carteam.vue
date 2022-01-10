<template>
	<view class="carteam" @click="jump_driver">
		<view class="carteam-main">
			<view class="carteam-main-left">
				<view class="carteam-main-left-1">
					<view class="carteam-main-left-1-1">
						<text>北京</text>
					</view>
					<view class="carteam-main-left-1-2">
						<u-icon name="arrow-rightward" color="#2979ff" size="28"></u-icon>
					</view>
					<view class="carteam-main-left-1-3">
						<text>深圳</text>
					</view>
				</view>
				<view class="carteam-main-left-2">
					<view class="carteam-main-left-2-left">
						<text>车辆编号：</text>
					</view>
					<view class="carteam-main-left-2-right">
						<text>YS46464</text>
					</view>
				</view>
				<view class="carteam-main-left-2">
					<view class="carteam-main-left-2-left">
						<text>司机：</text>
					</view>
					<view class="carteam-main-left-2-right">
						<text>王旭</text>
					</view>
				</view>
				<view class="carteam-main-left-2">
					<view class="carteam-main-left-2-left">
						<text>预计到达时间：</text>
					</view>
					<view class="carteam-main-left-2-right">
						<text>2020-12-21 18：30</text>
					</view>
				</view>
			</view>
			<!-- <view class="carteam-main-right">
				<text>运输中</text>
			</view> -->
		</view>
	</view>
</template>
<script>
	export default {
		data() {
			return {
			};
		},
		methods:{
			jump_driver(){
				uni.navigateTo({
					url:"../driver/driver"
				})
			}
		}
	}
</script>
<style lang="scss">
	.carteam{
		width: 100%;
		height: 300upx;
		// border: 1upx solid orange;
		margin-top: 10%;
		border-radius: 15upx;
		padding: 5%;
		box-shadow: 5upx 5upx 25upx $uni-border-color;
		.carteam-main{
			// border: 1upx solid orange;
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: space-between;
			align-items: center;
			position: relative;
			.carteam-main-left{
				// border: 1upx solid orange;
				width: 1000%;
				height: 100%;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				align-items: center;
				.carteam-main-left-1{
					// border: 1upx solid orange;
					width: 100%;
					height: 33%;
					display: flex;
					justify-content: flex-start;
					align-items: center;
					.carteam-main-left-1-1{
						// border: 1upx solid orange;
						width: 30%;
						height: 90%;
						display: flex;
						justify-content: center;
						align-items: center;
						// margin-left: 10%;
						text{
							font-size: 32upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							font-weight: bold;
						}
					}
					.carteam-main-left-1-2{
						// border: 1upx solid orange;
						width: 15%;
						height: 90%;
						display: flex;
						justify-content: flex-start;
						align-items: center;
					}
					.carteam-main-left-1-3{
						// border: 1upx solid orange;
						width: 40%;
						height: 90%;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						text{
							font-size: 32upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							color: orange;
							font-weight: bold;
						}
					}
				}
				.carteam-main-left-2{
					// border: 1upx solid orange;
					width:100%;
					height: 18%;
					display: flex;
					justify-content: space-between;
					align-items: center;
					.carteam-main-left-2-left{
						// border: 1upx solid orange;
						width:40%;
						height: 100%;
						// padding: 5%;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						text{
							font-size: 24upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							color: $uni-text-color-grey;
						}
					}
					.carteam-main-left-2-right{
						// border: 1upx solid orange;
						width:55%;
						height: 100%;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						text{
							font-size: 24upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
						}
					}
				}
			}
			// .carteam-main-right{
			// 	// border: 1upx solid orange;
			// 	width: 20%;
			// 	height: 100%;
			// 	display: flex;
			// 	justify-content: center;
			// 	align-items: center;
			// 	text{
			// 		font-size: 28upx;
			// 		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			// 		color:$uni-color-warning ;
			// 	}
			// }
		}
	}
</style>
