<template>
	<view class="personal">
		<view class="user-main">
			<view class="user-main-top">
				<!-- 第一部分 -->
				<view class="user-main-top-1">
					<view class="user-main-top-1-left">
						<!-- 图片 -->
						<view class="user-main-top-1-left-img">
							<image src="../../static/mayun.jpg" mode=""></image>
						</view>
					</view>
					<view class="user-main-top-1-left">
						<view class="user-main-top-1-left-top">
							<view class="user-main-top-1-left-top-left">
								<text>永顺物流</text>
							</view>
							<view class="user-main-top-1-left-top-right">
								<text>运输经理</text>
							</view>
						</view>
						<view class="user-main-top-1-left-section">
							<view class="user-main-top-1-left-section-left">
								<text>工号：</text>
							</view>
							<view class="user-main-top-1-left-section-right">
								<text>YS163416</text>
							</view>
						</view>
						<view class="user-main-top-1-left-foot">
							<view class="user-main-top-1-left-foot-left">
								<text>职位：</text>
							</view>
							<view class="user-main-top-1-left-foot-right">
								<text>一运输队</text>
							</view>
						</view>
					</view>
					<!-- 右边 -->
					<view class="user-main-top-1-left">
					<view class="user-main-top-1-left-1">
						<!-- 评分 -->
						<view class="user-main-top-1-left-1-top">
							<text>5.0</text>
						</view>
						<view class="user-main-top-1-left-1-bt">
							<text>综合评分</text>
						</view>
					</view>
					<!-- <view class="user-main-top-1-left-2" v-if="type == 'admin'">
						<u-icon name="arrow-right" @click="jump_modify"></u-icon>
					</view> -->
					</view>
					<view class="set" @click="jump_modify">
						<i class="iconfont iconshezhi"></i>
					</view>
				</view>
				<!-- 油卡余额 -->
				<view class="oli-balance" v-if="type == 'driver'">
					<text>油卡余额：</text>
					<text class="balance">37.45</text>
				</view>
				<!-- 第二部分 -->
				<view class="user-main-top-2">
					<view class="user-main-top-2-section">
						<view class="user-main-top-2-section-top">
							<text>33</text>
						</view>
						<view class="user-main-top-2-section-bt">
							<text>历史成交</text>
						</view>
					</view>
					<view class="user-main-top-2-section">
						<view class="user-main-top-2-section-top">
							<text>33</text>
						</view>
						<view class="user-main-top-2-section-bt">
							<text>历史成交</text>
						</view>
					</view>
					<view class="user-main-top-2-section">
						<view class="user-main-top-2-section-top">
							<text>33</text>
						</view>
						<view class="user-main-top-2-section-bt">
							<text>历史成交</text>
						</view>
					</view>
				</view>
				<!-- 第三部分 -->
				<view class="user-main-top-3">
					<view class="user-main-top-3-section">
						<text>销售达人</text>
					</view>
					<view class="user-main-top-3-section">
						<text>销售达人</text>
					</view>
					<view class="user-main-top-3-section">
						<text>销售达人</text>
					</view>
				</view>
			</view>
			<view class="more" v-if="type != 'admin' && type != 'driver'">
				<view class="more-sectin" @click="jump_car">
					<view class="more-sectin-top">
						<u-icon name="car" color="#2979ff" size="60"></u-icon>
					</view>
					<view class="more-sectin-bottom">
						<text>车辆加油</text>
					</view>
				</view>
				<view class="more-sectin"  @click="jump_drawal">
					<view class="more-sectin-top">
						<u-icon name="car" color="#2979ff" size="60"></u-icon>
					</view>
					<view class="more-sectin-bottom">
						<text>提现</text>
					</view>
				</view>
				<!-- <view class="more-sectin" @click="jump_driverlist">
					<view class="more-sectin-top">
						<u-icon name="car" color="#2979ff" size="60"></u-icon>
					</view>
					<view class="more-sectin-bottom">
						<text>司机列表</text>
					</view>
				</view> -->
			</view>
		</view>
		<tabbar></tabbar>
	</view>
