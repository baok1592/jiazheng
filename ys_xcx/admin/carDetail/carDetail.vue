<template>
	<view class="car-detail">
		<!-- 车辆大图 -->
		<view class="pic" :style="{'height': win_w + 'px', 'width': win_w + 'px'}">
			<image src="../../static/news-tmp/tmp-1.jpg" mode="" class="img"></image>
		</view>
		<!-- 基本信息 -->
		<view class="info">
			<view class="panel">
				<text>车牌号：</text>
				<text>JE451111</text>
			</view>
			
			<view class="panel panel-between">
				<text>当前司机：</text>
				<text>李总</text>
				<text class="page page-ml-5 page-shadow" @tap="jump_info">详情</text>
			</view>
			
			<view class="panel">
				<text>车辆类型：</text>
				<text>公司车辆</text>
			</view>
			
			<view class="panel">
				<text>吨位：</text>
				<text>2770</text>
			</view>
			
			<view class="panel">
				<text>当前状态：</text>
				<text>配送中</text>
			</view>
			
			<view class="panel">
				<text>当前油量(L)：</text>
				<text>25</text>
			</view>
			
			<view class="panel">
				<text>GPS设备编号：</text>
				<text>JE4555551111</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				win_w: 0,
			};
		},
		created() {
			this.win_w = uni.getSystemInfoSync().screenWidth;
		},
		methods: {
			jump_info() {
				uni.navigateTo({
					url: '../driver/driver?type=admin'
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.car-detail {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100vw;
	
	.pic {
		
		.img {
			width: 100%;
			height: 100%;
		}
	}
	
	.info {
		margin-top: 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: left;
		width: 90%;
		padding-bottom: 50rpx;
		
		.panel {
			width: 100%;
			padding: 20rpx 20rpx;
			margin-bottom: 20rpx;
			border-bottom: 2rpx solid #eee;
			>text {
				display: inline-block;
			}
			text {
				&:first-child {
					width: 250rpx;
					text-align: justify;
					font-weight: 600;
					color: #333;
				}
				&:last-child {
					color: #555555;
				}
			}
			.page {
				background-color: #0078a8;
				color: white !important;
				padding: 6rpx 20rpx;
				border-radius: 60rpx;
				font-size: 0.7rem;
				&-ml-5 {
					margin-left: 100rpx;
				}
				&-shadow {
					box-shadow: 0 0 5rpx 0 #3F536E;
				}
			}
		}
	}
}
</style>
