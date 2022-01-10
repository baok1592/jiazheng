<template>
	<view class="detailed">
		<view class="detailed-main">
			<!-- 基本信息 -->
			<view class="detailed-top">
				<!--  -->
				<view class="detailed-top-1">
					<view class="detailed-top-1-left">
						<text>基本信息</text>
					</view>
					<view class="detailed-top-1-right">
						<!-- <u-icon name="clock" color="#2979ff" size="35"></u-icon> -->
						<text>等待车主确认</text>
					</view>
				</view>
				<!-- 中间部分，目的地址 -->
				<view class="detailed-top-2">
					<view class="detailed-top-2-left">
						<text>南京</text>
					</view>
					<view class="detailed-top-2-center">
						<u-icon name="arrow-rightward" color="#2979ff" size="40"></u-icon>
					</view>
					<view class="detailed-top-2-right">
						<text>北京</text>
					</view>
				</view>
				<view class="detailed-top-3">
					<view class="detailed-top-3-section">
						<view class="detailed-top-3-section-left">
							<text>收件人：</text>
						</view>
						<view class="detailed-top-3-section-right">
							<text>王总</text>
						</view>
					</view>
					<view class="detailed-top-3-section">
						<view class="detailed-top-3-section-left">
							<text>运输方式：</text>
						</view>
						<view class="detailed-top-3-section-right">
							<text>卡车运输</text>
						</view>
					</view>
					<view class="detailed-top-3-section">
						<view class="detailed-top-3-section-left">
							<text>当前状态：</text>
						</view>
						<view class="detailed-top-3-section-right">
							<text>运输中</text>
						</view>
					</view>
					<view class="detailed-top-3-section">
						<view class="detailed-top-3-section-left">
							<text>下单时间：</text>
						</view>
						<view class="detailed-top-3-section-right">
							<text>2020-08-60 15:30</text>
						</view>
					</view>
					<view class="detailed-top-3-section">
						<view class="detailed-top-3-section-left">
							<text>订单号：</text>
						</view>
						<view class="detailed-top-3-section-right">
							<text>YS45645645456456</text>
						</view>
					</view>
					<view class="detailed-top-3-section">
						<view class="detailed-top-3-section-left">
							<text>费用：</text>
						</view>
						<view class="detailed-top-3-section-right">
							<text class="num">750000.00</text>
						</view>
						<text class="page page-fail page-position-right">未支付</text>
					</view>
				</view>
			</view>
			<!-- 货物信息 -->
			<view class="detailed-section">
				<view class="detailed-section-top">
					<text>货物信息</text>
				</view>
				<view class="detailed-section-bt">
					<!-- <view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>货物信息：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>耳机</text>
						</view>
					</view> -->
					<view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>货物类型：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>蚬岗</text>
						</view>
					</view>
					<view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>总重量（kg）：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>10000.00</text>
						</view>
					</view>
					<view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>车辆要求：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>大卡</text>
						</view>
					</view>
					<!-- <view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>获取说明：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>易碎</text>
						</view>
					</view> -->
					<view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>车长要求：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>13米</text>
						</view>
					</view>
					<view class="detailed-section-bt-section">
						<view class="detailed-section-bt-section-left">
							<text>备注：</text>
						</view>
						<view class="detailed-section-bt-section-right">
							<text>阿贾克斯不打卡本菲卡吧就卡上白佛爱上哦骄傲方式拜佛阿什伯喀什佛哎iv以会计分录数据的付款了圣诞节付款了涉及到风口浪尖圣诞快乐房间的房间卡洛斯的复健科了时间速度快解放楼上的房间斯柯达放假了深刻对方即可后</text>
						</view>
					</view>
				</view>
			</view>
			<!-- 收发货信息 -->
			<view class="detailed-footer">
				<view class="detailed-footer-top">
					<text>收发货信息</text>
				</view>
				<view class="detailed-footer-section">
					<view class="detailed-footer-section-1">
						<view class="detailed-footer-section-1-left">
							<text>始发地：</text>
						</view>
						<view class="detailed-footer-section-1-right">
							<text>贵州省 兴义市 顶效镇 丁晓开发大道 兴义民族师范学院费劲了口舌的福建省两节课地方了加快速度恢复</text>
						</view>
					</view>
					<view class="detailed-footer-section-1">
						<view class="detailed-footer-section-1-left">
							<text>目的地：</text>
						</view>
						<view class="detailed-footer-section-1-right">
							<text>贵州省 兴义市 顶效镇 丁晓开发大道 兴义民族师范学院</text>
						</view>
					</view>
					<view class="detailed-footer-section-2" >
						<u-button type="success" size="default"  :ripple="true" :plain="true" @click="jump_ditu">查看详情</u-button>
					</view>
				</view>
			</view>
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
			jump_ditu(){
				uni.navigateTo({
					url:"../../buyseller/ditu"
				})
			}
		}
	}
