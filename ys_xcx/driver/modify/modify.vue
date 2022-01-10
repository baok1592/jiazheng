<template>
	<view class="modify">
		<view class="modify-main">
			<!-- <mf :e="msg"></mf>
			<u-field v-model="mobile" label="手机号"disabled>
			</u-field>
			<u-field v-model="code" label="工号" disabled placeholder="请填写验证码">
			</u-field>
			<u-field v-model="zhiwei" label="职位" disabled>
			</u-field>
			<mf :e="car_name"></mf>
			<u-field v-model="car" label="车队" disabled>
			</u-field>
			<u-field v-model="car_code" label="编号" disabled>
			</u-field>
			<mf :e="friend"></mf>
			<u-field v-model="content" label="个性签名" disabled placeholder="">
			</u-field>
			<u-field label="昵称" disabled v-model="name">
			</u-field> -->
			<!-- <mf :e="system"></mf> -->
			<view class="system">
				<view class="btn" @tap="changeInfo">
					<text>修改信息</text>
					<text>></text>
				</view>
				<view class="btn" @tap="checkUpdate">
					<text>检查系统更新</text>
					<text>></text>
				</view>
				<view class="btn" @tap="aboutUs">
					<text>关于我们</text>
					<text>></text>
				</view> 
			</view>
			<view class="bt">
				<!-- <u-button type="primary" @click="xiugai">确认修改</u-button> -->
				<u-button type="error" @click="loginOut">退出登录</u-button>
			</view>
		</view>
		<!-- 提交按钮 -->
	</view>
</template>
<script>
	import mf from "../../components/modifymsg.vue"
	export default {
		components: {
			mf
		},
		data() {
			return {
				msg: '基本信息',
				car_name: '车队信息',
				friend: '签名',
				system: '系统',
				//--
				mobile: "15647546446",
				code: "64646464",
				zhiwei: "经理",
				car: '风行',
				car_code: '65222',
				content: '立长志',
				name: '风致',
				//--
				radio: '支付宝',
				radioCheckWrap: false,
				radioList: [
					{
						name: '支付宝',
						checked: true,
						disabled: false
					},
					{
						name: '微信',
						checked: false,
						disabled: false
					},
					{
						name: '银联',
						checked: false,
						disabled: false
					},
					{
						name: '现金',
						checked: false,
						disabled: false
					}
				],
			}
		},
		methods: {
			// 按钮提交修改
			xiugai() {
				uni.showToast({
					icon: 'success',
					title: '修改成功'
				})
			},
			// 退出登录
			loginOut() {
				uni.showToast({
					icon: 'loading',
					title: '退出中'
				})
				setTimeout(() => {
					uni.setStorageSync('tab_index', 0)
					uni.reLaunch({
						url: '../../pages/index/index'
					})
				}, 1500)
			},
			// 修改信息
			changeInfo() {
				uni.navigateTo({
					url: '../modifyInfo/modifyInfo'
				})
			},
			radioGroupChange(e) {
				this.model.payType = e;
			},
			// 检查系统更新
			checkUpdate() {
				uni.showToast({
					icon: 'loading',
					title: '检查更新中'
				})
				setTimeout(() => {
					uni.showToast({
						icon: 'success',
						title: '已是最新版本'
					})
				}, 1800)
			},
			// 关于我们
			aboutUs() {
				uni.navigateTo({
					url: '../../pages/newsDetail/newsDetail?title=大货车高速被特殊对待，服务区禁止大货车进入，出了事谁负责？'
				})
			}
		}
	}
</script>
<style scoped lang="scss">
	.modify {
		width: 100vw;
		height: 100vh;
		background-color: $uni-bg-color-grey;
		// padding-top: 20upx;
		.modify-main {
			width: 100vw;
			height: 100vh;
			// margin-top: 20upx;
			.u-field {
				background-color: #FFFFFF;
			}
			.bt {
				width: 100%;
				height: 90upx;
				margin-top: 50upx;
				padding-left: 50upx;
				padding-right: 50upx;
				button {
					margin-bottom: 30rpx;
				}
			}
			.system {
				width: 100%;
				.btn {
					display: flex;
					justify-content: space-between;
					padding: 28rpx;
					width: 100%;
					background-color: #fff;
					border-bottom: 1px solid #f7f7f7;
				}
			}
		}
	}
</style>
