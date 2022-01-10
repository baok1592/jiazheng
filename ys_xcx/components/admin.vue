<template>
	<view class="admin" @click="jump_admin">
		<view class="admin-main">
			<view class="admin-main-header">
				<view class="admin-main-header-left">
					<text>40分钟前</text>
				</view>
				<view class="admin-main-header-right">
					<text>已报价</text>
					<text>已邀请报价</text>
				</view>
			</view>
			<view class="admin-main-section">
				<view class="admin-main-section-left">
					<view class="admin-main-section-left-top">
						<image src="../static/mayun.jpg" style="width: 100%; height: 100%;"></image>
					</view>
					<view class="admin-main-section-left-foot">
						<text>刘德华</text>
					</view>
				</view>
				<view class="admin-main-section-right">
					<view class="admin-main-section-right-0">
						<view class="admin-main-section-right-0-top">
							<text>温州市</text>
						</view>
						<view class="admin-main-section-right-0-bt">
							<text>朝阳区</text>
						</view>
					</view>
					<view class="admin-main-section-right-1">
						<view class="admin-main-section-right-1-center">
							<image src="../static/jiantou.png" mode="" style="width: 100%; height: 100%;"></image>
						</view>
					</view>
					<view class="admin-main-section-right-2">
						<view class="admin-main-section-right-2-top">
							<text>武汉市</text>
						</view>
						<view class="admin-main-section-right-2-bt">
							<text>武昌区</text>
						</view>
					</view>
					<view class="admin-message" style="width: 90upx; height: 35upx; background-color:#2979ff ; display: flex; justify-content: center;align-items: center; border-radius: 20upx; position: absolute; top: 30upx;">
						<text style="font-size: 20upx; color: white; letter-spacing: 2upx; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">整车</text>
					</view>
				</view>
			</view>
			<view class="admin-main-foot">
				<text>9.6米</text>
				<text>高栏车</text>
				<text>可装1.77米</text>
				<text>余重10吨</text>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		props: {
			dat: {
				type: Array
			},
			// 判断在哪个选项卡点击的
			type: {
				type: Number,
			}
		},
		methods:{
			jump_admin(){
				if(this.type == 1) {
					uni.navigateTo({
						url: "../admin/scheduling/scheduling"
					})
				}
				// uni.navigateTo({
				// 	url:"../driver/detailed/detailed"
				// })
			}
		}
	}
</script>
<style scoped lang="scss">
	.admin{
		// width:100% ;
		// height: 400upx;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 40rpx;
		&:last-child {
			margin-bottom: 40rpx;
		}
		.admin-main{
			width: 94%;
			height: 330upx;
			padding-left: 10upx;
			padding-right: 10upx;
			// border: 1upx solid orange;
			// margin-top: 30upx;
			box-shadow: 2upx 2upx 10upx #dcdfe6;
			border-radius: 20upx;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			.admin-main-header{
				width: 100%;
				height: 20%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: center;
				align-items: center;
				.admin-main-header-left{
					width: 30%;
					height: 100%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: start;
					align-items: center;
					padding-left: 20upx;
					text{
						font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
						font-weight: bold;
						font-size: 30upx;
						opacity: .4;
					}
				}
				.admin-main-header-right{
					width: 70%;
					height: 100%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: flex-end;
					align-items: center;
					text{
						font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
						font-weight: bold;
						font-size: 25upx;
						opacity: .8;
						margin: 15upx;
					}
				}
			}
			.admin-main-section{
				width: 100%;
				height: 60%;
				// border: 1upx solid orange;
				border-bottom: 1upx solid #e4e7ed;
				border-top:1upx solid #e4e7ed;
				display: flex;
				justify-content: center;
				align-items: center;
				position: relative;
				.admin-main-section-left{
					width: 25%;
					height: 100%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.admin-main-section-left-top{
						width: 120upx;
						height: 120upx;
						// border: 1upx solid orange;
						// box-shadow: 5upx 5upx 5upx orange;
						// border: 1upx solid #2979ff;
						border-radius: 50%;
						margin-bottom: 1/.0upx;
						overflow: hidden;
					}
					.admin-main-section-left-foot{
						width: 80%;
						height: 20%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
						}
					}
				}
				.admin-main-section-right{
					width: 75%;
					height: 100%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
					.admin-main-section-right-0{
						width: 20%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
						.admin-main-section-right-0-top{
							width: 100%;
							height: 50%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: center;
							align-items: center;
							text{
								font-size: 30upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								font-weight: bold;
								opacity: .8;
							}
						}
						.admin-main-section-right-0-bt{
							width: 100%;
							height: 30%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: center;
							align-items: center;
							text{
								font-size: 25upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								font-weight: bold;
								opacity: .8;
							}
						}
					}
					.admin-main-section-right-1{
						width: 30%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						justify-items: flex-start;
						.admin-main-section-right-1-center{
							width: 100%;
							height: 60%;
						}
					}
					.admin-main-section-right-2{
						width: 20%;
						height: 60%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
						.admin-main-section-right-2-top{
							width: 100%;
							height: 50%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: center;
							align-items: center;
							text{
								font-size: 30upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								font-weight: bold;
								opacity: .8;
							}
						}
						.admin-main-section-right-2-bt{
							width: 100%;
							height: 30%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: center;
							align-items: center;
							text{
								font-size: 25upx;
								font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
								font-weight: bold;
								opacity: .8;
							}
						}
					}
				}
			}
			.admin-main-foot{
				width: 100%;
				height: 20%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: space-around;
				align-items: center;
				text{
					display: flex;
					justify-content: center;
					align-items: center;
					font-size: 30upx;
					font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
					// font-weight: bold;
					opacity: .4;
				}
			}
	}
	}
</style>