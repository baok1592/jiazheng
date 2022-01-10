<template>
	<view class="people-list">
		<!-- 搜索 -->
		<view class="search">
			<u-search placeholder="请输入要查找的名字" @change="change" @clear="clear" @custom="search" v-model="search_value"></u-search>
		</view>
		<!-- 人物列表 -->
		<view class="lists">
			<template v-for="i in 10">
				<people :type="type" :key="i" class="list"></people>
			</template>
		</view>
	</view>
</template>

<script>
	import People from './components/people.vue'
	
	export default {
		components: {
			People,
		},
		data() {
			return {
				// 用于判断是卖家 还是 买家 列表
				type: '',
				// 搜索的值
				search_value: '',
			};
		},
		onLoad(option) {
			this.type = option.type;
		},
		methods: {
			// 搜索框点击搜索时
			search() {
				console.log('search')
			},
			// 搜索框点击清除按钮时
			clear() {
				this.search_value = '';
			},
			// 搜索框值改变时
			change() {
				console.log(this.search_value)
			}
		}
	}
</script>

<style lang="scss" scoped>
.people-list {
	width: 100vw;
	display: flex;
	flex-direction: column;
	padding: 20rpx;
	
	.search {
		margin-bottom: 40rpx;
	}
	
	.lists {
		width: 100%;
		display: flex;
		flex-direction: column;
		
		.list {
			margin-bottom: 50rpx;
		}
	}
}
</style>
