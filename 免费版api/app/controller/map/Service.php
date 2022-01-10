<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/3 0003
 * Time: 13:09
 */

namespace app\controller\map;


use app\controller\common\Common;
use app\model\SysConfig;
use ruhua\bases\BaseCommon;
use ruhua\bases\BaseController;
use think\facade\Log;

/**猎鹰服务端
 * Class Service
 * @package app\controller\map
 */
class Service extends BaseController
{
   private $key='';
   private $baseCommon;
    public function __construct()
    {
        $this->key=SysConfig::getMapKey();
        $this->baseCommon=new Common();
    }
    /**创建服务
     * @param $name
     * @param string $desc
     * @return mixed
     */
    public function create_Service($name,$desc='')
    {
        $url="https://tsapi.amap.com/v1/track/service/add";
        $data=[
            'key'=>$this->key,
            'name'=>$name,
            'desc'=>$desc
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);

        return app('json')->go($res);
    }

    /**删除服务
     * @param $sid
     * @return mixed
     */
    public function del_Service($sid)
    {
        $url="https://tsapi.amap.com/v1/track/service/delete";
        $data=[
            'key'=>$this->key,
            'sid'=>$sid
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);

        return app('json')->go($res);
    }

    /**修改服务
     * @param $sid
     * @param null $name
     * @param null $desc
     * @return mixed
     */
    public function update_Service($sid,$name=null,$desc=null)
    {
        $url="https://tsapi.amap.com/v1/track/service/update";
        $data=[
            'key'=>$this->key,
            'sid'=>$sid,
            'name'=>$name,
            'desc'=>$desc
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);

        return app('json')->go($res);
    }

    public function get_Service()
    {
        $url="https://tsapi.amap.com/v1/track/service/list";
        $data=[
            'key'=>$this->key
        ];
        $url=$this->baseCommon->cache_url($url,$data);
        $res=$this->baseCommon->ly_curl_post($url,$data);
        return $res;
    }

    /**api接口
     * @return mixed
     */
    public function get_Service_api()
    {
        $url="https://tsapi.amap.com/v1/track/service/list";
        $data=[
            'key'=>$this->key
        ];
        $url=$this->baseCommon->cache_url($url,$data);
        $res=$this->baseCommon->ly_curl_post($url,$data);
        return app('json')->go($res);
    }



}