<?php


namespace app\controller;

use ruhua\bases\BaseController;
use think\facade\Db;

//数据模拟生成，上线删除

class Moni extends BaseController
{
    private $names=['王','张','李','玉','龙','虎','郑','徐','司','季'];
    /**
     * @param $num
     */
    public function add_driver($num)
    {

        Db::startTrans();
        try {
            for ($i=0;$i<$num;$i++){
                $name=$this->names[rand(0,9)].$this->names[rand(0,9)];
                $mobile=$this->randMobile();
                $sex=rand(0,1);

            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**生成手机号码
     * @param int $num
     * @return array
     */
    public function randMobile($num = 1){
        //手机号2-3为数组
        $numberPlace = array(30,31,32,33,34,35,36,37,38,39,50,51,58,59,89);
        for ($i = 0; $i < $num; $i++){
            $mobile = 1;
            $mobile .= $numberPlace[rand(0,count($numberPlace)-1)];
            $mobile .= str_pad(rand(0,99999999),8,0,STR_PAD_LEFT);
            $result[] = $mobile;
        }
        return $result;
    }

    public function random_card(){
        $city = array(11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91);
        //校验位
        $parity = array('1','0','X','9','8','7','6','5','4','3','2');
//       $a = array('a','b','c');
        $arr = array(0,1,2,3,4,5);
        $str = '';
//       echo $city[array_rand($city)];
        //前两位
        $str .=$city[array_rand($city)];
        //地区位后四位
        for($i=0;$i<4;$i++){
            $str .=$arr[array_rand($arr)];
        }
        //出生年 随机20世纪
        $str .= '19'.mt_rand(0,9).mt_rand(0,9);
        //月份
        $month = array('01','02','03','04','05','06','07','08','09','10','11','12');
        $str .=$month[array_rand($month)];
        //天
        $day = mt_rand(0,3);
        if($day==3){
            $str .=$day.mt_rand(0,1);
        }else{
            $str .=$day.mt_rand(0,9);
        }
        //顺序码
        for($i=0;$i<3;$i++){
            $str .=mt_rand(0,9);
        }
        //计算加权因子
        for($i=18;$i>1;$i--){
            $factor[] = fmod(pow(2,$i-1),11);
        }
        //将加权因子和身份证号对应相乘,再求和
        $sum = 0;
        for($i=0;$i<count($factor);$i++){
            $sum +=$factor[$i]*$str[$i];
        }
        //将sum对11求余
        $mod = fmod($sum,11);
        $str .=$parity[$mod];
        return $str;
    }
}