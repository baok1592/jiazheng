<template>
	<view class="drwal">
		<template v-for="i in 8">
			<tx :key="i"></tx>
		</template>
	</view>
</template>
<script>
	import tx from "../../components/tixian.vue"
	export default {
		components:{
			tx
		},
		data() {
			return {
			};
		},
	}
</script>
<style lang="scss">
	.drwal{
		width: 100vw;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		align-items: center;
		padding: 20rpx 0;
	}
</style>
