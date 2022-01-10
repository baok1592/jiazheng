<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/22 0022
 * Time: 8:58
 */

namespace app\controller\common;


use app\model\Article as ArticleModel;
use ruhua\bases\BaseController;

class Article extends BaseController
{
    /**
     *  获取所有文章
     * @return mixed
     */
    public function getAllArticle()
    {
        $data = ArticleModel::where(['is_hidden' => 0])->select();
        return app('json')->success($data);
    }


    /**
     * 获取文章详情
     * @return mixed
     */
    public function getOneArticle($id)
    {
        return ArticleModel::getOneArticle($id);
    }

    /**
     * 用户分类文章
     * @param $type
     * @return mixed
     */
    public function getTypeArticle($type)
    {
        $res=ArticleModel::with(['img'])->where('is_hidden',0)->where('type',$type)->select();
        return app('json')->success($res);
    }

    /**
     * 用户获取文章
     * @return mixed
     */
    public function userArticle()
    {
        return ArticleModel::userArticle();
    }
}