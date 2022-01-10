<template>
	<view class="news-detail">
		<!-- 标题 -->
		<view class="title">{{new_data.title}}</view>
		<!-- 基本信息 -->
		<view class="info">
			<text class="author"><text>作者：</text>{{new_data.authers.name}}</text>
			<!-- <text class="source"><text>来源：</text>{{new_data.source}}</text> -->
			<text class="time"><text>时间：</text>{{new_data.create_time}}</text>
		</view>
		<!-- 新闻内容 -->
		<view class="content" v-html="new_data.content"></view>
		<!-- 底线 -->
		<view class="foot">
			~~ 人家是有底线的 ~~
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 新闻数据
				news: [],
				// 显示数据
				new_data: {},
			};
		},
		onLoad(option) {
			if(option.id) {
				this.getArticleByID(option.id);
			}
		},
		methods: {
			// 获取单个文章信息
			getArticleByID (id) {
				const _this = this;
				this.publicModel.getArticleByID(id).then(res => {
					_this.new_data = res.data;
					_this.new_data.content.replace(/<img /g, "<img style='width: 100%'");
				})
			}
		},
	}
</script>

<style lang="scss" scoped>
$color-primary: #444;
$color-title: #333;
$color-title-small: #777;

.news-detail {
	display: flex;
	flex-direction: column;
	padding: 20rpx;
	color: $color-primary;
	font-size: 1.3em;
	.title {
		color: $color-title;
		font-size: 1.2em;
		font-weight: 600;
		margin-bottom: 50rpx;
		margin-top: 30rpx;
	}
	.info {
		color: $color-title-small;
		margin-bottom: 50rpx;
		font-size: 1rem;
		>text {
			margin-right: 30rpx;
			font-weight: 600;
		}
	}
	.content {
		// text-indent: 2em;
		line-height: 1.7em;
		font-size: 1.3em;
		img, image {
			width: 100%;
		}
	}
	.foot {
		width: 100%;
		display: flex;
		justify-content: center;
		margin-top: 80rpx;
		margin-bottom: 40rpx;
		color: #bbb;
	}
}
</style>
