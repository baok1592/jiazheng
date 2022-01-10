<template>
	<view class="modify-info">
		<u-field class="item" label="昵称" name="" v-model="name" placeholder="请输入您的昵称" />
		<u-field class="item" label="签名" name="" v-model="content" placeholder="请输入您的签名" />
		<u-field class="item" label="手机号" name="" v-model="phone" placeholder="请输入您手机号" />
		<view class="code">
			<u-field class="item" label="验证码" name="" v-model="code" placeholder="请输入验证码" />
			<!-- <u-button type="primary" :disabled="yzm_disabled" size="medium"></u-button> -->
			<button class="yzm-btn" type="primary" @tap="setCodeTime"><text class="yzm" v-if="isShowYZM">{{yzm_time}}</text>获取验证码</button>
		</view>
		<view class="btn">
			<!-- <u-button type="primary" @tap="enter">确定修改</u-button> -->
			<button type="default" @tap="enter">确定修改</button>
		</view>
	</view>
</template>

<script>
	
	export default {
		data() {
			return {
				name: '',
				content: '',
				phone: '',
				code: '',
				isShowYZM: false,
				yzm_time: 50,
				yzm_disabled: false,
			};
		},
		methods: {
			enter () {
				uni.showToast({
					icon: 'success',
					title: '修改成功'
				})
				setTimeout(() => {
					uni.navigateBack({})
				}, 1800)
			},
			// 验证码间隔
			setCodeTime() {
				const that = this;
				this.yzm_disabled = true;
				that.isShowYZM = true;
				let t = setInterval(() => {
					that.yzm_time--;
					if(that.yzm_time <= 0) {
						clearInterval(t);
						this.yzm_disabled = false;
						that.yzm_time = 50;
						that.isShowYZM = false;
					}
				}, 1000)
			}
		}
	}
</script>

<style lang="scss" scoped>
.modify-info {
	width: 100vw;
	height: 100vh;
	background-color: $uni-bg-color-grey;
	.item {
		
	}
	.code {
		display: flex;
		.yzm-btn {
			margin-right: 10rpx;
			background-color: #2979ff;
			font-size: 1rem;
			height: 80rpx;
		}
		.yzm {
			display: inline-block;
			margin-right: 10rpx;
		}
	}
	.btn {
		position: fixed;
		bottom: 60rpx;
		width: 100vw;
		display: flex;
		justify-content: center;
		button {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 95%;
			height: 80rpx;
			font-size: 1rem;
			color: white;
			background-color: #2979ff;
		}
	}
}
</style>
