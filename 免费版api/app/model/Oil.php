<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;


class Oil extends BaseModel
{
  /*  protected $globalScope = ['times'];
    public function scopeTimes($query){
        $post=input('post.');
        $start="";
        $end="";
        if(isset($post['start'])&&isset($post['end'])){

            $start=$post['start'];
            $end=$post['end'];
            $end.=" 23:59:59";

        }
        $get=input('get.');
        if(isset($get['start'])&&isset($get['end'])){
            $start=$get['start'];
            $end=$get['end'];
            $end.=" 23:59:59";


        }

        if($start!=""&&$end!="")
            $query->whereTime("create_time",'between',[$start,$end]);

    }*/

    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,username,name');
    }
}
