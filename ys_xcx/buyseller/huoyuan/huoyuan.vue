<template>
	<view class="huoyuan">
		<view class="huoyuan-main">
			<view class="huoyuan-header">
				<view class="huoyuan-header-top">
					<view class="huoyuan-header-top-1">
						<picker @change="bindPickerChange" :value="index" :range="array">
							<view class="uni-input"><text>{{array[index]}}</text></view>
						</picker>
					</view>
					<view class="huoyuan-header-top-2">
						<u-icon name="arrow-rightward"></u-icon>
					</view>
					<view class="huoyuan-header-top-3">
						<picker @change="bindPickerChange1" :value="index1" :range="array">
							<view class="uni-input"><text>{{array[index1]}}</text></view>
						</picker>
					</view>
				</view>
				<!-- <view class="huoyuan-header-bt">
					<view class="huoyuan-header-bt-left">
						<view class="huoyuan-header-bt-left-top">
							<text>详细地址</text>
						</view>
						<view class="huoyuan-header-bt-left-bt">
							<u-form :model="form" ref="uForm">
								<u-input v-model="address_start" />
							</u-form>
						</view>
					</view>
					<view class="huoyuan-header-bt-right">
						<view class="huoyuan-header-bt-right-top">
							<text>详细地址</text>
						</view>
						<view class="huoyuan-header-bt-right-bt">
							<u-form :model="form" ref="uForm">
								<u-input v-model="address_end" />
							</u-form>
						</view>
					</view>
				</view> -->
			</view>
			<!-- <view class="huoyuan-section-1">
				<view class="huoyuan-section-1-data">
					<view class="huoyuan-section-1-data-top">
						<text>发货时间</text>
					</view>
					<view class="huoyuan-section-1-data-bt">
						<text>01日</text>
						<text>6月</text>
					</view>
				</view>
				<view class="huoyuan-section-1-icon">
					<u-icon name="arrow-rightward"></u-icon>
				</view>
				<view class="huoyuan-section-1-data">
					<view class="huoyuan-section-1-data-top">
						<text>到达时间</text>
					</view>
					<view class="huoyuan-section-1-data-bt">
						<text>08日</text>
						<text>6月</text>
					</view>
				</view>
			</view> -->
			<view class="huoyuan-section-2">
				<u-form :model="form" ref="uForm" :label-width="150">
					<u-form-item label="货物类型" @tap="isShow = true">
						<picker @change="opPickerChange" :value="op_index" :range="options" class="goodsType">
							<view class="uni-input"><text>{{options[op_index]}}</text></view>
						</picker>
					</u-form-item>
					<u-form-item label="预装重量">
						<u-input v-model="form.weight" />
					</u-form-item>
					<!-- <u-form-item label="件数(个)">
						<u-input v-model="form.intro" />
					</u-form-item> -->
					<!-- <u-form-item :label-position="labelPosition" label="结算方式" prop="payType" label-width="150">
						<u-radio-group v-model="form.settlement" @change="radioGroupChange" :width="radioCheckWidth" :wrap="radioCheckWrap">
							<u-radio iconSize="18" labelSize="20" shape="circle" v-for="(item, index) in radioList" :key="index" :name="item.name">{{ item.name }}</u-radio>
						</u-radio-group>
					</u-form-item> -->
					<!-- <u-form-item :label-position="labelPosition" label="货物类型" prop="payType" label-width="150">
						<u-radio-group v-model="radio" @change="radioGroupChange" :width="radioCheckWidth" :wrap="radioCheckWrap">
							<u-radio shape="circle" v-for="(item, index) in radioListtwo" :key="index" :name="item.name">{{ item.name }}</u-radio>
						</u-radio-group>
					</u-form-item> -->
				</u-form>
			</view>
			<!-- <view class="huoyuan-foot">
				<u-form :model="form" ref="uForm" :label-width="150">
					<u-form-item label="备注">
						<u-input v-model="form.content" />
					</u-form-item>
				</u-form>
			</view> -->
			<view class="huoyuan-button">
				<button type="primary" @tap="submit">发布货源</button>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		data() {
			return {
				// 选择城市-是否显示
				regoinIsShow: false,
				// 选择城市-数据项
				array: ['-- 请选择 --', '河北省', '山西省', '辽宁省', '吉林省', '黑龙江省', '江苏省', '浙江省', '安徽省', '福建省', '江西省', '山东省', '河南省', '湖北省', '湖南省', '广东省', '海南省', '四川省', '贵州省', '云南省', '陕西省', '甘肃省', '青海省', '台湾省', '内蒙古自治区', '广西壮族自治区', '西藏自治区', '宁夏回族自治区', '新疆维吾尔自治区', '北京市', '天津市', '上海市', '重庆市', '香港特别行政区', '澳门特别行政区'],
				// 选择城市-下标
				index: 0,
				index1: 0,
				// 详细地址，仅显示
				address_start: '',
				address_end: '',
				form: {
					// 详细地址
					address_start: '',
					address_end: '',
					// 重量
					weight: 1,
					// 类型
					type: '',
					// 备注
					content: '',
					// 结算方式
					settlement: '',
				},
				// 货物类型数据
				options: ['-- 请选择 --', '光面钢筋', '带肋钢筋', '钢线', '冷轧扭钢筋'],
				// 货物类型下标
				op_index: 0,
				isShow: false,
				rules: {
					name: [{
						required: true,
						message: '请输入姓名',
						// 可以单个或者同时写两个触发验证方式
						trigger: 'blur,change'
					}],
					intro: [{
						min: 5,
						message: '简介不能少于5个字',
						trigger: 'change'
					}]
				},
				radio: '需求车型',
				radioCheckWrap: false,
				labelPosition: 'left',
				radioCheckWidth: 'auto',
				radioList: [
					{
						name: '高栏',
						checked: false,
						disabled: false
					},
					{
						name: '低栏',
						checked: false,
						disabled: false
					},
					{
						name: '平板',
						checked: false,
						disabled: false
					},
					{
						name: '厢式',
						checked: false,
						disabled: false
					}
				],
				radioListtwo: [
					{
						name: '泡货',
						checked: true,
						disabled: false
					},
					{
						name: '重货',
						checked: false,
						disabled: false
					},
					{
						name: '重泡货',
						checked: false,
						disabled: false
					}
				],
			}
		},
		methods:{
			radioGroupChange(e) {
				// console.log(e)
			},
			bindPickerChange: function(e) {
				this.index = e.target.value
			},
			bindPickerChange1: function(e) {
				this.index1 = e.target.value
			},
			opPickerChange: function(e) {
				this.op_index = e.target.value
				if(e.target.value != 0) {
					this.form.type = this.options[this.op_index];
				}
			},
			submit() {
				
				const that = this;
				
				if(this.index != 0 && this.index1 != 0)  {
					this.form.address_start = this.array[this.index] + this.address_start;
					this.form.address_end = this.array[this.index1] + this.address_end;
				}
				// ---
				console.log(this.form)
				// ---
				if(!(this.form.address_start && this.form.address_end && this.form.weight && this.form.type)) {
					uni.showToast({
						title: '请填写完整。。。',
						icon: 'none',
					})
				}
				else {
					uni.showToast({
						title: '测试成功',
						success() {
							// that.form.address_start = '';
							// that.form.address_end = '';
							// that.form.weight = 1;
							// that.form.type = '';
							// that.form.content = '';
							// that.form.settlement = '';
							setTimeout(() => {
								uni.reLaunch({
									url: "../../driver/driver"
								})
							}, 1500)
						},
					})
				}
			},
			
		}
	}
