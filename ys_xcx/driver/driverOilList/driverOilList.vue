<template>
	<view class="oil">
		<!-- 加油按钮 -->
		<view class="btn">
			<button type="warn" @tap="jump_gas">去加油</button>
		</view>
		<!-- 加油列表 -->
		<view class="lists">
			<template v-for="i in 8">
				<oil-list :key="i" class="list"></oil-list>
			</template>
		</view>
	</view>
</template>

<script>
	import OilList from './components/oil-list.vue'
	
	export default {
		components: {
			OilList,
		},
		data() {
			return {
				
			};
		},
		methods: {
			// 去加油
			jump_gas() {
				uni.navigateTo({
					url: "../../driver/gas/gas"
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.oil {
	display: flex;
	flex-direction: column;
	padding: 20rpx;
	background-color: #eee;
	
	.lists {
		.list {
			margin-top: 20rpx;
		}
	}
}
</style>
