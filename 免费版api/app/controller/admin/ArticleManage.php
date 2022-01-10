<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/15 0015
 * Time: 11:38
 */

namespace app\controller\admin;


use app\model\Article as ArticleModel;
use app\service\TokenService;
use ruhua\bases\BaseController;

class ArticleManage extends BaseController
{
    /**
     * 添加文章
     * @return mixed
     */
    public function addArticle()
    {
        $rule = ([
            'title' => 'require|chsDash',
            'content' => 'require',
        ]);
        $post = input('post.');
        $this->validate($post, $rule);
        $post['author']=TokenService::getCurrentTokenAid();
        return ArticleModel::addArticle($post);
    }

    /**
     * 修改文章
     * @return mixed
     */
    public function editArticle()
    {
        $data = $this->request->param('');
        return ArticleModel::editArticle($data);
    }

    /**
     * 删除文章
     * @param int
     * @return mixed
     */
    public function deleteArticle($id)
    {
        return ArticleModel::deleteArticle($id);
    }

    /**
     * cms 获取所有文章
     * @return mixed
     */
    public function adminGetAllArticle($id="",$start="",$end="")
    {
        if($id=="")
            $data = ArticleModel::with('authers')->order('create_time desc')->select();
        else
            $data=ArticleModel::with('authers')->find($id);
        if($start!=""&&$end!="")
            $data = ArticleModel::with('authers')->whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();
        return app('json')->success($data);
    }

    /**
     * cms获取所有文章名称ID
     * @return \think\Collection
     */
    public function allArticleName()
    {
        $res = ArticleModel::field('id,title')->order('create_time desc')->select();
        return app('json')->success($res);
    }
}