<template>
	<view class="buy">
		<view class="buy-main">
			<view class="buy-top">
				<text>订单查询</text>
			</view>
			<view class="buy-section">
				<u-search placeholder="请输入查询的订单号" @custom="search" :action-style="{'font-size': '1.3rem'}" :height="90" :input-style="{'font-size': '1.3rem'}" v-model="order_num" :clearabled="true"></u-search>
			</view>
			<view class="buy-foot">
				<view class="buy-foot-empty" v-if="isShowNull">
					<u-empty :font-size="40" text="您搜索的订单号不存在" mode="list"></u-empty>
				</view>
				<!-- <view class="tip" v-if="!order_num">
					输入 1 可查看不存在订单时的显示<br>
					输入 2 可查看订单
				</view> -->
				<wuliumsg :dat="order_data" v-if="order_data && !isShowNull"></wuliumsg>
			</view>
		</view>
	</view>
</template>
<script>
	import wuliumsg from "../components/wuliumsg.vue"
	export default {
		components:{
			wuliumsg
		},
		data() {
			return {
				order_num: '',
				order_data: '',
				isShowNull: false,
			}
		},
		methods: {
			search() {
				const _this = this;
				wx.showLoading();
				this.publicModel.searchOrder(_this.order_num).then(res => {
					wx.hideLoading();
					if(res.status == 200) {
						_this.isShowNull = false;
						_this.order_data = res.data;
					}
					else {
						_this.isShowNull = true;
					}
				})
				setTimeout(() => {
					wx.hideLoading();
				}, 5000)
			}
		},
		
	}
</script>
<style scoped lang="scss">
	.buy {
		font-size: 1.3rem;
		width: 100%;
		// background-color: orange;
		display: flex;
		justify-content: center;
		align-items: center;
		// padding-top: 20upx;
		padding-bottom: 30upx;
		.buy-main {
			width: 100%;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			.buy-top {
				position: relative;
				width: 100%;
				height: 300upx;
				display: flex;
				justify-content: center;
				align-items: center;
				background-color: $ys-primary;
				text{
					font-size: 38upx;
					color: white;
					font-family: sans-serif;
				}
			}
			.buy-top:after {
				content: "";
				display: flex;
				justify-content: center;
				align-items: center;
				position: absolute;
				bottom: -40upx;
				width: 100%;
				height: 25%;
				background-color: $ys-primary;
				border-bottom-left-radius: 50%;
				border-bottom-right-radius: 50%;
				z-index: -1;
			}
			.buy-section {
				width: 100%;
				height: 100upx;
				// border: 1upx solid orange;
				// flex-grow: 1;
				margin-top: 60upx;
				margin-bottom: 20upx;
				// display: flex;
				// justify-content: center;
				// align-items: center;
				padding-left: 20upx;
				padding-right: 20upx;
			}
			.buy-foot {
				width: 100%;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				>view {
					width: 95%;
				}
				.tip {
					padding-left: 50rpx;
				}
			}
		}
	}
</style>
