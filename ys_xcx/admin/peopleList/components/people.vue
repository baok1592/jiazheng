<template>
	<view class="people" @tap="jump">
		<view class="head"></view>
		<view class="info">
			<!-- 头像 -->
			<view class="pic"><image src="../../../static/mayun.jpg" mode="" class="img"></image></view>
			<!-- 信息 -->
			<view class="content">
				<text class="name">
					<text>李中分</text>
					<text class="page page-noit" v-if="type == 'seller'">人事部</text>
					<text class="page page-primary">
						<template v-if="type == 'buy'">
							买家
						</template>
						<template v-if="type == 'seller'">
							卖家
						</template>
					</text>
				</text>
				<text class="mobile">18745682468</text>
			</view>
			<!-- <text class="car">
				贵JE485E4
			</text> -->
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			type: {
				type: String
			}
		},
		data () {
			return {}
		},
		methods: {
			jump() {
				let type = '';
				if(uni.getStorageSync('name')) {
					type = uni.getStorageSync('name');
				}
				let path = "../../admin/driver/driver"
				if(type) {
					path += '?type=' + type;
				}
				uni.navigateTo({
					url: path
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.people {
	width: 100%;
	border: 2rpx solid #ddd;
	border-radius: 10rpx;
	
	.head {
		width: 100%;
		padding: 10rpx;
		background-color: #eee;
		border-bottom: 2rpx solid #ddd;
		border-radius: 10rpx 10rpx 0 0;
		color: white;
	}
	// 标签
	.page {
		display: inline-block;
		font-size: 0.6rem;
		padding: 4rpx 15rpx;
		border-radius: 60rpx;
		margin-left: 20rpx;
		color: white;
		&-primary {
			background-color: #007AFF;
		}
		&-noit {
			background-color: rgba(222, 125, 44, 1);
		}
	}
	
	.info {
		width: 100%;
		padding: 20rpx 10rpx;
		display: flex;
		// justify-content: space-between;
		align-items: center;
		
		.pic {
			flex-shrink: 0;
			width: 80rpx;
			height: 80rpx;
			// margin-right: 60rpx;
			
			.img {
				width: 100%;
				height: 100%;
				border-radius: 50%;
			}
		}
		
		.content {
			display: flex;
			flex-direction: column;
			margin-left: 10%;
			.name {
				display: flex;
				margin-bottom: 20rpx;
				text {
					&:first-child {
						font-weight: 600;
					}
				}
			}
			.mobile {
				font-size: 0.9em;
				color: #777;
			}
		}
		
		.car {
			font-size: 1.1em;
			font-weight: 600;
		}
	}
}
</style>
