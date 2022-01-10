<template>
	<view class="list">
		<view class="time">
			<text class="xh">J45824468511</text>
			<text class="t">2020-10-15</text>
		</view>
		<!--  -->
		<div class="con">
			<view class="left">
				<view class="info">
					<text>李忠将</text>
					<text>JE51S5</text>
				</view>
				<view class="money">合计：<text>526</text></view>
				<!-- <view class="number">编号：<text>J45824468511</text></view> -->
			</view>
			<view class="right">
				<!-- 加油 -->
				<view class="con">
					<text>53</text>
				</view>
			</view>
		</div>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			};
		}
	}
</script>

<style lang="scss" scoped>
.list {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-direction: column;
	// padding: 20rpx 20rpx 0 0;
	padding: 20rpx;
	background-color: #fff;
	// border: 1px solid #ddd;
	// box-shadow: 0 0 10rpx 0 #007AFF inset;
	border-radius: 10rpx;
	.time {
		// padding-left: 20rpx;
		width: 100%;
		display: flex;
		justify-content: space-between;
		margin-bottom: 15rpx;
		// font-weight: 600;
		.t {
			font-size: 1em;
			// font-weight: 600;
		}
	}
	.con {
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		.left {
			width: 100%;
			color: #333;
			// background-color: #999;
			>view {
				margin-bottom: 10rpx;
				// padding-left: 20rpx;
			}
			
			.info {
				text {
					display: inline-block;
					// font-weight: 600;
					&:nth-child(1) {
						margin-right: 40rpx;
					}
				}
			}
			.money {
				font-weight: 600;
				margin-top: 20rpx;
				text {
					color: #dd524d;
					font-size: 1.2em;
					&::after {
						content: "¥";
						font-size: 0.8em;
						margin-left: 10rpx;
					}
				}
			}
			.number {
				font-weight: 600;
				margin-bottom: 0;
				// background-color: #0077AA;
				// background-color: #eee;
				// color: white;
				color: #333;
				padding: 5rpx 0 10rpx 20rpx;
				border-radius: 0 10rpx 0 10rpx;
				text {
					font-weight: 400;
					font-size: 0.9em;
				}
			}
		}
		
		.right {
			width: 200rpx;
			// background-color: #ddd;
			.con {
				font-size: 2em;
				color: #309434;
				font-weight: 600;
				&::before {
					content: "+";
					font-size: 0.8em;
					font-weight: 400;
				}
				&::after {
					content: "L";
					// font-size: 0.8em;
					font-weight: 400;
					margin-left: 10rpx;
				}
			}
		}
	}
	
}
</style>
