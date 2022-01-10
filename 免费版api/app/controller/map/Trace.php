<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/5 0005
 * Time: 9:47
 */

namespace app\controller\map;


use app\controller\common\Common;
use app\model\SysConfig;
use ruhua\bases\BaseController;
use think\facade\Log;
use app\model\Car as CarModel;
use app\model\Plan as PlanModel;

/**轨迹管理
 * Class Trace
 * @package app\controller\map
 */
class Trace  extends BaseController
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

    /**
     * 添加轨迹
     */
    public function add_trace($tid)
    {
        $url="https://tsapi.amap.com/v1/track/trace/add";
        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'tid'=>$tid
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);
        return $res;
    }

    /**删除轨迹
     * @param $sid
     * @param $tid
     * @param $trid
     * @return mixed
     */
    public function del_trace($tid,$trid)
    {
        $url="https://tsapi.amap.com/v1/track/trace/delete";
        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'tid'=>$tid,
            'trid'=>$trid
        ];
        $res=$this->baseCommon->ly_curl_post($url,$data);
        return app('json')->go($res);
    }


    /**轨迹上传
     * @param $sid
     * @param $tid
     * @param $trid
     * @param $points
     * @return mixed
     */
    public function upload_point()
    {
        $data=input('post.');
        $num=$data['equip_num'];
        $points[0]['location']=$data['location'];
        $points[0]['speed']=$data['speed'];
        $points[0]['direction']=$data['direction'];
        $points[0]['locatetime']=time()."000";
        $car_id=CarModel::where('equip_num',$num)->value('id');
        $plan=PlanModel::where(['car_id'=>$car_id,'status'=>[0,1,2]])->select();

        $url="https://tsapi.amap.com/v1/track/point/upload";
        $points=json_encode($points);
        if(!$plan)
            app('json')->go([]);
        $res=array();
        foreach ($plan as $k=>$v){
            $tid=$v['tid'];
            $trid=$v['trid'];
            $data=[
                'key'=>$this->key,
                'sid'=>$this->sid,
                'tid'=>$tid,
                'trid'=>$trid,
                'points'=>$points,
            ];
            $res=$this->baseCommon->ly_curl_post($url,$data);
        }

        return app('json')->go($res);
    }

    public function get_trace($id)
    {
        $url="https://tsapi.amap.com/v1/track/terminal/trsearch";
        $plan=PlanModel::find($id);
        $reg=array();
        $now_address=$this->get_position($plan['car_id']);
        if(isset($plan['json'])){
            $reg['send_address']=$plan['json']['send_address'];
            $reg['received_address']=$plan['json']['received_address'];
            $reg['now_address']=$now_address;
        }
        $tid=$plan['tid'];
        $trid=$plan['trid'];
        $correction['denoise']=1;
        $correction['mapmatch']=1;
        $data=[
            'key'=>$this->key,
            'sid'=>$this->sid,
            'tid'=>$tid,
            'trid'=>$trid,
            'denoise'=>1,
            'mapmatch'=>1
        ];
        $url=$this->baseCommon->cache_url($url,$data);
        $res=$this->baseCommon->curl_post($url);
        $arr=array();
        if(isset($res['data']['tracks'][0]['points'])){
            foreach ($res['data']['tracks'][0]['points'] as $k=>$v){
                $location=explode(',',$v['location']);
                $arr[$k][0]=$location[0];
                $arr[$k][1]=$location[1];
            }
        }
        $reg['positions']=$arr;
        $reg['state']=$plan['status'];
        return app('json')->go($reg);
    }


    public function get_position($cid)
    {
        $url="https://restapi.amap.com/v3/geocode/regeo";
        $car=CarModel::find($cid);
        $position=$car['position'];
        if(!is_array($position)){
            return null;
        }
        $str=$position[0].",".$position[1];
        $url.="?location={$str}&key={$this->key}";
        $res=$this->baseCommon->ly_durl_get($url);

        return $res['regeocode']['formatted_address'];
    }
}