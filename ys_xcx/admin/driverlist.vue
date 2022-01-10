<template>
	<view class="driverlist">
		<!-- 搜索 -->
		<view class="export">
			<u-search placeholder="请输入要查找的司机名称" v-model="keyword"></u-search>
		</view>
		<template v-for="i in 6">
			<drivermoment :key="i" :type="'driverList'"></drivermoment>
		</template>
	</view>
</template>
<script>
	import drivermoment from "../components/drivermoment.vue"
	export default {
		components:{
			drivermoment
		},
		data() {
			return {
				keyword: '',
				// 保存这是从司机列表页面到详情页的
				type: 'driverList',
			}
		}
	}
</script>
<style scoped lang="scss">
	.driverlist{
		width: 100vw;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		align-items: center;
		padding-left: 10upx;
		padding-right: 10upx;
		.export{
			width: 95vw;
			height: 100upx;
			margin-top: 3%;
			// border: 1upx solid orange;
			// display: flex;
			// flex-direction: column;
			// justify-content: center;
			// align-items: center;
		}
	}
</style>