<template>
	<!-- 司机消息主要内容显示 -->
	<view class="driver-message">
		<!-- 上半部分 -->
		<view class="driver-message-main">
			<view class="driver-message-top">
				<view class="driver-message-top-0">
					<view class="driver-message-top-0-top">
						<text>温州市</text>
					</view>
					<view class="driver-message-top-0-foot">
						<text>拱墅区</text>
					</view>
				</view>
				<!-- 箭头 -->
				<view class="driver-message-top-1">
					<view class="driver-message-top-1-icon">
						<image src="../static/jiantou.png" mode="" style="width: 100%;  height: 100%;"></image>
					</view>
				</view>
				<view class="driver-message-top-2">
					<view class="driver-message-top-0-top">
						<text>武汉市</text>
					</view>
					<view class="driver-message-top-0-foot">
						<text>光谷区</text>
					</view>
				</view>
				<view class="trans-style" style="width:80upx ; height: 35upx; background-color: white; color: #007AFF;display: flex;justify-content: center;align-items: center; border-radius: 30upx; font-weight: bold;position: absolute; top: 45upx; left: 300upx;">
					<text>整车</text>
				</view>
			</view>
			<!-- 下半部分 -->
			<view class="driver-message-foot">
				<view class="driver-message-foot-0">
					<view class="driver-message-foot-0-left">
						<text>交易日期</text>
					</view>
					<view class="driver-message-foot-0-right">
						<text>2016年 7月19日15：30</text>
					</view>
				</view>
				<view class="driver-message-foot-1">
					<view class="driver-message-foot-1-1">
						<view class="driver-message-foot-1-1-left">
							<text>交易货源详情</text>
						</view>
						<view class="driver-message-foot-1-1-right">
							<text>重货.农产品.23吨.10方</text>
						</view>
					</view>
					<view class="driver-message-foot-1-1">
						<view class="driver-message-foot-1-1-left">
							<text>达成交易金额</text>
						</view>
						<view class="driver-message-foot-1-1-right">
							<text>940元/总价</text>
						</view>
					</view>
					<view class="driver-message-foot-1-1">
						<view class="driver-message-foot-1-1-left">
							<text>特别说明</text>
						</view>
						<view class="driver-message-foot-1-1-right">
							<text>重货.要求发票</text>
						</view>
					</view>
					<view class="driver-message-foot-1-1">
						<view class="driver-message-foot-1-1-left">
							<text>货主名称</text>
						</view>
						<view class="driver-message-foot-1-1-right">
							<text>刘悦</text>
						</view>
					</view>
					<view class="driver-message-foot-1-1">
						<view class="driver-message-foot-1-1-left">
							<text>达成装货方式</text>
						</view>
						<view class="driver-message-foot-1-1-right">
							<text>配货</text>
						</view>
					</view>
				</view>
				<view class="driver-message-foot-2">
					<input type="text" value="" placeholder="请填写档案信息备注" />
				</view>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
	}
</script>
<style scoped lang="scss">
	.driver-message {
		width: 100%;
		// min-height: 100vh;
		display: flex;
		justify-content: center;
		align-items: flex-start;
		// margin-top: 20upx;
		// background-color: #f3f4f6;
		.driver-message-main {
			width: 100%;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			overflow: hidden;
			// box-shadow: 5upx 5upx 15upx #2979ff;
			// border: 1upx solid red;
			// 上半部分
			.driver-message-top {
				width: 94%;
				height: 200upx;
				background-color: #2979ff;
				display: flex;
				justify-content: center;
				align-items: center;
				// border-radius: 30upx;
				border-top-left-radius: 30upx;
				border-top-right-radius: 30upx;
				position: relative;
				.driver-message-top-0 {
					width: 17%;
					height: 60%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.driver-message-top-0-top {
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							font-size: 30upx;
							font-weight: bold;
							color: white;
							opacity: .9;
						}
					}
					.driver-message-top-0-foot {
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							font-size: 20upx;
							font-weight: bold;
							color: white;
							opacity: .9;
						}
					}
				}
				.driver-message-top-1 {
					width: 25%;
					height: 50%;
					// border: 1upx solid orange;
					.driver-message-top-1-icon {
						width: 100%;
						height: 80%;
						// border: 1upx solid orange;
					}
				}
				.driver-message-top-2 {
					width: 17%;
					height: 60%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.driver-message-top-0-top {
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							font-size: 30upx;
							font-weight: bold;
							color: white;
							opacity: .9;
						}
					}
					.driver-message-top-0-foot {
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							font-size: 20upx;
							font-weight: bold;
							color: white;
							opacity: .9;
						}
					}
				}
			}
			// 下
			.driver-message-foot {
				width: 94%;
				display: flex;
				flex-direction: column;
				justify-content: center;
				justify-items: center;
				padding: 20upx;
				// border: 1upx solid red;
				background-color: white;
				border-bottom-left-radius: 30upx;
				border-bottom-right-radius: 30upx;
				.driver-message-foot-0 {
					width: 100%;
					height: 100upx;
					// border: 1upx solid orange;
					border-bottom: 1upx solid #e4e7ed;
					display: flex;
					justify-content: center;
					align-items: center;
					.driver-message-foot-0-left {
						display: flex;
						justify-content: flex-start;
						align-items: center;
						width: 35%;
						height: 100%;
						text {
							font-size: 25upx;
							font-weight: bold;
							letter-spacing: 4upx;
							font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
							opacity: .7;
						}
					}
					.driver-message-foot-0-right {
						width: 65%;
						height: 100%;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						// border: 1upx solid orange;
						text {
							font-size: 28upx;
							font-weight: bold;
							// letter-spacing: 4upx;
							font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
						}
					}
				}
				.driver-message-foot-1 {
					width: 100%;
					height: 380upx;
					// border: 1upx solid orange;
					margin-top: 10upx;
					margin-bottom: 10upx;
					.driver-message-foot-1-1 {
						width: 100%;
						height: 20%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						.driver-message-foot-1-1-left {
							width: 35%;
							height: 100%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								font-size:24upx;
								font-weight: bold;
								letter-spacing: 4upx;
								font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
								opacity: .7;
							}
						}
						.driver-message-foot-1-1-right {
							width: 65%;
							height: 100%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								font-size: 28upx;
								font-weight: bold;
								// letter-spacing: 4upx;
								font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
							}
						}
					}
				}
				.driver-message-foot-2 {
					width: 100%;
					height: 200upx;
					// border: 1upx solid orange;
					border-radius: 15upx;
					background-color: #EBEEF5;
					margin-top: 20upx;
					input {
						padding: 10upx;
						font-size: 30upx;
						padding-left: 15upx;
					}
				}
			}
		}
	}
</style>
