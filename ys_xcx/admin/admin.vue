<template>
	<view class="admin">
		<view class="admin-header">
			<view class="admin-header-top">
				<!-- 出发地 -->
				<view class="admin-header-top-left">
					<!-- 城市 -->
					<view class="admin-header-top-left-top">
						<text>温州市</text>
					</view>
					<!-- 市区 -->
					<view class="admin-header-top-left-bt">
						<text>武昌区</text>
					</view>
				</view>
				<view class="admin-header-top-middle">
					<view class="admin-header-top-middle-center">
						<image src="../static/jiantou.png" mode="" style="width: 100%; height: 100%;"></image>
					</view>
				</view>
				<view class="admin-header-top-right">
					<view class="admin-header-top-right-top">
						<text>武汉市</text>
					</view>
					<!-- 市区 -->
					<view class="admin-header-top-right-bt">
						<text>朝阳区</text>
					</view>
				</view>
			</view>
			<!-- 车辆信息 -->
			<view class="admin-header-foot">
				<view class="admin-header-foot-0">
					<view class="admin-header-foot-0-top">
						<text>重量(吨)</text>
					</view>
					<view class="admin-header-foot-0-bt">
						<text>10吨</text>
					</view>
				</view>
				<view class="admin-header-foot-1">
					<view class="admin-header-foot-1-top">
						<text>体积(立方)</text>
					</view>
					<view class="admin-header-foot-1-bt">
						<text>20方</text>
					</view>
				</view>
				<view class="admin-header-foot-2">
					<view class="admin-header-foot-2-top">
						<text>装卸方式</text>
					</view>
					<view class="admin-header-foot-2-bt">
						<text>2装1卸</text>
					</view>
				</view>
			</view>
		</view>
		<view class="admin-section">
			<view class="admin-section">
				<view class="admin-section-left">
					<text>货主名称</text>
				</view>
				<view class="admin-section-right">
					<text>周杰伦</text>
				</view>
			</view>
			<view class="admin-section">
				<view class="admin-section-left">
					<text>货主类型</text>
				</view>
				<view class="admin-section-right">
					<text>重货---电器</text>
				</view>
			</view>
			<view class="admin-section">
				<view class="admin-section-left">
					<text>
						找货要求
					</text>
				</view>
				<view class="admin-section-right">
					<text>配货，可装4米方。1辆</text>
				</view>
			</view>
			<view class="admin-section">
				<view class="admin-section-left">
					<text>
						装车时间
					</text>
				</view>
				<view class="admin-section-right">
					<text>2016年9月20日18：30之前</text>
				</view>
			</view>
			<view class="admin-section">
				<view class="admin-section-left">
					<text>
						联系方式
					</text>
				</view>
				<view class="admin-section-right">
					<text>110110110110</text>
				</view>
			</view>
			<view class="admin-section">
				<view class="admin-section-left">
					<text>
						特别说明
					</text>
				</view>
				<view class="admin-section-right">
					<text>不用司机卸货，急走</text>
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
	.admin{
		width: 100%;
		.admin-header{
			width: 100%;
			height: 310upx;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			// border: 1upx solid orange;
			background: linear-gradient(180deg, #2979FF  85%, #ffffff 15%);
			.admin-header-top{
				width: 94%;
				height: 60%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: center;
				align-items: center;
				// 市区
				.admin-header-top-left{
					width: 15%;
					height: 60%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.admin-header-top-left-top{
						width: 100%;
						height: 50%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-size: 30upx;
							color: white;
							font-weight: bold;
							font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
							opacity: .8;
						}
					}
					.admin-header-top-left-bt{
						width: 100%;
						height: 35%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-size: 25upx;
							color: white;
							font-weight: bold;
							font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
							opacity: .8;
						}
					}
				}
				.admin-header-top-middle{
					width: 20%;
					height: 60%;
					// border: 1upx solid orange;
					font-display: flex;
					justify-content: center;
					align-items: flex-start;
					.admin-header-top-middle-center{
						width: 100%;
						height: 60%;
						// border: 1upx solid orange;
					}
				}
				.admin-header-top-right{
					width: 15%;
					height: 60%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.admin-header-top-right-top{
						width: 100%;
						height: 50%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-size: 30upx;
							color: white;
							font-weight: bold;
							font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
							opacity: .8;
						}
					}
					.admin-header-top-right-bt{
						width: 100%;
						height: 35%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text{
							font-size: 25upx;
							color: white;
							font-weight: bold;
							font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
							opacity: .8;
						}
					}
				}
			}
			.admin-header-foot{
				width: 94%;
				height: 40%;
				border-radius: 15upx;
				background-color: #f3f4f6;
				display: flex;
				justify-content: space-around;
				align-items: center;
				.admin-header-foot-0{
					width: 20%;
					height: 80%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.admin-header-foot-0-top{
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						// border: 1upx solid orange;
						text{
							font-size: 15upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
							opacity: .4;
						}
					}
					.admin-header-foot-0-bt{
						width: 100%;
						height: 60%;
						display: flex;
						justify-content: center;
						align-items: center;
						// border: 1upx solid orange;
						text{
							font-size: 30upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
							color: #2979FF;
						}
					}
				}
				.admin-header-foot-1{
					width: 20%;
					height: 80%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.admin-header-foot-1-top{
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						// border: 1upx solid orange;
						text{
							font-size: 20upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
							opacity: .4;
						}
					}
					.admin-header-foot-1-bt{
						width: 100%;
						height: 60%;
						display: flex;
						justify-content: center;
						align-items: center;
						// border: 1upx solid orange;
						text{
							font-size: 30upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
							color: #2979FF;
						}
					}
				}
				.admin-header-foot-2{
					width: 20%;
					height: 80%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.admin-header-foot-2-top{
						width: 100%;
						height: 40%;
						display: flex;
						justify-content: center;
						align-items: center;
						// border: 1upx solid orange;
						text{
							font-size: 20upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
							opacity: .4;
						}
					}
					.admin-header-foot-2-bt{
						width: 100%;
						height: 60%;
						display: flex;
						justify-content: center;
						align-items: center;
						// border: 1upx solid orange;
						text{
							font-size: 30upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							font-weight: bold;
							color: #2979FF;
						}
					}
				}
			}
		}
		.admin-section{
			width: 100%;
			height: 600upx;
			// border: 1upx solid orange;
			display: flex;
			flex-direction: column;
			justify-content: space-around;
			align-items: center;
			padding-left: 20upx;
			padding-right: 20upx;
			.admin-section{
				width: 100%;
				height: 15%;
				// border: 1upx solid orange;
				// box-sizing: border-box;
				border-bottom: 1upx solid #e4e7ed;
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				align-items: center;
				// padding-left: 20upx;
				// padding-right: 20upx;
				.admin-section-left{
					width: 20%;
					height: 100%;
					// border: 1upx solid orange;
					// border-bottom: 1upx solid orange;
					display: flex;
					flex-direction: row;
					justify-content: flex-start;
					align-items: center;
					text{
						font-size: 24upx;
						opacity: .5;
						font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
						font-weight: bold;
					}
				}
				.admin-section-right{
					width: 75%;
					height: 100%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: row;
					justify-content: flex-start;
					align-items: center;
					text{
						font-size: 28upx;
						// opacity: .5;
						font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
						font-weight: bold;
					}
				}
			}
		}
	}
</style>