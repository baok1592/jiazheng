<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/12/24 0024
 * Time: 9:09
 */

namespace app\controller\common;


use app\controller\admin\Oil;
use app\service\TokenService;
use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\OrderException;
use ruhua\exceptions\TokenException;
use think\App;
use think\facade\Cache;
use app\model\Plan as PlanModel;
use think\facade\Log;
use app\model\Car as CarModel;
use app\model\Equip as EquipModel;
use app\model\CarRepair as CarRepairModel;
use app\model\CarOil as CarOilModel;
use app\model\OilSale as OilSaleModel;
use app\model\OilAppli as OilAppliModel;
use app\model\Parts as PartsModel;
use app\model\PartsRecord as PartsRecordModel;
use app\model\Cw as CwModel;

class Excel extends BaseController
{
    private $start_time='';
    private $end_time='';

    public function __construct(App $app)
    {
        $token = input('get.token');
        $data=input('get.');
        if(isset($data['start_time'])&&isset($data['end_time'])){
            $this->start_time=$data['start_time'];
            $this->end_time=$data['end_time']." 23:59:59";
        }
        if (!$token) {
            throw new TokenException();

        }
        $vars = Cache::get($token);
        if (!$vars) {
            throw new TokenException();
        } else {
            if (!is_array($vars)) {
                $vars = json_decode($vars, true);
            }
            if (!array_key_exists('admin_id', $vars)) {
                throw new TokenException(['msg' => '尝试获取的变量并不存在']);
            }
        }
        parent::__construct($app);
    }

