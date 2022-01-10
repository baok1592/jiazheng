<template>
	<view class="scheduling">
		<view class="form">
			<view class="form-item" @tap="showType">
				<view class="form-item-label">运输方式</view>
				<view class="form-item-value">
					<text>{{form.type}}</text>
					<u-select v-model="isShowType" mode="single-column" :list="type_list" @confirm="changeType"></u-select>
				</view>
			</view>
			<!-- <view class="form-item">
				<view class="form-item-label">货物重量</view>
				<view class="form-item-value">
					<u-input v-model="form.goods_weight" />
				</view>
			</view> -->
			<view class="form-item">
				<view class="form-item-label">调度类型</view>
				<view class="form-item-value">
					<u-radio-group v-model="form.scheduling_type" @change="changeSchedulingType">
						<u-radio v-for="(item,index) in scheduling_types" :key="index" :name="item.name" :disabled="item.disabled">{{item.name}}</u-radio>
					</u-radio-group>
				</view>
			</view>
			<!-- <view class="form-item">
				<view class="form-item-label">车辆数量</view>
				<view class="form-item-value">
					<u-number-box @change="changeCarNum" v-model="form.car_number"></u-number-box>
				</view>
			</view> -->
			<template v-for="(item,index) in form.car_number">
				<view class="form-item" @tap="changeIsShwo(index)">
					<view class="form-item-label">选择车辆</view>
					<view class="form-item-value">
						<text>{{form.cars[index]}}</text>
						<u-select v-model="isShow" mode="single-column" :list="car_list" @confirm="confirm"></u-select>
					</view>
				</view>
				<!-- <view class="form-item">
					<view class="form-item-label">承运重量</view>
					<view class="form-item-value">
						<u-input v-model="form.cars_wieght[index]" placeholder="请输入重量"/>
					</view>
				</view> -->
			</template>
			<!-- 异常调度 -->
			<view class="form-item" v-if="form.isAbnormal">
				<view class="form-item-label">车辆信息</view>
				<view class="form-item-value form-item-value_around">
					<text>9.8m</text>
					<text>高栏</text>
					<!-- <view>类型：<text>9.8</text>m</view>
					<view>栏高：<text>高栏</text></view> -->
				</view>
			</view>
			<view class="form-item" v-if="form.isAbnormal">
				<view class="form-item-label">司机信息</view>
				<view class="form-item-value form-item-value_around">
					<!-- <view>姓名：<text>老司机</text></view>
					<view>电话：<text>13574653498</text></view> -->
					<text>老司机</text>
					<text>13574653498</text>
				</view>
			</view>
			<!-- 异常调度 end -->
			<view class="form-item">
				<view class="form-item-label">信息费</view>
				<view class="form-item-value">
					<!-- <u-input style="text-align: right !important" v-model="form.information_money" /> -->
					<input type="number" v-model="form.information_money" />
				</view>
			</view>
			<view class="form-item">
				<view class="form-item-label">油卡金额</view>
				<view class="form-item-value">
					<!-- <u-input style="text-align: right" v-model="form.oli_money" /> -->
					<input type="number" v-model="form.oli_money" />
				</view>
			</view>
			<view class="form-item">
				<view class="form-item-label">加油金额</view>
				<view class="form-item-value">
					<!-- <u-input style="text-align: right" v-model="form.add_oli_money" /> -->
					<input type="number" v-model="form.add_oli_money" />
				</view>
			</view>
			<!-- 异常调度说明 -->
			<view class="form-item" v-if="form.isAbnormal">
				<view class="form-item-label">异常说明</view>
				<view class="form-item-value">
					<!-- <u-input style="text-align: right" v-model="form.content" /> -->
					<input type="text" v-model="form.content" placeholder="请输入说明" />
				</view>
			</view>
		</view>
		
		<!-- 提交按钮 -->
		<button type="primary" class="btn" @tap="submit">提交</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 运输方式选择 picker
				isShowType: false,
				// 车辆选择 picker
				isShow: false,
				// 表单
				form: {
					// 运输方式
					type: '--请选择--',
					// 货物重量
					goods_weight: 1,
					// 调度类型
					scheduling_type: '',
					// 车辆数量
					car_number: 1,
					// 选择的车辆
					cars: ['--请选择--'],
					// 车辆对应的承运重量
					cars_wieght: [1],
					// 信息费
					information_money: 0,
					// 油卡金额
					oli_money: 0,
					// 加油金额
					add_oli_money: 0,
					// 是否异常调度
					isAbnormal: 0,
					// 异常说明
					content: '',
				},
				car_ch: '',
				// 车辆列表
				car_list: [
					{value: 1, label: '贵E1534F', show: false},
					{value: 2, label: '贵E45341', show: false},
					{value: 3, label: '贵E5643Q', show: false},
				],
				// 当前的选择的车辆
				choose_index: 0,
				// 运输方式
				type_list: [
					{value: 1, label: '整单运输', disabled: false},
					{value: 2, label: '拆单运输', disabled: false},
					{value: 3, label: '合单运输', disabled: false},
				],
				// 调度类型列表
				scheduling_types: [
					{name: '正常调度', disabled: false},
					{name: '异常调度', disabled: false},
				],
			};
		},
		methods: {
			// 车辆选择
			confirm(e) {
				this.form.cars[this.choose_index] = e[0].label;
			},
			// 现在车辆列表
			changeIsShwo(index) {
				this.isShow = !this.isShow;
				this.choose_index = index;
			},
			// 改变车辆数量
			changeCarNum(e) {
				if(e.value >= this.form.cars.length) {
					this.form.cars.push('--请选择--');
					this.form.cars_wieght.push(1);
				}
				else {
					this.form.cars.pop();
					this.form.cars_wieght.pop();
				}
				// console.log(this.form.cars)
			},
			// 提交调度
			submit() {
				uni.showToast({
					title: '提交成功',
					icon: 'success',
				})
				setTimeout(() => {
					uni.navigateBack()
				}, 1510)
				console.log(this.form)
			},
			// 显示选择运输方式
			showType() {
				this.isShowType = !this.isShowType;
			},
			// 设置运输方式
			changeType(e) {
				this.form.type = e[0].label;
				// console.log(e[0].label)
			},
			// 修改调度类型
			changeSchedulingType(e) {
				// console.log(this.form.scheduling_type)
				if(e == '异常调度') {
					this.form.isAbnormal = 1;
				}
				else {
					this.form.isAbnormal = 0;
				}
			}
		}
	}
</script>

<style lang="scss" scoped>
$form-border-bottom: #f5f5f5;

.scheduling {
	padding: 20rpx;
	
	.form {
		display: flex;
		flex-direction: column;
		
		.form-item {
			display: flex;
			align-items: center;
			border-bottom: 1px solid $form-border-bottom;
			padding-top: 20rpx;
			padding-bottom: 20rpx;
			
			.form-item-label {
				width: auto;
				min-width: 120rpx;
				flex-shrink: 0;
				margin-right: 40rpx;
				text-align: right;
				font-weight: 600;
			}
			
			.form-item-value {
				width: 100%;
				text-align: right;
				input {
					text-align: right;
				}
				&_around {
					display: flex;
					justify-content: space-around;
				}
				&_column {
					display: flex;
					flex-direction: column;
					>view {
						margin-bottom: 10rpx;
					}
				}
			}
		}
	}
	
	.btn {
		margin-top: 80rpx;
	}
}

.u-radio__label {
	font-size: 13px !important;
}

.uni-input-input {
	text-align: right !important;
}
input {
	text-align: right !important;
}
</style>
