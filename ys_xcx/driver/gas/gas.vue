<template>
	<view class="gas">
		<modify :e="txt"></modify>
		<u-form :model="form" ref="uForm" :label-width="150" :label-align="center">
			<u-form-item label="手机号">
				<u-input v-model="form.mobile" />
			</u-form-item>
		</u-form>
		<modify :e="txtcar"></modify>
		<u-form :model="form" ref="uForm" :label-width="150" :label-align="center">
			<u-form-item label="车牌号">
				<u-input v-model="form.car_number" />
			</u-form-item>
			<u-form-item label="编号">
				<u-input v-model="form.number" />
			</u-form-item>
			<u-form-item label="司机">
				<u-input v-model="form.name" />
			</u-form-item>
		</u-form>
		<modify :e="money"></modify>
		<u-form-item label="金额" :model="form" ref="uForm" :label-width="150" :label-align="center">
			<u-input v-model="form.money" />
		</u-form-item>
		<modify :e="upload"></modify>
		<u-form :model="form" ref="uForm" :label-width="150" :label-align="center">
			<u-upload :action="action" :file-list="fileList"></u-upload>
		</u-form>
		<!-- 确定按钮 -->
		<view class="btn">
			<button type="warn" @tap="test">确定</button>
		</view>
	</view>
</template>
<script>
	import modify from "../../components/modifymsg.vue"
	export default {
		components: {
			modify
		},
		props: ["e"],
		data() {
			return {
				action: 'http://www.example.com/upload',
				// fileList: [{
				// 	// url: 'http://pics.sc.chinaz.com/files/pic/pic9/201912/hpic1886.jpg',
				// }],
				txt: "基本信息",
				form: {
					// 手机号
					mobile: '',
					// 车牌号
					car_number: '',
					// 编号
					number: '',
					// 司机姓名
					name: '',
					// 加油金额
					money: 0,
				},
				checkboxList: [{
						name: '苹果',
						checked: false,
						disabled: false
					},
					{
						name: '雪梨',
						checked: false,
						disabled: false
					},
					{
						name: '柠檬',
						checked: false,
						disabled: false
					}
				],
				radioList: [{
						name: '鲜甜',
						disabled: false
					},
					{
						name: '麻辣',
						disabled: false
					}
				],
				radio: '',
				switchVal: false,
				center: "center",
				upload: "上传票据",
				money: "加油金额",
				txtcar: "车辆信息"
			};
		},
		methods: {
			// test
			test() {
				uni.showToast({
					title: '测试成功',
					success() {
						setTimeout(() => {
							uni.navigateBack();
						}, 1500)
					}
				})
			},
			
		}
	}
</script>
<style lang="scss">
	.gas {
		width: 100vw;
		height: 100vh;
		// padding-left: 4%;
		// padding-right: 4%;
		padding-top: 4%;
		
		.btn {
			width: 95%;
			margin: 0 auto;
			margin-top: 100rpx;
		}
	}
</style>