    /**导出计划
     * @throws OrderException
     */
    public function export_plan()
    {
        $data=input('get.');
        if(isset($data['status']))
            $status=$data['status'];
        else
            $status='';
        $data=new PlanModel();
        $data->with(['recorduser','dduser','billuser']);
        if($status!=''){
            if($this->start_time!=''&&$this->end_time!=''){
                $res=PlanModel::with(['recorduser','dduser','billuser'])->where('status',$status)
                    ->whereTime('create_time','between',[$this->start_time,$this->end_time])->select();
            }else{
                $res=PlanModel::with(['recorduser','dduser','billuser'])->where('status',$status)
                    ->select();
            }
        }
        else
            throw new OrderException(['msg'=>'请选择状态']);
       $arr=[];
       if($status==0) {
           $csv_title = array('序号', '创建时间', '计划员', '起始地', '目的地', '计划车数', '计划重量', '备注');
           foreach ($res as $k=>$v){

               $arr[$k]['index']=$k+1;
               $arr[$k]['create_time']=$v['create_time'];
               $arr[$k]['record_user']=$v['recorduser']['name'];
               $arr[$k]['start']=$v['start'];
               $arr[$k]['end']=$v['end'];
               $arr[$k]['car_num']=$v['car_num'];
               $arr[$k]['weight']=$v['weight'];
               $arr[$k]['massege']=$v['massege'];
           }
       }
       elseif ($status==1){
           $csv_title=array('序号','计划员','调度员','调度时间','运单号','起始地','目的地','承运车辆','司机姓名','司机联系电话','所属车队',
               '预装重量（吨）','信息费','油卡金额','加油金额','备注');
           foreach ($res as $k=>$v){
               $arr[$k]['index']=$k+1;
               $arr[$k]['recorduser']=$v['recorduser']['name'];
               $arr[$k]['dduser']=$v['dduser']['name'];
               if(isset($v['dd_json']['dd_time']))
                   $arr[$k]['dd_time']=$v['dd_json']['dd_time'];
               else
                   $arr[$k]['dd_time']="";
               $arr[$k]['order_num']=$v['order_num'];
               $arr[$k]['start']=$v['start'];
               $arr[$k]['end']=$v['end'];
               if(isset($v['dd_json']['car_info'])){
                   $arr[$k]['car_num']=$v['dd_json']['car_info']['car_num'];
                   $arr[$k]['drive_name']=$v['dd_json']['car_info']['drive_name'];
                   $arr[$k]['drive_mobile']=$v['dd_json']['car_info']['mobile'];
                   $arr[$k]['fleet']=$v['dd_json']['car_info']['fleet'];

               }else{
                   $arr[$k]['car_num']='';
                   $arr[$k]['drive_name']='';
                   $arr[$k]['drive_mobile']='';
                   $arr[$k]['fleet']='';
               }

               $arr[$k]['weight']=$v['weight'];
               if(isset($v['dd_json']['msg_money']))
                   $arr[$k]['msg_money']=$v['dd_json']['msg_money'];
               else
                   $arr[$k]['msg_money']=0;

               if(isset($v['dd_json']['yk_money']))
                    $arr[$k]['yk_money']=$v['dd_json']['yk_money'];
               else
                   $arr[$k]['yk_money']=0;

               if(isset($v['dd_json']['jy_money']))
                   $arr[$k]['jy_money']=$v['dd_json']['jy_money'];
               else
                   $arr[$k]['jy_money']=0;
               $arr[$k]['massege']=$v['massege'];
           }

       }
       elseif ($status>=2){
           $csv_title=array('序号','计划员','调度员','运单开具时间','运单号','起始地','目的地','承运车辆','司机姓名','司机联系电话','所属车队',
               '发货人','发货人电话','收货人','收货人电话','收货人地址','货物名称','件数','重量（吨）','信息费','油卡金额','加油金额','单价','运费合计','备注');

           foreach ($res as $k=>$v){
               Log::error($v['id']);
               $arr[$k]['index']=$k+1;
               $arr[$k]['recorduser']=$v['recorduser']['name'];
               $arr[$k]['dduser']=$v['dduser']['name'];
               $arr[$k]['json_create_time']=$v['json']['create_time'];
               $arr[$k]['order_num']=$v['order_num'];
               $arr[$k]['start']=$v['start'];
               $arr[$k]['end']=$v['end'];
               if(isset($v['dd_json']['car_info'])){
                   $arr[$k]['car_num']=$v['dd_json']['car_info']['car_num'];
                   $arr[$k]['drive_name']=$v['dd_json']['car_info']['drive_name'];
                   $arr[$k]['drive_mobile']=$v['dd_json']['car_info']['mobile'];
                   $arr[$k]['fleet']=$v['dd_json']['car_info']['fleet'];

               }else{
                   $arr[$k]['car_num']='';
                   $arr[$k]['drive_name']='';
                   $arr[$k]['drive_mobile']='';
                   $arr[$k]['fleet']='';
               }
               $arr[$k]['send_name']=$v['json']['send_name'];
               if(isset($v['json']['send_tel']))
                 $arr[$k]['send_tel']=$v['json']['send_tel'];
               else
                   $arr[$k]['send_tel']='';
               $arr[$k]['received_name']=$v['json']['received_name'];
               $arr[$k]['received_address']=$v['json']['received_address'];
               $arr[$k]['goods_name']=$v['json']['goods'][0]['name'];
               $arr[$k]['goods_num']=$v['json']['goods'][0]['num'];
               $arr[$k]['goods_weight']=$v['json']['goods'][0]['weight'];
               if(isset($v['dd_json']['msg_money']))
                   $arr[$k]['msg_money']=$v['dd_json']['msg_money'];
               else
                   $arr[$k]['msg_money']=0;
               if(isset($v['dd_json']['yk_money']))
                   $arr[$k]['yk_money']=$v['dd_json']['yk_money'];
               else
                   $arr[$k]['yk_money']=0;
               if(isset($v['dd_json']['jy_money']))
                   $arr[$k]['jy_money']=$v['dd_json']['jy_money'];
               else
                   $arr[$k]['jy_money']=0;
               $arr[$k]['unit_price']=$v['json']['goods'][0]['unit_price'];
               $arr[$k]['total_price']=$v['total_price'];
               $arr[$k]['massege']=$v['massege'];
           }

       }
        $this->put_csv($arr,$csv_title,"调度计划表");

    }

