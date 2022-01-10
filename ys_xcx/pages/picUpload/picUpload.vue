<template>
	<view class="pic-upload">
		<view class="num num_text_lag">
			<text>订单号：</text>
			<input class="input" type="text" v-model="order_num" placeholder="请输入运单号" />
		</view>
		<view class="num num_text_lag">
			<text>车牌号：</text>
			<input class="input" type="text" v-model="car_num" placeholder="请输入车牌号" />
		</view>
		<view class="upload">
			<view class="imgs">
				<image v-if="img_flag" class="img_2" :src="Api_url+imgs" mode="" @tap="useCamera"></image>
				<image v-if="!img_flag" class="img" :src="img_url" mode="" @tap="useCamera"></image>
				<view class="delete-i">
					<i class="iconfont iconshanchu" @tap="deleteImg" v-if="img_flag"></i>
				</view>
			</view>
		</view>
		<!--  -->
		<button type="primary" class="submit" @tap="submit">提交</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				img_url: '../../static/upload.png',
				// 判断是否上传了图片
				img_flag: false,
				imgs: '',
				order_num: '',
				car_num: '',
				Api_url: this.config.Api_url
			};
		},
		methods: {
			// 调起相机
			useCamera() {
				let that = this;
				uni.chooseImage({
					count: 1,
					success: (res) => {
						wx.showLoading()
						that.img_flag = true;
						uni.uploadFile({
							url: that.Api_url + '/admin/common/upload_img',
							filePath: res.tempFilePaths[0],
							name: 'img',
							success: (res2) => {
								wx.hideLoading();
								let dat = JSON.parse(res2.data);
								this.imgs = dat.data.url
							},
							fail(err) {
								wx.hideLoading();
								console.log('s:', err)
							}
						});
					},
					fail(error) {
						uni.showToast({
							title: '获取图片失败',
						})
					}
				})
			},
			// 提交
			submit() {
				const _this = this;
				wx.showLoading()
				if(this.order_num && this.imgs && this.car_num) {
					_this.publicModel.uploadImg({order_num: _this.order_num, imgs: _this.imgs, sign_car: _this.car_num}).then(res2 => {
						console.log(res2)
						wx.hideLoading();
						if(res2.status == 200) {
							uni.showToast({
								title: '上传成功',
								icon: 'success',
								success() {
									setTimeout(()=>{
										uni.reLaunch({
											url: '../index/index'
										})
									}, 1500)
								},
								fail(err) {
									wx.hideLoading();
								}
							});
						}
						else {
							uni.showToast({
								title: res2.data.msg,
								icon: 'none',
							});
						}
					});
				}
				else {
					uni.showToast({
						title: '请填写完整',
						icon: 'none',
					})
				}				
			},
			// 删除图片
			deleteImg() {
				this.imgs = '';
				this.img_flag = false;
			},
			
		}
	}
</script>

<style lang="scss" scoped>
.pic-upload {
	width: 100%;
	padding: 20rpx;
	.num {
		width: 100%;
		display: flex;
		align-items: center;
		margin-top: 20rpx;
		padding-bottom: 20rpx;
		border-bottom: 2rpx solid #eee;
		&_text_lag {
			font-size: 1.3rem;
			.input {
				font-size: 1.3rem;
			}
		}
		>text {
			display: inline-block;
			width: 300rpx;
		}
		input {
			width: 100%;
			font-size: 0.9rem;
			// border-bottom: 2rpx solid #eee;
			padding-bottom: 10rpx;
		}
	}
	
	.upload {
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 50rpx;
		position: relative;
		.imgs {
			width: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			.img {
				width: 300rpx;
				height: 300rpx;
				&_2 {
					width: 100%;
				}
			}
			.delete-i {
				position: absolute;
				top: -12rpx;
				left: -12rpx;
				background-color: white;
				border-radius: 50%;
				box-shadow: 0 0 0 4rpx #fff;
				i {
					font-size: 1.4rem;
				}
			}
		}
	}
	
	.submit {
		position: fixed;
		width: 95%;
		left: 2.5%;
		bottom: 20rpx;
	}
}
</style>


"uploadFile:fail Error [ERR_TLS_CERT_ALTNAME_INVALID]: Hostname/IP does not match certificate's altnames: Host: yswl.ruhuashop.com. is not in the cert's altnames: DNS:api.ruhuashop.com"