</template>
<script>
	import tabbar from "../../components/tabbar.vue"
	
	export default {
		components: {
			tabbar,
		},
		data() {
			return {
				type: '',
			}
		},
		created() {
			this.type = uni.getStorageSync('name');
		},
		onShow() {
			wx.hideHomeButton();
		},
		methods:{
			jump_modify(){
				uni.navigateTo({
					url:"../modify/modify"
				})
			},
			jump_car(){
				uni.navigateTo({
					url:"../gas/gas"
				})
			},
			jump_drawal(){
				uni.navigateTo({
					url:"../drawal/drawal"
				})
			},
		}
	}
</script>
<style scoped lang="scss">
.personal{
	width: 100vw;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: $uni-bg-color-grey;
	.user-main{
		width: 94vw;
		height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		align-items: center;
		// border: 1upx solid orange;
		.user-main-top{
			width: 100%;
			height: 40%;
			// border: 1upx solid orange;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			margin-top: 20upx;
			.user-main-top-1{
				width: 100%;
				height: 50%;
				position: relative;
				// border: 1upx solid orange;
				display: flex;
				justify-content: center;
				align-items: center;
				.user-main-top-1-left:nth-child(1){
					width: 24%;
					height: 80%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
					.user-main-top-1-left-img{
						width: 110rpx;
						height: 110rpx;
						// border: 1upx solid orange;
						border-radius: 50%;
						overflow: hidden;
						image{
							width: 100%;
							height: 100%;
						}
					}
				}
				.user-main-top-1-left:nth-child(2){
					width: 38%;
					height: 60%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: space-around;
					align-items: center;
					.user-main-top-1-left-top{
						width: 100%;
						height: 35%;
						// border: 1upx solid orange;
						display: flex;	
						justify-content: space-between;
						align-items: center;
						.user-main-top-1-left-top-left{
							width: 45%;
							height: 90%;
							// border: 1upx solid orange;
							text{
								font-size: 28upx;
								font-family: sans-serif;
								opacity: .8;
								font-weight: bold;
							}
						}
						.user-main-top-1-left-top-right{
							width: 50%;
							height: 90%;
							color: white;
							// border: 1upx solid orange;
							text{
								font-size: 20upx;
								font-family: sans-serif;
								opacity: .8;
								background-color:$ys-primary ;
								border-radius: 15upx;
								display: flex;
								justify-content: center;
								align-items: center;
								margin-top: 3%;
							}
						}
					}
					.user-main-top-1-left-section{
						width: 100%;
						height: 30%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: space-between;
						align-items: center;
						.user-main-top-1-left-section-left{
							width: 30%;
							height: 90%;
							// border: 1upx solid orange;
							text{
								font-size: 24upx;
								font-family: sans-serif;
								opacity: .8;
							}
						}
						.user-main-top-1-left-section-right{
							width: 65%;
							height: 90%;
							// border: 1upx solid orange;
							text{
								font-size: 24upx;
								font-family: sans-serif;
								opacity: .8;
							}
						}
					}
					.user-main-top-1-left-foot{
						width: 100%;
						height: 30%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: space-between;
						align-items: center;
						.user-main-top-1-left-foot-left{
							width: 30%;
							height: 90%;
							// border: 1upx solid orange;
							text{
								font-size: 24upx;
								font-family: sans-serif;
								opacity: .8;
							}
						}
						.user-main-top-1-left-foot-right{
							width: 65%;
							height: 90%;
							// border: 1upx solid orange;
							text{
								font-size: 24upx;
								font-family: sans-serif;
								opacity: .8;
							}
						}
					}
				}
				.user-main-top-1-left:nth-child(3){
					width: 38%;
					height: 80%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: flex-end;
					align-items: center;
					.user-main-top-1-left-1{
						width: 60%;
						height: 80%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
						.user-main-top-1-left-1-top{
							width: 100%;
							height: 60%;
							// border: 1upx solid orange;
							display: flex;
							// flex-direction: column;
							justify-content: center;
							align-items: center;
							text{
								display: flex;
								// flex-direction: column;
								justify-content: center;
								align-items: center;
								font-size: 60upx;
								font-family: sans-serif;
								color: #e30003;
							}
						}
						.user-main-top-1-left-1-bt{
							width: 100%;
							height: 30%;
							// border: 1upx solid orange;
							display: flex;
							// flex-direction: column;
							justify-content: center;
							align-items: center;
							text{
								display: flex;
								// flex-direction: column;
								justify-content: center;
								align-items: center;
								font-size: 24upx;
								font-family: sans-serif;
								opacity: .5;
							}
						}
					}
					.user-main-top-1-left-2{
						width: 20%;
						height: 80%;
						// border: 1upx solid orange;
						display: flex;
						// flex-direction: column;
						justify-content: center;
						align-items: center;
					}
				}
				.set {
					position: fixed;
					right: 20rpx;
					bottom: 120rpx;
					z-index: 999;
					i {
						font-size: 2em;
					}
				}
			}
			.user-main-top-2{
				width: 100%;
				height: 30%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: space-around;
				align-items: center;
				border-top: 1upx solid $uni-border-color;
				border-bottom: 1upx solid $uni-border-color ;
				.user-main-top-2-section{
					width: 30%;
					height: 90%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.user-main-top-2-section-top{
						width: 100%;
						height: 55%;
						// border: 1upx solid orange;
						display: flex;
						// flex-direction: column;
						justify-content: center;
						align-items: center;
						text{
							font-size: 38upx;
							font-weight: bold;
							font-family: sans-serif;
						}
					}
					.user-main-top-2-section-bt{
						width: 100%;
						height: 30%;
						// border: 1upx solid orange;
						display: flex;
						// flex-direction: column;
						justify-content: center;
						align-items: center;
						text{
							font-size: 24upx;
							opacity: .8;
							font-family: sans-serif;
						}
					}
				}
			}
			.user-main-top-3{
				width: 100%;
				height: 20%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				border-bottom: 1upx solid $uni-border-color ;
				.user-main-top-3-section{
					display: flex;
					justify-content: center;
					align-items: center;
					width: 20%;
					height: 40rpx;
					background-color:orange ;
					border-radius: 15upx;
					margin-right: 5%;
					text{
						font-size: 24upx;
						font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
						opacity: .8;
						display: flex;
						color: white;			
						justify-content: center;
						align-items: center;
					}
				}
				.user-main-top-3-section:nth-child(1){
					margin-left: 5%;
				}
			}
		}
		.more{
			width: 94vw;
			height: 10%;
			// border: 1upx solid orange;
			display: flex;
			// flex-direction: column;
			justify-content: space-around;
			align-items: center;
			border-bottom: 1upx solid $uni-border-color ;
			.more-sectin{
				width: 30%;
				height: 90%;
				// border: 1upx solid orange;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				.more-sectin-top{
					width: 100%;
					height: 50%;
					// border: 1upx solid orange;
					display: flex;
					// flex-direction: column;
					justify-content: center;
					align-items: center;
				}
				.more-sectin-bottom{
					width: 100%;
					height: 30%;
					// border: 1upx solid orange;
					display: flex;
					// flex-direction: column;
					justify-content: center;
					align-items: center;
					text{
						font-size: 28upx;
						font-family: sans-serif;
						opacity: .8;
						display: flex;
						// flex-direction: column;
						justify-content: center;
						align-items: center;
					}
				}
			}
		}
	}
}

.oli-balance {
	width: 100%;
	padding: 40rpx;
	border-top: 1upx solid $uni-border-color;
	display: flex;
	color: #777;
	
	.balance {
		display: inline-block;
		margin-left: 40rpx;
		font-weight: 600;
		color: #e30003;
		transform: scale(1.4);
		&::after {
			content: "元";
			display: inline-block;
			margin-left: 10rpx;
			font-size: 0.7em;
		}
	}
}
	
</style>