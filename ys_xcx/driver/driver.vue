<template>
	<view class="driveru">
		<driver></driver>
		<driver></driver>
		<driver></driver>
		<driver></driver>
		<driver></driver>
		<tabbar></tabbar>
	</view>
</template>
<script>
	import driver from "../components/driver.vue";
	import tabbar from "../components/tabbar.vue";
	
	export default {
		components:{
			driver,
			tabbar,
		},
		onShow() {
			  wx.hideHomeButton();
		},
	}
</script>
<style scoped lang="scss">
	.driveru{
		padding-bottom: 140rpx;
	}
</style>