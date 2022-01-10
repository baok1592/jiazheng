<template>
	<view class="tixian">
		<view class="tixian-left">
			<view class="tixian-left-1">
				<text>流水号：20206546541</text>
			</view>
			<view class="tixian-left-2">
				<text>提现成功</text>
			</view>
			<view class="tixian-left-3">
				<text>2020-05-12 02:12:25</text>
			</view>
			<view class="tixian-left-4">
				<text>提现账号：62465834682213466</text>
			</view>
		</view>
		<view class="tixian-right">
			<text>-10011.13</text>
		</view>
	</view>
</template>
<script>
	export default {
		data() {
			return {
			}
		}
	}
</script>
<style lang="scss" >
	.tixian{
		width: 100vw;
		height:260upx;
		border-top: 1upx solid $uni-border-color;
		display: flex;
		justify-content: space-around;
		align-items: center;
		&:last-child {
				border-bottom: 1upx solid $uni-border-color;
		}
		.tixian-left{
			width: 60%;
			height: 90%;
			// border: 1upx solid orange;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			.tixian-left-1{
				width: 90%;
				height: 25%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				text{
					font-size: 28upx;
					font-family: Arial, Helvetica, sans-serif;
				}
			}
			.tixian-left-2{
				width: 90%;
				height: 25%;
				// border: 1upx solid orange;
				text{
					font-size: 24upx;
					font-family: Arial, Helvetica, sans-serif;
					color: green;
				}
			}
			.tixian-left-3{
				width: 90%;
				height: 25%;
				// border: 1upx solid orange;
				text{
					font-size: 20upx;
					font-family: Arial, Helvetica, sans-serif;
					opacity: .6;
				}
			}
			.tixian-left-4{
				width: 90%;
				height: 25%;
				// border: 1upx solid orange;
				text{
					font-size: 20upx;
					font-family: Arial, Helvetica, sans-serif;
					font-weight: 600;
				}
			}
		}
		.tixian-right{
			width: 30%;
			height: 90%;
			// border: 1upx solid orange;
			padding-top: 5%;
			text{
				font-size: 42upx;
				color: green;
				font-weight: bold;
			}
		}
	}
</style>