    /**
     * 导出车辆
     */
    public function export_car()
    {
        if($this->start_time!=''&&$this->end_time!=''){
            $list=CarModel::with('operators')-> whereTime('create_time','between',[$this->start_time,$this->end_time])->order('create_time desc')->select();
        }
        else{
            $list=CarModel::with('operators')->order('create_time desc')->select();
        }
        $arr=[];
        $csv_title=array('序号','添加时间','添加人','车牌号','司机名称','司机联系电话','所属车队','身份证','油卡号','开户银行','户主',
            '银行账户','GPS设备');
        foreach ($list as $k=>$v){
            $arr[$k]['index']=$k+1;
            $arr[$k]['crate_time']=$v['create_time'];
            $arr[$k]['operators']=$v['operators']['name'];
            $arr[$k]['car_num']=$v['car_num'];
            $arr[$k]['drive_name']=$v['drive_name'];
            $arr[$k]['mobile']=$v['mobile'];
            $arr[$k]['fleet']=$v['fleet'];
            $arr[$k]['id_card']=$v['id_card'];
            $arr[$k]['oil_card']=$v['oil_card'];
            $arr[$k]['bank_name']=$v['bank_name'];
            $arr[$k]['bank_user']=$v['bank_user'];
            $arr[$k]['bank_num']=$v['bank_num'];
            $arr[$k]['equip_num']=$v['equip_num'];
        }
        $this->put_csv($arr,$csv_title,"车辆信息表");

    }




    /**
     * 导出设备信息
     */
    public function export_equip()
    {
        $list=EquipModel::with(['car','operators'])->order('create_time desc')->select();
        if($this->start_time!=""&&$this->end_time!=""){
            $list=EquipModel::with(['car','operators'])->whereTime('create_time','between',[$this->start_time,$this->end_time])->order('create_time desc')->select();
        }
        $csv_title = array('序号', '添加时间', '设备编号', '操作员');
        $arr=[];
        foreach ($list as $k=>$v){
            $arr[$k]['index']=$k+1;
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['num']=$v['num'];
            $arr[$k]['operators']=$v['operators']['name'];
        }
        $this->put_csv($arr,$csv_title,"设备信息表");

    }


    /**
     * 导出车辆维修信息
     */
    public function export_car_repair()
    {
        $list=CarRepairModel::with('kduser')->order('create_time desc')->select();
        if($this->start_time!=""&&$this->end_time!=""){
            $list=CarRepairModel::with('kduser')-> whereTime('create_time','between',[$this->start_time,$this->end_time])->order('create_time desc')->select();
        }

        $csv_title = array('序号', '开单时间', '车牌号', '司机姓名', '司机联系电话', '零配件费', '工时费', '费用合计', '备注');
        $arr=[];
        foreach ($list as $k=>$v){
            $arr[$k]['index']=$k+1;
            $arr[$k]['create_time']=$v['create_time'];

            if(isset($v['json']['car_num']))
                $arr[$k]['num']=$v['json']['car_num'];
            else
                $arr[$k]['num']='';

            if(isset($v['json']['dirver']))
                $arr[$k]['dirver']=$v['json']['dirver'];
            else
                $arr[$k]['dirver']='';

            if(isset($v['json']['tel']))
                $arr[$k]['tel']=$v['json']['tel'];
            else
                $arr[$k]['tel']='';
            $arr[$k]['lpj_total']=$v['json']['lpj_total'];
            $arr[$k]['gsf_total']=$v['json']['gsf_total'];
            $arr[$k]['total_money']=$v['json']['total_money'];

            if(isset($v['json']['msg']))
                $arr[$k]['msg']=$v['json']['msg'];
            else
                $arr[$k]['msg']='';
        }
        $this->put_csv($arr,$csv_title,"车辆维修信息表");


    }

    /**
     * 加油信息导出
     */
    public function export_car_oil()
    {
        $list=CarOilModel::with(['car','operators'])->order('create_time desc')->select();
        if($this->start_time!=""&&$this->end_time!="")
            $list=CarOilModel::with(['car','operators'])->whereTime('create_time','between',[$this->start_time,$this->end_time])->order('id desc')->select();
        $csv_title = array('序号', '加油时间', '加油车辆', '司机姓名', '司机联系电话', '油价', '本次加油金额', '加油量（升）', '结存金额', '备注');
        $arr=[];

        foreach ($list as $k=>$v){
            $arr[$k]['index']=$k+1;
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['car_num']=$v['car']['car_num'];
            $arr[$k]['drive_name']=$v['car']['drive_name'];
            $arr[$k]['mobile']=$v['car']['mobile'];
            $arr[$k]['price']=$v['price'];
            $arr[$k]['total']=$v['total'];
            $arr[$k]['num']=$v['num'];
            $arr[$k]['syye']=$v['syye'];
            $arr[$k]['massege']=$v['massege'];
        }
        $this->put_csv($arr,$csv_title,"加油信息表");

    }


