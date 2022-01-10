<template>
	<view class="tab">
		<!-- <u-tabbar v-model="current" :list="list"></u-tabbar> -->
		<view class="mask" v-if="isShow">
			<template v-for="(item,index) in list">
				<view class="option" :class="{option_Eff: tab_index == index}" :key="index" @tap="jump(item.pagePath, index)">
					<view class="icon">
						<template v-if="item.iconPath == 'play-right'">
							<i class="iconfont iconyousanjiaoxiangyoumianxing"></i>
						</template>
						<template v-else-if="item.iconPath == 'account'">
							<i class="iconfont iconwodedangxuan"></i>
						</template>
						<template v-else-if="item.iconPath == 'home'">
							<i class="iconfont iconicon_home"></i>
						</template>
					</view>
					<view class="text">
						<template v-if="item.iconPath == 'play-right'">
							计划
						</template>
						<template v-else-if="item.iconPath == 'account'">
							我的
						</template>
						<template v-else-if="item.iconPath == 'home'">
							首页
						</template>
					</view>
				</view>
			</template>
		</view>
	</view>
</template>
<script>
	
	export default {
		data() {
			return {
				// 是否显示自定义tabbar
				isShow: true,
				// 保存当前点击的tabbar下标
				tab_index: 0,
				// 保存所有 tabbar 跳转的路径
				listData: [{
					pagePath: "/driver/driver",
					iconPath: "play-right",
					selectedIconPath: "play-right-fill",
					text: '计划',
					customIcon: false,
				}, {
					pagePath: "/pages/user/user",
					iconPath: "account",
					selectedIconPath: "account-fill",
					text: '我的',
					customIcon: false,
				}, {
					pagePath: "/driver/personal/personal",
					iconPath: "account",
					selectedIconPath: "account-fill",
					text: '我的',
					customIcon: false,
				}, {
					pagePath: "/admin/adminindex",
					iconPath: "play-right",
					selectedIconPath: "play-right-fill",
					text: '计划',
					customIcon: false,
				}],
				
				// tabbar 设置
				list: [{
					pagePath: "/pages/index/index",
					iconPath: "home",
					selectedIconPath: "home-fill",
					text: '首页',
					isDot: true,
					customIcon: false,
				}],
				current: 0,
			}
		},
		mounted() {
			const a = uni.getStorageSync('name');
			// console.log(a);
			switch (a) {
				case "admin":
					this.list.push(this.listData[3])
					this.list.push(this.listData[2])
					break;
				case "buy":
					break;
				case "driver":
					this.list.push(this.listData[0])
					this.list.push(this.listData[2])
					break;
				case "seller":
					this.list.push(this.listData[0])
					break;
				default:
					break;
			}
			// console.log(this.list);
		},
		methods: {
			// 跳转
			jump(path, index) {
				uni.setStorageSync('tab_index', index);
				uni.reLaunch({
					url: path,
				})
			},
		},
		created() {
			let index = 0;
			if(uni.getStorageSync('tab_index')) {
				index = uni.getStorageSync('tab_index');
			}
			this.tab_index = index;
		}
	}
</script>
<style lang="scss" scoped>
.tab {
	.mask {
		position: fixed;
		height: 100rpx;
		width: 100vw;
		left: 0;
		bottom: 0;
		z-index: 9999;
		background-color: #fff;
		border-top: 1px solid #eee;
		display: flex;
		justify-content: space-around;
		align-items: center;
		.option {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			// background-color: #0077AA;
			color: #999;
			padding: 0 50rpx;
			i {
				font-size: 1.1em;
			}
			.text {
				font-size: 0.7em;
			}
			&_Eff {
				color: #333;
			}
		}
	}
}
</style>
