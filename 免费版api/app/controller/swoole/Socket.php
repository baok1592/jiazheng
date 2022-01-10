<?php
include_once "mysql.php";
include_once 'Common.php';

class Socket
{
    /**
     *更新车辆信息
     */
    private $connect;
    private $common;
    public function __construct()
    {
        $this->connect=(new mysql());
        $this->common=new Common();
    }

    public function update_position($data)
    {
        $position=[$data['lat'],$data['lng']];
        $position=json_encode($position);
         $dt=[
             'equip_num'=>$data['num'],
             'position'=>$data['lat'].",".$data['lng'],
             'speed'=>$data['speed'],
             'direction'=>$data['direction']
         ];
         $sql="update ys_car set position='{$position}' WHERE equip_num='{$data['num']}'";
         echo $sql."\n";
         $this->connect->query($sql);
         $sql="select *from ys_car WHERE equip_num='{$data['num']}'";
         echo $sql."\n";
         $res=$this->connect->select($sql);
        $dt['location']=$dt['position'];
         if(count($res)>0){
             echo "enter1";
             $reg=(new Common())->curl_post('map/upload_point',$dt);
             echo $reg."\n";
             return $res[0];
         }
         else
             return null;
    }

    public function get_car($num)
    {
        $sql="select *from ys_car where equip_num='$num'";
        $res=$this->connect->select($sql);
        return $res;
    }

    public function get_car_id($id)
    {
        $sql="select *from ys_car where id=$id";
        $res=$this->connect->select($sql);
        return $res;
    }




}