    /**
     * 销售信息导出
     */
    public function export_sale()
    {
        $list = OilSaleModel::with('operators')->order('create_time desc')->select();
        if ($this->start_time != "" && $this->end_time != "")
            $list = OilSaleModel::with('operators')->whereTime('create_time', 'between', [$this->start_time, $this->end_time])->order('create_time desc')->select();


            $csv_title = array('序号', '销售时间', '客户名称', '数量（升）', '单价', '油价', '合计金额',  '备注');
            $arr = [];

            foreach ($list as $k => $v) {
                $arr[$k]['index'] = $k + 1;
                $arr[$k]['create_time'] = $v['create_time'];
                $arr[$k]['username'] = $v['username'];
                $arr[$k]['num'] = $v['num'];
                $arr[$k]['price'] = $v['price'];
                $arr[$k]['total'] = $v['total'];
                $arr[$k]['massege'] = $v['massege'];
            }
            $this->put_csv($arr, $csv_title,"销售信息表");


    }


    /**
     * 油量入库信息导出
     */
    public function export_oil_appli()
    {
        $list=OilAppliModel::with('operators')->order('create_time desc')->select();
        if($this->start_time != "" && $this->end_time != ""){
            $list=OilAppliModel::with('operators')->whereTime("create_time",'between',[$this->start_time, $this->end_time])->order('create_time desc')->select();
        }

        $csv_title = array('序号', '操作员', '入库时间', '运输车辆', '司机姓名', '联系电话', '入库数量（升）',  '柴油密度','备注');
        $arr = [];

        foreach ($list as $k => $v) {
            $arr[$k]['index'] = $k + 1;
            $arr[$k]['operators'] = $v['operators']['name'];
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['car_num']=$v['car_num'];
            $arr[$k]['car_name']=$v['car_name'];
            $arr[$k]['mobile']=$v['mobile'];
            $arr[$k]['num']=$v['num'];
            $arr[$k]['density']=$v['density'];
            $arr[$k]['massege']=$v['massege'];
        }
        $this->put_csv($arr, $csv_title,"油量入库信息表");


    }

    /**
     * 油量入库信息导出
     */
    public function export_oil()
    {
       $list=Oil::get_oil_data_api($this->start_time,$this->end_time);

        $csv_title = array('序号', '时间', '入库数量（升）', '入库金额（元）', '车辆加油数量（升）', '车辆加油金额（元）', '公司销售数量（升）',  '公司销售金额（元）'
        ,'库存数量（升）','其中车辆结余（升）','其中车辆结存金额  ','备注');
        $arr = [];
        foreach ($list as $k => $v) {
            $arr[$k]['index'] = $k + 1;
            $arr[$k]['create_time']=$v['create_time'];

            if($v['type']=='oil'){
                $arr[$k]['enter_num']=$v['num'];
                $arr[$k]['enter_money']=$v['total'];
            }
            else{
                $arr[$k]['enter_num']='';
                $arr[$k]['enter_money']='';
            }

            if($v['type']=='car_oil'){

                $arr[$k]['car_oil_num']=$v['num'];
                $arr[$k]['car_oil_money']=$v['total'];
            }
            else{
                $arr[$k]['car_oil_num']='';
                $arr[$k]['car_oil_money']='';
            }

            if($v['type']=='sale'){
                $arr[$k]['sale_num']=$v['num'];
                $arr[$k]['sale_money']=$v['total'];
            }
            else{
                $arr[$k]['sale_num']='';
                $arr[$k]['sale_money']='';
            }

            $arr[$k]['stock']='';
            $arr[$k]['cjy']='';
            $arr[$k]['cjy_money']='';
            $arr[$k]['message']=$v['massege'];
        }
        $this->put_csv($arr, $csv_title,"油量入库信息表");


    }


