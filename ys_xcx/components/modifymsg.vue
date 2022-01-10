<template>
	<view class="modifymsg">
		<text>{{e}}</text>
	</view>
</template>
<script>
	export default {
		props:['e'],
	}
</script>
<style lang="scss">
	.modifymsg{
		width: 100%;
		height: 50upx;
		background-color:$uni-bg-color-grey ;
		display: flex;
		justify-content: flex-start;
		align-items: center;
		padding-left: 30upx;
		opacity: .6;
		text{
			font-size: 24upx;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		}
	}
</style>