</script>
<style scoped lang="scss">
	.huoyuan {
		// width: 100vw;
		min-height: 100vh;
		display: flex;
		justify-content: center;
		// align-items: center;
		padding: 0 20upx;
		box-sizing: border-box;
		background-color: $uni-bg-color-grey;
		// overflow: scroll;
		.huoyuan-main {
			width: 94vw;
			// height: 130vh;
			display: flex;
			flex-direction: column;
			justify-content: flex-start;
			align-items: center;
			background-color: $uni-bg-color-grey;
			// border: 1upx solid orange;
			.huoyuan-header {
				width: 100%;
				// height: 40%;
				height: 360rpx;
				// border: 1upx solid orange;
				margin-top: 3%;
				border-radius: 20upx;
				display: flex;
				flex-direction: column;
				justify-content: space-around;
				align-items: center;
				background-color: #FFFFFF;
				.huoyuan-header-top {
					width: 95%;
					height: 40%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
					.huoyuan-header-top-1 {
						width: 25%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							font-size: 32upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							color: orange;
							font-weight: bold;
						}
					}
					.huoyuan-header-top-2 {
						width: 25%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						margin-left: 20upx;
						margin-right: 20upx;
					}
					.huoyuan-header-top-3 {
						width: 25%;
						height: 90%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: center;
						align-items: center;
						text {
							font-size: 32upx;
							font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
							color: orange;
							font-weight: bold;
						}
					}
				}
				.huoyuan-header-bt {
					width: 95%;
					height: 40%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
					.huoyuan-header-bt-left {
						width: 50%;
						height: 100%;
						// border: 1upx solid orange;
						border-right: 4upx solid $uni-border-color;
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
						.huoyuan-header-bt-left-top {
							width: 85%;
							height: 50%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								font-size: 28upx;
								font-family: Arial, Helvetica, sans-serif;
								opacity: .7;
							}
						}
						.huoyuan-header-bt-left-bt {
							width: 85%;
							height: 50%;
							// border: 1upx solid orange;
							border-bottom: 2upx solid $uni-border-color;
							// padding-bottom: 15upx;
						}
					}
					.huoyuan-header-bt-right {
						width: 50%;
						height: 100%;
						// border: 1upx solid orange;
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
						.huoyuan-header-bt-right-top {
							width: 85%;
							height: 50%;
							// border: 1upx solid orange;
							display: flex;
							justify-content: flex-start;
							align-items: center;
							text {
								font-size: 28upx;
								font-family: Arial, Helvetica, sans-serif;
								opacity: .7;
							}
						}
						.huoyuan-header-bt-right-bt {
							width: 85%;
							height: 50%;
							// border: 1upx solid orange;
							border-bottom: 2upx solid $uni-border-color;
						}
					}
				}
			}
			.huoyuan-section-1 {
				width: 100%;
				height: 20%;
				// border: 1upx solid orange;
				margin-top: 5%;
				border-radius: 20upx;
				background-color: #FFFFFF;
				display: flex;
				justify-content: center;
				align-items: center;
				.huoyuan-section-1-data {
					width: 43%;
					height: 90%;
					// border: 1upx solid orange;
					display: flex;
					flex-direction: column;
					justify-content: center;
					align-items: center;
					.huoyuan-section-1-data-top {
						width: 100%;
						height: 20%;
						// border: 1upx solid orange;
						display: flex;
						justify-content: flex-start;
						align-items: center;
						text {
							font-size: 24upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							opacity: .6;
							margin-left: 10%;
						}
					}
					.huoyuan-section-1-data-bt {
						width: 100%;
						height: 60%;
						// border: 1upx solid orange;
						text {
							font-size: 28upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							opacity: .6;
						}
						text:nth-child(1) {
							font-size: 62upx;
							font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
							opacity: .6;
							color: orange;
							margin-left: 10%;
						}
						text:nth-child(2) {
							margin-left: 3%;
						}
					}
				}
				.huoyuan-section-1-icon {
					width: 10%;
					height: 90%;
					// border: 1upx solid orange;
					display: flex;
					justify-content: center;
					align-items: center;
				}
			}
			.huoyuan-section-2 {
				width: 100%;
				// height: 50%;
				// border: 1upx solid orange;
				margin-top: 5%;
				border-radius: 20upx;
				background-color: #FFFFFF;
				padding: 4%;
				.sel-tmp {
					width: 100px;
				}
				.sel {
					width: 100%;
					border: none;
					outline: none;
				}
				.goodsType {
					width: 100%;
				}
			}
			.huoyuan-foot {
				width: 100%;
				height: 10%;
				// border: 1upx solid orange;
				margin-top: 5%;
				border-radius: 20upx;
				background-color: #FFFFFF;
				padding-left: 5%;
			}
			.huoyuan-button {
				width: 100%;
				// border: 1upx solid orange;
				margin-top: 80rpx;
				border-radius: 20upx;
				background-color: $uni-bg-color-grey;
				display: flex;
				justify-content: center;
				align-items: center;
				// margin-top: 100upx;
				// background-color: #FFFFFF;
				button {
					display: flex;
					justify-content: center;
					align-items: center;
					width: 100%;
					height: 80rpx;
					background-color: #007AFF;
					font-size: 1rem;
				}
			}
		}
	}
</style>
