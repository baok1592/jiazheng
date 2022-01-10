<template>
	<view class="driver" @click="jump_xiangqing">
		<!-- 单组件布局 -->
		<view class="driver-main">
			<!-- 左边部分 -->
			<view class="driver-left">
				<!-- 中间部分 -->
				<view class="driver-left-center">
					<!-- 日期 -->
					<view class="driver-left-center-day">
						<text>19</text>
					</view>
					<!-- 月 -->
					<view class="driver-left-center-mouth">
						<text>6月</text>
						<!-- <h1>6月</h1> -->
					</view>
				</view>
			</view>
			<!-- 右边部分 -->
			<view class="driver-right">
				<!-- 右边部分上 -->
				<view class="driver-right-0">
					<text>货物编号： 103213-312321</text>
					<u-line color="info" style="opacity: .5;"/>
				</view>
				<!-- 右边部分中 -->
				<view class="driver-right-1">
					<view class="driver-right-1-center">
						<view class="driver-right-1-center-0">
							<view class="driver-right-1-center-0-top">
								<text>温州市</text>
							</view>
							<view class="driver-right-1-center-0-bt">
								<text>鹿城区</text>
							</view>
						</view>
						<view class="driver-right-1-center-1">
							<view class="driver-right-1-center-1-image">
							<image src="../static/jiantou.png" style="width: 100%; height: 100%;"></image>
							</view>
						</view>
						<view class="driver-right-1-center-2">
							<view class="driver-right-1-center-2-top">
								<text>武汉市</text>
							</view>
							<view class="driver-right-1-center-2-bt">
								<text>武昌区</text>
							</view>
						</view>
					</view>
				</view>
				<!-- 右边部分下 -->
				<view class="driver-right-2">
					<view class="driver-right-2-top">
						<u-line color="info"  style="opacity: .5;"/>
					</view>
					<view class="driver-right-2-buttom">
						<text>整车</text>
						<text>泡货</text>
						<text>重货</text>
						<text>10吨</text>
						<text>30方</text>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		methods:{
			jump_xiangqing(){
				let type = uni.getStorageSync('name');
				if(type == 'seller') {
					uni.navigateTo({
						url:"../driver/drivermsg"
					})
				}
				else if(type == 'driver') {
					uni.navigateTo({
						url:"../driver/detailed/detailed"
					})
				}
				else if(type == 'admin') {
					uni.navigateTo({
						url:"../../driver/detailed/detailed"
					})
				}
				
			}
		}
	}
</script>
<style scoped lang="scss">
	.driver {
		width: 100%;
		// height: 300upx;
		// border: 1upx solid orange;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin-top: 40upx;
		.driver-main {
			width: 94%;
			height: 300upx;
			// border: 1upx solid red;
			display: flex;
			justify-content: center;
			align-items: center;
			// box-sizing: border-box;
			border-radius: 25upx;
			box-shadow: 2upx 2upx 10upx #dcdfe6;
			// background-clip: border-box;
			overflow: hidden;
			.driver-left {
				width: 15%;
				height: 100%;
				// border: 1upx solid #2979ff;
				display: flex;
				justify-content: center;
				align-items: center;
				background-color: $ys-primary;
				// border-radius: 25upx;
				.driver-left-center {
					width: 60%;
					height: 35%;
					// border: 1upx solid #2979ff;
					.driver-left-center-day {
						width: 100%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							color: white;
							font-size: 40upx;
							font-weight: bold;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
						}
					}
					.driver-left-center-mouth {
						width: 100%;
						height: 40%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: flex-start;
						text {
							color: white;
							font-size: 20upx;
							font-weight: bold;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							opacity: .8;
							letter-spacing: 5upx;
						}
					}
				}
			}
			.driver-right {
				width: 85%;
				height: 100%;
				// border: 1upx solid #2979ff;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				.driver-right-0 {
					width: 100%;
					height: 25%;
					// border: 1upx solid orange;
					padding-left: 4%;
					padding-right: 4%;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: flex-start;
					text {
						margin-bottom: 15upx;
						font-weight: bold;
						font-size: 20upx;
						color: $ys-primary;
					}
					;
				}
				.driver-right-1 {
					width: 100%;
					height: 50%;
					// border: 1upx solid orange;
					// display: flex;
					// flex-direction: row;
					// justify-content: center;
					// align-items: center;
					.driver-right-1-center {
						width: 100%;
						height: 100%;
						box-sizing: border-box;
						display: flex;
						justify-content: center;
						align-items: center;
						.driver-right-1-center-0 {
							width: 20%;
							height: 80%;
							display: flex;
							flex-direction: column;
							justify-content: center;
							align-items: center;
							// border: 1upx solid orange;
							.driver-right-1-center-0-top{
								width: 100%;
								height: 50%;
								// border: 1upx solid orange;
								display: flex;
								// flex-direction: column;
								justify-content: center;
								align-items: center;
								text{
									font-size: 30upx;
									font-weight: bold;
									opacity: .8;
								}
							}
							.driver-right-1-center-0-bt{
								width: 100%;
								height: 50%;
								// border: 1upx solid orange;
								display: flex;
								// flex-direction: column;
								justify-content: center;
								align-items: flex-start;
								text{
									font-size: 20upx;
									font-weight: bold;
									opacity: .8;
								}
							}
						}
						.driver-right-1-center-1 {
							width: 30%;
							height: 80%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: center;
							align-items: flex-start;
							.driver-right-1-center-1-image{
								width: 100%;
								height: 40%;
							}
						}
						.driver-right-1-center-2 {
							width: 20%;
							height: 80%;
							// border: 1upx solid orange;
							.driver-right-1-center-2-top{
								width: 100%;
								height: 50%;
								// border: 1upx solid orange;
								display: flex;
								// flex-direction: column;
								justify-content: center;
								align-items: center;
								text{
									font-size: 30upx;
									font-weight: bold;
									opacity: .8;
								}
							}
							.driver-right-1-center-2-bt{
								width: 100%;
								height: 50%;
								// border: 1upx solid orange;
								display: flex;
								// flex-direction: column;
								justify-content: center;
								align-items: flex-start;
								text{
									font-size: 20upx;
									font-weight: bold;
									opacity: .8;
								}
							}
						}
					}
				}
				.driver-right-2 {
					width: 100%;
					height: 25%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					// padding-left: 10%;
					.driver-right-2-top {
						width: 100%;
						height: 10%;
						// border: 1upx solid orange;
						display: flex;
						// flex-direction: column;
						justify-content: center;
						align-items: flex-start;
						padding-left: 4%;
						padding-right: 4%;
					}
					.driver-right-2-buttom {
						width: 100%;
						height: 90%;
						// border: 1upx solid orange;
						padding-left: 4%;
						padding-right: 4%;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						text {
							font-size: 25upx;
							font-weight: bold;
							margin-left: 15upx;
							opacity: .6;
						}
						text:nth-child(1) {
							background-color: $ys-primary;
							border-radius: 15upx;
							color: white;
							display: flex;
							justify-content: center;
							align-items: center;
							width: 100upx;
							opacity: 1;
						}
					}
				}
			}
		}
	}
</style>
