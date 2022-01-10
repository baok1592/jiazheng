<template>
	<view>
		<!-- 大图 -->
		<view class="pic">
			<image :src="pic_url" mode="" class="img"></image>
		</view>
		<view class="login-info">
			<view class="login">
				<view class="login-input" :class="{active:distinguish==true}">
					<i class="iconfont">&#xe60b;</i>
					<input class="input" :type="'text'" placeholder="请输入当前账号" v-model="From.UserName" />
					<i class="iconfont delete" v-if="From.UserName" @click="From.UserName=null">&#xe622;</i>
				</view>
				<!-- <text class="tips" v-show="distinguish">{{UserNametips}}</text> -->
			</view>
			<view class="login">
				<view class="login-input" :class="{active:distinguish==true}">
					<i class="iconfont">&#xe605;</i>
					<input class="input" :type="password_type" placeholder="请输入当前密码" v-model="From.PassWord" maxlength="16"/>
					<i class="iconfont delete" v-if="SwiTch" @click="Switch(0)">&#xe6d8;</i>
					<i class="iconfont delete" v-else  @click="Switch(1)">&#xe607;</i>
				</view>
				<!-- <text class="tips" v-show="distinguish">{{PassWordtips}}</text> -->
			</view>
		</view>
		<view class="login-button">
			<!-- <radio :checked="checked" @click="clickchecked" style="transform:scale(0.9)">记住密码</radio> -->
			<!-- <text class="register" @click="Jump">暂无账号点击注册</text> -->
			<button @click="login">点击登录</button>
		</view>
	</view>
</template>
<script>
	/* 本图标全部使用阿里图标,图标目录static yx-login */
	export default {
		data() {
			return {
				From: {
					UserName: '', //账号
					PassWord: '', //密码
				},
				// 大图路径
				pic_url: '../../static/car/car-1.png',
				checked: false, //单选框
				distinguish: false,
				UserNametips: '',
				PassWordtips: '',
				SwiTch: true,
				// 控制密码框类型
				password_type: 'password',
				// 模拟登陆密码
				password: '123456',
			}
		},
		// 读取本地存储密码及账号
		onShow() {
			uni.getStorage({
				key: 'UserInfo',
				success: (e) => {
					this.From.UserName = e.data.UserName
					this.From.PassWord = e.data.PassWord
				}
			})
		},
		onLoad() {
			let type = uni.getStorageSync('name');
			if(type == 'buy') {
				this.From.UserName = '买家';
			}
			else if(type == 'seller') {
				this.From.UserName = '卖家';
			}
			else if(type == 'driver') {
				this.From.UserName = '司机';
			}
			else if(type == 'admin') {
				this.From.UserName = '管理员';
			}
			this.From.PassWord = this.password;
		},
		methods: {
			/* 
			登录逻辑部分
			 */
			login() {
				var that = this;
				let name = this.From.UserName;
				let pwd = this.From.PassWord;
				let pwd_y = this.password;
				if((name == '买家' || name == '卖家' || name == '司机' || name == '管理员') && pwd == pwd_y) {
					this.$u.route({
						url: '/pages/index/index',
						type: 'reLaunch'
					})
				}
				if (that.From.UserName && that.From.PassWord) {
					if (that.From.UserName == "admin" && that.From.PassWord == "123") {
						/* 验证成功跳转目标页面 */
						// uni.reLaunch({
						// 	url:''
						// })
					} else {
						// that.UserNametips = "账号错误请重新填写"
						// that.PassWordtips = "密码错误请重新填写"
						// uni.showToast({
						// 	title: '账号或者密码错误！！！',
						// 	position: 'top',
						// 	icon: 'none',
						// })
						that.distinguish = true
					}
				} else {
					uni.showToast({
						title: '账号密码不能为空！！！',
						position: 'top',
						icon: 'none',
					})
					// that.UserNametips = "账号不能为空"
					// that.PassWordtips = "密码不能为空"
					that.distinguish = true
				}
			},
			/* 记住密码用户第二次进入页面直接填充 */
			clickchecked() {
				var that = this
				this.checked = !this.checked
				if (that.checked == true) {
					if (that.From.UserName && that.From.PassWord) {
						uni.setStorage({
							key: 'UserInfo',
							data: that.From
						})
					}
				}
			},
			Delete() {
				this.From.UserName = ""
			},
			Delete2() {
				this.From.PassWord = ""
			},
			Jump() {
				uni.reLaunch({
					url: '../register/index'
				})
			},
			Switch(flag) {
				if(flag == 0) {
					this.password_type = 'text';
				}
				else if(flag == 1) {
					this.password_type = 'password';
				}
				this.SwiTch = !this.SwiTch
			}
		},
	}
</script>
<style lang="scss">
	/* 背景图设置 */
	page {
		width: 100%;
		height: 100%;
		// background-image: url(../../static/yx-login/login.jpg);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		color: black;
		// background-color: $uni-bg-color-grey;
		// background-color: black;
		// filter: blur(.3px);
	}
	
	.pic {
		margin: 0 auto;
		width: 85%;
		display: flex;
		justify-content: center;
		.img {
			width: 100%;
		}
	}
	
	.login-info {
		display: flex;
		justify-content: center;
		flex-direction: column;
		align-items: center;
		padding: 40rpx 0;
		.login {
			width: 85%;
			margin-bottom: 20rpx;
			color: #333;
			
			.login-input {
				display: flex;
				align-items: flex-end;
				border-bottom: 1px solid #ddd;
				padding-bottom: 20rpx;
				
				.input {
					border: none;
					width: 95%;
					height: 40rpx;
					outline: none;
					padding: 0 40rpx;
					padding-right: 60rpx;
					color: #333;
				}
				i {
					width: 23px;
					height: 20px;
					margin-top: 35px;
				}
				.delete {
					width: 20px;
					height: 20px;
					margin-left: -20px;
				}
			}
		}
	}
	
	.login-button {
		width: 85%;
		margin: 0px auto;
		button {
			width: 100%;
			font-size: 15px;
			height: 40px;
			color: rgb(255, 255, 255);
			background-color: rgb(78, 110, 242);
			margin-top: 16px;
		}
		radio {
			font-size: 14px;
			color: rgb(255, 255, 255);
		}
		.register {
			font-size: 12px;
			color: rgb(255, 255, 255);
			float: right;
			padding-top: 10px;
			text-decoration: underline;
		}
	}
	.active {
		color: orange;
		border-bottom: 1px solid orange !important;
	}
	.tips {
		color: orange;
		font-size: 12px;
		display: initial;
		float: right;
		padding-right: 30px;
	}
</style>