</script>
<style lang="scss" lang="scss">
	.detailed{
		width: 100vw;
		// height: 130vh;
		padding: 3vw;
		display: flex;
		justify-content: center;
		align-items: center;
		padding-bottom: 10vh;
		.detailed-main{
			width: 94vw;
			padding-top: 50rpx;
			// height: 114vh;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			align-items: center;
			// border: 1upx solid orange;
			.detailed-top{
				width: 100%;
				margin-bottom: 20rpx;
				// height: 32%;
				// border: 1upx solid orange;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				.detailed-top-1{
					width:100%;
					height: 20%;
					padding-bottom: 10rpx;
					// border: 1upx solid orange;
					display: flex;
					justify-content: space-between;
					align-items: center;
					border-bottom: 1upx solid $uni-border-color;
					.detailed-top-1-left{
						width:35%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						// border-left: 4upx solid  $uni-border-color;
						text{
							font-size: 28upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							border-left: 5upx solid  $uni-border-color;
							padding-left: 10upx;
						}
					}
					.detailed-top-1-right{
						width:35%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						text{
							font-size: 28upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							// border-left: 5upx solid  $uni-border-color;
							// padding-left: 10upx;
							color:$uni-color-error ;
							margin-left: 10upx;
						}
					}
				}
				.detailed-top-2{
					width:100%;
					height: 30%;
					padding: 30rpx 0;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
					.detailed-top-2-left{
						width: 10%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-size: 32upx;
							font-weight: bold;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
						}
					}
					.detailed-top-2-center{
						width: 15%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
					}
					.detailed-top-2-right{
						width: 10%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-size: 32upx;
							font-weight: bold;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							color: orange 	;
						}
					}
				}
				.detailed-top-3{
					width:100%;
					height: 50%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: space-between;
					align-items: center;
					.detailed-top-3-section{
						width: 100%;
						height: 16%;
						position: relative;
						margin-bottom: 15rpx;
						// border: 1upx solid orange;
						padding-left: 10upx;
						display: flex;
						// flex-direction: column;
						justify-content: flex-start;
						align-items: center;
						.detailed-top-3-section-left{
							width: 25%;
							height: 90%;
							// border: 1upx solid orange;
							display: flex;
							// flex-direction: column;
							justify-content: flex-start;
							align-items: center;
							text{
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								font-size: 24upx;
								color: $uni-text-color-grey;
							}
						}
						.detailed-top-3-section-right{
							width: 30%;
							height: 90%;
							// border: 1upx solid orange;
							display: flex;
							// flex-direction: column;
							justify-content: flex-start;
							align-items: center;
							text{
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								font-size: 24upx;
								// color: $uni-text-color-grey;
							}
							.num {
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								font-size: 1.4em;
								color: $uni-color-error !important;
								&::before {
									content: "¥";
									margin-right: 10rpx;
									font-size: 1rem;
								}
							}
						}
						.page {
							display: inline-block;
							color: white;
							padding: 5rpx 10rpx;
							border-radius: 60rpx;
							font-size: 0.7rem;
							&-success {
								background-color: blue;
							}
							&-fail {
								background-color: #e50000;
							}
							&-position-right {
								position: absolute;
								right: 0;
							}
						}
						.detailed-top-3-section-left-one{
							width:80%;
							height: 90%;
							color: $uni-text-color-grey;
							// border: 1upx solid orange;
							display: flex;
							// flex-direction: column;
							justify-content: flex-start;
							align-items: center;
							text{
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								font-size: 24upx;
								// color: $uni-text-color-grey;
								&:last-child {
									padding-left: 50rpx;
									color: black;
								}
							}
							.num {
								font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
								font-size: 1.4em;
								color: $uni-color-error !important;
								&::before {
									content: "¥";
									margin-right: 10rpx;
									font-size: 1rem;
								}
							}
						}
						.detailed-top-3-section-right-two{
							width:30%;
							height: 90%;
							// border: 1upx solid orange;
							display: flex;
							// flex-direction: column;
							justify-content: flex-end;
							align-items: center;
							padding-right: 2%;
						}
					}
				}
			}
			.detailed-section{
				width: 100%;
				// height: 36%;
				// border: 1upx solid orange;
				display: flex;
				flex-direction: column;
				justify-content: flex-start;
				align-items: center;
				.detailed-section-top{
					width: 100%;
					height: 15%;
					padding-bottom: 10rpx;
					// border: 1upx solid orange;
					display: flex;
					// flex-direction: column;
					justify-content: flex-start;
					align-items: center;
					border-bottom: 1upx solid $uni-border-color;
					text{
						font-size: 28upx;
						font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
						border-left: 5upx solid  $uni-border-color;
						padding-left: 10upx;
					}
				}
				.detailed-section-bt{
					width: 100%;
					height: 85%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: space-between;
					align-items: center;
					.detailed-section-bt-section{
						width: 100%;
						height: 12%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction: row;
						justify-content: space-between;
						align-items: center;
						margin-top: 25rpx;
						.detailed-section-bt-section-left{
							width: 25%;
							height: 90%;
							// border: 1upx solid orange;
							display: flex;
							flex-direction: row;
							justify-content: flex-start;
							align-items: center;
							text{
								padding-left: 10upx;
								font-size: 24upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								color: $uni-text-color-grey;
							}
						}
						.detailed-section-bt-section-right{
							width: 75%;
							height: 90%;
							// border: 1upx solid orange;
							display: flex;
							flex-direction: row;
							justify-content: flex-start;
							align-items: center;
							text{
								padding-left: 10upx;
								font-size: 24upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								// color: $uni-text-color-grey;
							}
						}
					}
					.detailed-section-bt-section:nth-child(7){
						width: 100%;
						height: 22%;
						// border: 1upx solid orange;
						.detailed-section-bt-section-left{
							width: 20%;
							height: 90%;
							// border: 1upx solid orange;
							display: flex;
							flex-direction: row;
							justify-content: flex-start;
							align-items: flex-start;
							text{
								padding-left: 10upx;
								font-size: 24upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								color: $uni-text-color-grey;
							}
							}
					}
				}
			}
			.detailed-footer{
				width: 100%;
				// height:28%;
				// border: 1upx solid orange;
				display: flex;
				flex-direction: column;
				justify-content: flex-start;
				align-items: center;
				margin-top: 5%;
				.detailed-footer-top{
					width: 100%;
					height: 25%;
					padding-bottom: 10rpx;
					// border: 1upx solid orange;
					display: flex;
					// flex-direction: column;
					justify-content: flex-start;
					align-items: center;
					border-bottom: 1upx solid $uni-border-color;
					text{
						font-size: 28upx;
						font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
						border-left: 5upx solid  $uni-border-color;
						padding-left: 10upx;
					}
				}
				.detailed-footer-section{
					width: 100%;
					height:70%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: space-between;
					align-items: center;
				}
				.detailed-footer-section-1{
					width: 100%;
					height:40%;
					margin-top: 30rpx;
					// border: 1upx solid orange;
					display: flex;
					flex-direction:row;
					justify-content: space-between;
					align-items: center;
					.detailed-footer-section-1-left{
						width: 20%;
						height:100%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction:row;
						justify-content: flex-start;
						align-items: center;
						text{
							font-size: 28upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							// border-left: 5upx solid  $uni-border-color;
							padding-left: 10upx;
							color: $uni-text-color-grey;
						}
					}
					.detailed-footer-section-1-right{
						width: 75%;
						height:100%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction:row;
						justify-content: flex-start;
						align-items: center;
						text{
							font-size: 28upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							// border-left: 5upx solid  $uni-border-color;
							padding-left: 10upx;
						}
					}
				}
				.detailed-footer-section-2{
					width: 100%;
					height: 20%;
					margin-top: 40rpx;
					// border: 1upx solid orange;
				}
			}
		}
	}
</style>
