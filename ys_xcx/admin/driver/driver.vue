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
					<!-- <view class="user-main-top-1-left-2">
						<u-icon name="arrow-right" @click="jump_modify"></u-icon>
					</view> -->
					</view>
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
				<view class="user-main-top-3" v-if="isShow">
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
			<!-- <view class="more">
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
			</view> -->
			<!-- 订单列表 -->
			<view class="order-lists">
				<template v-for="i in 10">
					<driver :key="i"></driver>
				</template>
			</view>
		</view>
	</view>
</template>
<script>
	import driver from "../../components/driver.vue";
	
	export default {
		data() {
			return {
				isShow: true,
			}
		},
		components: {
			driver,
		},
		onLoad(option) {
			if(option.type) {
				if(option.type == 'admin') {
					this.isShow = false;
				}
			}
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
		min-height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: $uni-bg-color-grey;
		padding-bottom: 40rpx;
		.user-main{
			width: 94vw;
			height: 100%;
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
					// height: 50%;
					// border: 1upx solid orange;
					padding: 20rpx 0;
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
							width: 100rpx;
							height: 100rpx;
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
							margin-bottom: 10rpx;
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
									color: #eee;
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
									color: red;
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
				}
				.user-main-top-2{
					width: 100%;
					// height: 30%;
					padding: 20rpx 0;
					// border: 1upx solid orange;
					display: flex;
					justify-content: space-around;
					align-items: center;
					border-top: 1upx solid $uni-border-color ;
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
					// height: 20%;
					padding: 30rpx 0;
					// border: 1upx solid orange;
					display: flex;
					justify-content: flex-start;
					align-items: center;
					border-bottom: 1upx solid $uni-border-color ;
					.user-main-top-3-section{
						width: 20%;
						height: 40%;
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
			
			// 订单列表
			.order-lists {
				width: 100%;
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
</style>