    /**
     * 库存信息导出
     */
    public function export_parts($group='')
    {
        if($group=="")
            $group=TokenService::getCurrentTokenGroup();
        $list=PartsModel::where('department',$group)->order('create_time desc')->select();
        if($this->start_time!=""&&$this->end_time!=""){
            $list=PartsModel::where('department',$group)->whereTime('create_time','between',[$this->start_time,$this->end_time])->order('create_time desc')->select();
        }

        $csv_title = array('序号', '时间', '编号', '物资名称', '数量', '规格', '单价（元）',  '合计金额（元）','备注');
        $arr = [];

        foreach ($list as $k => $v) {
            $arr[$k]['index'] = $k + 1;
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['num']=$v['num'];
            $arr[$k]['name']=$v['name'];
            $arr[$k]['stock']=$v['stock'];
            $arr[$k]['model']=$v['model'];
            $arr[$k]['price']=$v['price'];
            $arr[$k]['total_price']=$v['price']*$v['stock'];
            $arr[$k]['massege']=$v['massege'];
        }
        $this->put_csv($arr, $csv_title,"库存信息表");


    }


    /**
     * 库存出入信息导出
     */
    public function export_parts_record($group='')
    {

        if($group=="")
            $group=TokenService::getCurrentTokenGroup();
        $list=PartsRecordModel::with('operators')->where('department',$group)->order('create_time desc')->select();

        if($this->start_time!=""&&$this->end_time!=""){
            $list=PartsRecordModel::with('operators')->whereTime('create_time','between',[$this->start_time,$this->end_time])->where('department',$group)->order('create_time desc')->select();
        }
        $csv_title = array('序号',  '出/入库时间', '物资名称', '数量', '规格', '单价（元）',  '合计金额（元）','出/入库人','领用车辆','领用人','备注');
        $arr = [];

        foreach ($list as $k => $v) {
            $arr[$k]['index'] = $k + 1;
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['name']=$v['name'];
            $arr[$k]['num']=$v['num'];
            $arr[$k]['stock']=$v['stock'];
            $arr[$k]['model']=$v['model'];
            $arr[$k]['price']=$v['price'];
            $arr[$k]['total_price']=$v['price']*$v['num'];
            $arr[$k]['use_car']=$v['use_car'];
            $arr[$k]['user']=$v['user'];
            $arr[$k]['msg']=$v['msg'];
        }
        $this->put_csv($arr, $csv_title,"库存出入信息表");
    }

    /**
     * 库存信息导出
     */
    public function export_cw()
    {

        $list=CwModel::order('create_time desc')->select();
        $csv_title = array('序号',  '时间', '今日装车数', '装运总吨位', '运费合计', '收取信息费用合计',  '车辆加油量','车辆加油金额合计','公司销售油合计','油库存量','油库金额','修理费合计'
        ,'工时费合计');
        $arr = [];

        foreach ($list as $k => $v) {
            $arr[$k]['index'] = $k + 1;
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['car_num']=$v['car_num'];
            $arr[$k]['weight']=$v['weight'];
            $arr[$k]['yun_fee']=$v['yun_fee'];
            $arr[$k]['xx_fee']=$v['xx_fee'];
            $arr[$k]['oil']=$v['oil'];
            $arr[$k]['oil_fee']=$v['oil_fee'];
            $arr[$k]['sale_oil']=$v['sale_oil'];
            $arr[$k]['oil_stock']=$v['oil_stock'];
            $arr[$k]['oil_stock_fee']=$v['oil_stock_fee'];
            $arr[$k]['repair_fee']=$v['repair_fee'];
            $arr[$k]['gs_fee']=$v['gs_fee'];

        }
        $this->put_csv($arr, $csv_title);
    }


