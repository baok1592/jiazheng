<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/4 0004
 * Time: 14:07
 */

namespace app\controller\map;


use ruhua\bases\BaseController;
use app\model\SysConfig;
use app\controller\common\Common;
use think\facade\Log;

class Terminal extends BaseController
{

    private $key='';
    private $baseCommon;
    private $sid;
    public function __construct()
    {
        $this->key=SysConfig::getMapKey();
        $this->baseCommon=new Common();
        $this->sid=config('setting.map_sid');
    }

    /**创建终端
     * @param string $sid
     * @param string $name名称
     * @param string $desc描述
     * @param string $props  json格式
     * @return mixed
     */
    public function create_terminal($name="",$desc="",$props=array())
    {
        $url="https://tsapi.amap.com/v1/track/terminal/add";

        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'name'=>$name,
            'desc'=>$desc,
        ];

        $res=$this->baseCommon->ly_curl_post($url,$data);
        return $res;
    }


    /**删除终端
     * @param $sid
     * @param $tid
     * @return mixed
     */
    public function delete_terminal($tid)
    {
        $url="https://tsapi.amap.com/v1/track/terminal/delete";
        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'tid'=>$tid
        ];
        $res=$this->baseCommon->ly_curl_post($url, $data);
        return $res;
    }


    /**更新终端
     * @param string $sid
     * @param string $name
     * @param string $desc
     * @param string $props
     * @param $tid
     * @return mixed
     */
    public function update_terminal($name="",$desc="",$props="",$tid)
    {
        $url="https://tsapi.amap.com/v1/track/terminal/add";
        $props=json_encode($props);
        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'name'=>$name,
            'desc'=>$desc,
            'props'=>$props,
            'tid'=>$tid
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);
        return app('json')->go($res);
    }


    public function get_terminal($tid='',$name=null,$page=1)
    {
        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'tid'=>$tid,
            'name'=>$name,
            'page'=>$page
        ];
        $url="https://tsapi.amap.com/v1/track/terminal/list";
        $url=$this->baseCommon->cache_url($url,$data);
        $res=$this->baseCommon->ly_durl_get($url);
        return app('json')->success($res);
    }


    /**查找终端
     * @param $sid
     * @param $keywords关键字
     * @param null $filter多条件
     * @param string $sortrule排序
     * @param int $page页码
     * @param int $pagesize每页返回结果
     */
    public function search_terminal($sid,$keywords,$sortrule="asc",$page=1,$pagesize=10,$filter=null)
    {
        $url="https://tsapi.amap.com/v1/track/terminal/search";
        $data=[
            'key'=>$this->key,
            'sid'=>$sid,
            'keywords'=>$keywords,
            'filter'=>$filter,
            'sortrule'=>$sortrule,
            'page'=>$page,
            'pagesize'=>$pagesize
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);
        Log::error($res);
        return $res;
    }

    public function round_search_terminal($sid,$center,$radius,$filter=null,$sortrule="asc",$page=1,$pagesize=10)
    {
        $data=[
            'key'=>$this->key,
            'sid'=>$sid,
            'center'=>$center,
            'radius'=>$radius,
            'filter'=>$filter,
            'sortrule'=>$sortrule,
            'page'=>$page,
            'pagesize'=>$pagesize
        ];
        $url="https://tsapi.amap.com/v1/track/terminal/aroundsearch";
        $res=$this->baseCommon->ly_curl_post($url,$data);
        return app('json')->go($res);

    }




}