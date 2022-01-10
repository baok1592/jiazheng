<template>
	<view class="wuliumsg" @click="jump" >
		<view class="wuliumsg-1">
			<view class="wuliumsg-1-1">
				<text>{{dat.start}}</text>
			</view>
			<view class="wuliumsg-1-2">
				<u-icon name="arrow-rightward" color="#2979ff" size="28"></u-icon>
			</view>
			<view class="wuliumsg-1-3">
				<text>{{dat.end}}</text>
			</view>
			<image class="img_icon" src="../static/map1.png" mode="" v-if="dat.status==2||dat.status==3"></image>
		</view>
		<view class="wuliumsg-2">
			<view class="wuliumsg-2-left">
				<text>运单号:</text>
				<text class="ml-2">{{dat.order_num}}</text>
			</view>
			<view class="wuliumsg-2-right">
				<text class="status-2" v-if="dat.status==2">运输中</text>
				<text class="status-3" v-if="dat.status==3">已完成</text>
			</view>
		</view>
		<view class="wuliumsg-3 wuliumsg-3_border-b">
			<view class="wuliumsg-3-left">
				<text>时间:</text>
			</view>
			<view class="wuliumsg-3-right">
				<text>{{dat.create_time}}</text>
			</view>
			<view class="wuliumsg-3-left">
				<text>电话:</text>
			</view>
			<view class="wuliumsg-3-right">
				<text>{{dat.dd_json.car_info.mobile}}</text>
			</view>
		</view>
		<view class="wuliumsg-3">
			<view class="wuliumsg-3-left">
				<text>姓名:</text>
			</view>
			<view class="wuliumsg-3-right">
				<text>{{dat.dd_json.car_info.drive_name}}</text>
			</view>
			<view class="wuliumsg-3-left wuliumsg-3-left_text-right">
				<text>车牌号:</text>
			</view>
			<view class="wuliumsg-3-right">
				<text v-if="dat && dat.dd_json">{{dat.dd_json.car_info.car_num}}</text>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		props: {
			dat: {
				type: Object
			}
		},
		data(){
			return{
			}
		},
		methods:{
			jump(){
				const _this = this;
				uni.navigateTo({
					url:"../buyseller/ditu?id=" + _this.dat.id
				})
			}
		}
	}
</script>
<style scoped lang="scss">
	.wuliumsg{
		width: 94vw;
		// overflow: scroll;
		// border: 1upx solid orange;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		align-items: center;
		box-shadow: 5upx 5upx 15upx grey;
		padding-left: 20upx;
		padding-right: 20upx;
		border-radius: 15upx;
		margin-bottom: 30upx;
		font-size: 1.3;
		>view {
			padding-top: 25rpx;
			padding-bottom: 25rpx;
		}
		.wuliumsg-1{
			width: 100%;
			// border: 1upx solid orange;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			position: relative;
			.img_icon {
				width: 50rpx;
				height: 50rpx;
				position: absolute;
				right: 10rpx;
			}
			.wuliumsg-1-1{
				width: 30%;
				height: 100%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: center;
				align-items: center;
				// font-size: 32upx;
				font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
				color:$ys-primary ;
				margin-left: 12upx;
			}
			.wuliumsg-1-2{
				width: 10%;
				height: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.wuliumsg-1-3{
				width: 30%;
				height: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
				// font-size: 32upx;
				font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
				color:$ys-primary ;
				// border: 1upx solid orange;
			}
		}
		.wuliumsg-2{
			width: 100%;
			height: 30%;
			// border: 1upx solid orange;
			display: flex;
			justify-content: center;
			align-items: center;
			border-top: 1upx solid #eee;
			border-bottom: 1upx solid #eee;
			.wuliumsg-2-left{
				width: 75%;
				height: 100%;
				// border: 1upx solid orange;
				padding-left: 10upx;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				text{
					display: flex;
					// flex-direction: row;
					justify-content: flex-start;
					align-items: center;
					font-size: 35upx;
					opacity: .6;
					font-family: Arial, Helvetica, sans-serif;
					// border: 1upx solid orange;
					&:nth-child(2) {
						display: flex;
						justify-content: flex-start;
						align-items: center;
						// font-size: 28upx;
						font-family: Arial, Helvetica, sans-serif;
					}
				}
			}
			.wuliumsg-2-right{
				width: 25%;
				height: 100%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				.status-2 {
					color: #ff9900;
				}
				.status-3 {
					color: #19be6b;
				}
			}
		}
		.wuliumsg-3{
			width: 100%;
			height: 30%;
			// border: 1upx solid orange;
			display: flex;
			justify-content: center;
			align-items: center;
			&_border-b {
				border-bottom: 1upx solid #eee;
			}
			.wuliumsg-3-left{
				width: 14%;
				height: 100%;
				flex-shrink: 0;
				// border: 1upx solid orange;
				padding-left: 10upx;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				text{
					display: flex;
					justify-content: flex-start;
					align-items: center;
					font-size: 25upx;
					opacity: .6;
					font-family: Arial, Helvetica, sans-serif;
				}
				&_text-right {
					justify-content: flex-end;
					margin-right: 20rpx;
				}
				
			}
			.wuliumsg-3-right{
				width: 75%;
				height: 100%;
				// border: 1upx solid orange;
				display: flex;
				justify-content: flex-start;
				align-items: center;
				text{
					display: flex;
					// flex-direction: row;
					justify-content: flex-start;
					align-items: center;
					// font-size: 28upx;
					font-size: 1.2rem;
					font-family: Arial, Helvetica, sans-serif;
				}
			}
		}
	}
	.ml-2 {
		margin-left: 20rpx;
	}
</style>