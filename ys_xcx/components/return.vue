<template>
	<view class="return" @click="jump">
		<u-icon name="arrow-left" size="30"></u-icon>返回
	</view>
</template>
<script>
	export default {
		data() {
			return {
			};
		},
		methods: {
			jump(){
				this.$u.route({
					url: 'pages/index/ceshi',
					type: 'reLaunch'
				})
			}
		}
	}
</script>
<style lang="scss">
	.return {
		position: fixed;
		left: 0px;
		bottom: 280rpx;
		display: flex;
		justify-content: center;
		align-items: center;
		// opacity: .9;
		background-color: #f19066;
		color: white;
		padding: 6rpx 30rpx 6rpx 0rpx;
		border-radius: 0rpx 60rpx 60rpx 0px;
		z-index: 999;
	}
</style>