    /**
     * 运费统计信息导出
     */
    public function export_count()
    {


        $list=PlanModel::with(['recorduser','dduser','billuser','payuser'])->where('status',3)->order('create_time desc')->select();
        if($this->start_time!=""&&$this->end_time!=""){
            $list=PlanModel::with(['recorduser','dduser','billuser','payuser'])->whereTime('create_time','between',[$this->start_time,$this->end_time])->where('status',3)->select();
        }
        $csv_title=array('序号','计划员','调度员','运单开具时间','运单号','起始地','目的地','承运车辆','司机姓名','司机联系电话',
            '发货人','发货人电话','收货人','收货人电话','收货人地址','货物名称','件数','重量（吨）','信息费','油卡金额','加油金额','单价','运费合计','备注','油卡卡号'
        ,'开户行','开户行账号','打款时间','打款人','打款状态');
        $arr = [];
        foreach ($list as $k=>$v){
            $arr[$k]['index']=$k+1;
            $arr[$k]['recorduser']=$v['recorduser']['name'];
            $arr[$k]['dduser']=$v['dduser']['name'];
            $arr[$k]['json_create_time']=$v['json']['create_time'];
            $arr[$k]['order_num']=$v['order_num'];
            $arr[$k]['start']=$v['start'];
            $arr[$k]['end']=$v['end'];
            if(isset($v['dd_json']['car_info'])){
                $arr[$k]['car_num']=$v['dd_json']['car_info']['car_num'];
                $arr[$k]['drive_name']=$v['dd_json']['car_info']['drive_name'];
                $arr[$k]['drive_mobile']=$v['dd_json']['car_info']['mobile'];
            }else{
                $arr[$k]['car_num']='';
                $arr[$k]['drive_name']='';
                $arr[$k]['drive_mobile']='';
            }
            $arr[$k]['send_name']=$v['json']['send_name'];
            if(isset($v['json']['send_tel']))
                $arr[$k]['send_tel']=$v['json']['send_tel'];
            else
                $arr[$k]['send_tel']='';
            $arr[$k]['received_name']=$v['json']['received_name'];
            $arr[$k]['received_tel']=$v['json']['received_tel'];
            $arr[$k]['received_address']=$v['json']['received_address'];
            $arr[$k]['goods_name']=$v['json']['goods'][0]['name'];
            $arr[$k]['goods_num']=$v['json']['goods'][0]['num'];
            $arr[$k]['goods_weight']=$v['json']['goods'][0]['weight'];
            if(isset($v['dd_json']['msg_money']))
                $arr[$k]['msg_money']=$v['dd_json']['msg_money'];
            else
                $arr[$k]['msg_money']=0;
            if(isset($v['dd_json']['yk_money']))
                $arr[$k]['yk_money']=$v['dd_json']['yk_money'];
            else
                $arr[$k]['yk_money']=0;
            if(isset($v['dd_json']['jy_money']))
                $arr[$k]['jy_money']=$v['dd_json']['jy_money'];
            else
                $arr[$k]['jy_money']=0;
            $arr[$k]['unit_price']=$v['json']['goods'][0]['unit_price'];
            $arr[$k]['total_price']=$v['total_price'];
            $arr[$k]['massege']=$v['massege'];
            if(isset($v['dd_json']['car_info'])){
                $arr[$k]['oil_card']=$v['dd_json']['car_info']['oil_card'];
                $arr[$k]['bank_name']=$v['dd_json']['car_info']['bank_name'];
                $arr[$k]['bank_num']=$v['dd_json']['car_info']['bank_num'];
            }else{
                $arr[$k]['oil_card']='';
                $arr[$k]['bank_name']='';
                $arr[$k]['bank_num']='';
            }
            $arr[$k]['pay_time']=$v['pay_time'];
            $arr[$k]['dk_user']=$v['payuser']['name'];
            if($v['is_pay']==0)
                $arr[$k]['is_pay']="待打款";
            else
                $arr[$k]['is_pay']="已打款";
        }

        $this->put_csv($arr, $csv_title,"运费统计信息表");
    }






    /**
         * 导出csv文件
         * @param $list
         * @param $title
         */
        public
        function put_csv($list, $title,$name="车辆信息表")
        {
            //$file_name = "CSV" . date("mdHis", time()) . ".csv";
            $file_name=$name.date("Ymd").".csv";
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename=' . $file_name);
            header('Cache-Control: max-age=0');
            $file = fopen('php://output', "a");

            $limit = 1000;
            $calc = 0;

            foreach ($title as $v) {

                $tit[] = iconv('UTF-8', 'GB2312//IGNORE', $v);
            }

            fputcsv($file, $tit);
            foreach ($list as $v) {
                $calc++;
                if ($limit == $calc) {
                    ob_flush();
                    flush();
                    $calc = 0;
                }
                foreach ($v as $t) {
                    $tarr[] = iconv('UTF-8', 'GB2312//IGNORE', $t);
                }
                fputcsv($file, $tarr);
                unset($tarr);
            }
            unset($list);
            fclose($file);
            exit();
        }
}