<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

Route::get('', function () {
    echo '永顺物流'.VAE_VERSION.'(开发板)';
});

/**
 * 权限登录
 */
Route::group('login', function () {
    Route::post('admin_login', 'admin.Admin/login');//管理员登录(已使用)
});


/**
 * 管理员(正在开发)
 */
Route::group('/admin', function () {
    Route::post('update_password', 'admin.Admin/update_password');//修改密码

    Route::group('', function () {
    //权限(已完成)
    Route::group('/auth', function () {
        Route::group('group', function () {
            Route::get('get_group', 'admin.Auth/get_group');//获取所有权限分组
            Route::post('add_group', 'admin.Auth/add_group');//添加权限分组
            Route::post('update_group', 'admin.Auth/update_group');//更新权限分组
            Route::delete('del_group', 'admin.Auth/del_group');//删除权限分组
        });
        Route::group('rule', function () {
          //  Route::get('get_rule', 'admin.Auth/get_group_rule');//获取所有权限
            Route::post('add_rule', 'admin.Auth/add_group_rule');//添加权限
            Route::post('update_rule', 'admin.Auth/update_group_rule');//更新权限
            Route::delete('del_rule', 'admin.Auth/del_group_rule');//删除权限
            Route::post('add_enter_rule', 'admin.Auth/add_enter_rule');//绑定规则给
            Route::delete('cancel_enter_rule', 'admin.Auth/cancel_enter_rule');//取消绑定规则给分组

            Route::get('get_rule', 'admin.Auth/get_rule');//获取所有规则
        });
        Route::group('nav', function () {
            Route::get('get_nav', 'admin.Nav/get');//获取所有权限分组
            Route::post('add_nav', 'admin.Nav/add_nav');//添加权限分组
            Route::post('update_nav', 'admin.Nav/update_nav');//更新权限分组
            Route::delete('del_nav', 'admin.Nav/delete');//删除权限分组
            Route::post('add_nav_group', 'admin.Nav/add_nav_group');//配置分组权限
            Route::delete('del_nav_group', 'admin.Nav/del_nav_group');//取消菜单权限
        });
    });
    //车辆管理(已完成)
    Route::group('car', function () {
        Route::post('add_car', 'admin.Car/add_car');//添加车辆
        Route::delete('del_car', 'admin.Car/del_car');//删除车辆
        Route::post('update_car', 'admin.Car/update_car');//更新车辆信息
        Route::get('get_all_car', 'admin.Car/get_all_car');//查看所有车辆信息
        Route::post('add_car_fee_appli', 'admin.Car/add_car_fee_appli');//车辆费用申报
        Route::put('bind_equip', 'admin.Car/bind_equip');//绑定设备
        Route::get('get_all_plan', 'admin.Plan/get_all');//运输记录
        Route::delete('cancel_equip', 'admin.Car/cancel_equip');//解除设备绑定
        Route::get('get_car_position', 'admin.Car/get_car_position');//运输记录
       // Route::post('upddate_position', 'admin.Car/upddate_position');//更新车辆经纬度

    });


    /**
     * 购置计划
     */
    Route::group('plan', function () {
        Route::post('add_plan', 'admin.Plan/add_plan');//添加订单
        Route::delete('del_plan', 'admin.Plan/del');//删除订单
       Route::post('dd_car', 'admin.Plan/dd_car');//车辆调度(备用)
        Route::post('dd_car_one', 'admin.Plan/dd_car_one');//车辆调度单
        Route::post('add_bill', 'admin.Plan/add_bill');//运单开单
        Route::get('get_plan', 'admin.Plan/get_plan');//获取订单信息
        Route::post('update_plan', 'admin.Plan/update_plan');//修改计划
        Route::post('update_wait_car', 'admin.Plan/update_wait_car');//修改待装运车辆信息
        Route::get('get_plan_finish', 'admin.Plan/get_plan_finish');//运单管理

        Route::put('update_plan_car', 'admin.Plan/update_plan_car');//修改订单车辆

        Route::put('pay_plan', 'admin.Plan/pay_plan');//打款
    });


    /**
     * 车辆维修
     */
    Route::group('car_repaire', function () {
        Route::post('add_repaire', 'admin.CarRepaire/add');//添加维修单据
        Route::post('update_repaire', 'admin.CarRepaire/update');//更新维修单据
        Route::get('get_repaire', 'admin.CarRepaire/get');//获取维修单据
        Route::delete('del_repaire', 'admin.CarRepaire/del');//删除维修单据
    });


    /**
     * 油库管理（正在开发中）
     */
    Route::group('oil', function () {
        Route::post('add_oil', 'admin.Oil/add_oil_appli');//出入油库添加
        Route::delete('del_oil', 'admin.Oil/del_oil_appli');//出入油库删除
        Route::post('update_oil', 'admin.Oil/update_oil_appli');//出入油库修改


        Route::get('get_oil', 'admin.Oil/get_oil_data');//获取油库信息
        Route::post('add_car_oil', 'admin.Oil/add_car_oil');//车辆加油
        Route::get('get_car_oil', 'admin.Oil/get_car_oil');//获取加油信息
        Route::post('update_car_oil', 'admin.Oil/update_car_oil');//更新加油信息
        Route::delete('del_car_oil', 'admin.Oil/del_car_oil');//删除加油信息


        Route::post('add_sale', 'admin.Oil/add_sale');//添加销售
        Route::get('get_sale', 'admin.Oil/get_sale');//获取销售
        Route::post('update_sale', 'admin.Oil/update_sale');//更新销量信息
        Route::delete('del_sale', 'admin.Oil/del_sale');//删除销量信息
        Route::get('get_oil_appli', 'admin.Oil/get_oil_appli');//获取入库信息
    });

    /**
     * 库存管理
     */
    Route::group('parts', function () {
        Route::post('add_type', 'admin.Parts/add_type');//添加零配件类型
        Route::post('enter_parts', 'admin.Parts/enter_parts');//零配件入库
        Route::post('out_parts', 'admin.Parts/out_parts');//零配件出库
        Route::delete('del_parts', 'admin.Parts/del_parts');//删除物品
        Route::delete('del_parts_record', 'admin.Parts/del_parts_record');//删除出入库记录
        Route::get('get_parts', 'admin.Parts/get_parts');//获取所有零配件
        Route::get('get_parts_record', 'admin.Parts/get_parts_record');//获取所有出入库记录
        Route::post('update_parts', 'admin.Parts/update_parts');//修改物资(待加入规则)
    });

    /**
     * 用户管理
     */
    Route::group('user', function () {
        Route::post('add_user', 'admin.User/add_user');//添加工作人员
        Route::post('update_user', 'admin.User/update_user');//更新工作人员
        Route::delete('del_user', 'admin.User/del_user');//删除工作人员
        Route::get('get_user', 'admin.User/get_user');//删除工作人员
    });

    /**
     * 设备管理
     */
    Route::group('equip', function () {
        Route::post('add_equip', 'admin.Equip/add');//添加设备
        Route::put('bind_car', 'admin.Equip/bind_car');//绑定车辆
        Route::delete('del_equip', 'admin.Equip/del_equip');//删除设备
        Route::delete('cancel_bind', 'admin.Equip/cancel_bind');//解除绑定
        Route::put('update_equip', 'admin.Equip/update_equip');//修改绑定
        Route::get('get_type', 'admin.Equip/get_type');//获取所有设备
        Route::put('up_equip', 'admin.Equip/update_eq');//修改设备数据

    });



        /**
         * 财务
         */
        Route::group('cw', function () {
            Route::get('get_cw', 'common.Task/get');//获取财务信息
            Route::delete('del_cw', 'common.Task/del_cw');//删除财务信息
        });

    /**
     * 通知
     */
    Route::group('notice', function () {
        Route::post('add_notice', 'admin.Notice/add');//添加通知
        Route::post('update_notice', 'admin.Notice/update');//更新通知
        Route::get('get_notice', 'admin.Notice/get');//获取所有通知
        Route::delete('del_notice', 'admin.Notice/del');//删除通知

    });

    //文章、公告Article
    Route::group('article', function () {
            Route::get('get_all_article', 'admin.ArticleManage/adminGetAllArticle');//获取所有的文章
            Route::get('all_article_name', 'admin.ArticleManage/allArticleName');//获取所有的文章
            Route::post('add_article', 'admin.ArticleManage/addArticle');//添加文章
            Route::post('edit_article', 'admin.ArticleManage/editArticle');//修改文章
            Route::put('del_article', 'admin.ArticleManage/deleteArticle');//删除文章
    });

    //文章、公告Article
    Route::group('banner', function () {
        Route::post('add_banner', 'admin.Banner/add');//添加广告
        Route::post('update_banner', 'admin.Banner/update');//修改广告
     //   Route::get('get_all', 'admin.Banner/get');//查看广告
        Route::delete('del_banner', 'admin.Banner/del');//删除广告
    });

});

    Route::group('map', function () {
        Route::get('get_trace', 'map.Trace/get_trace');//查看轨迹
    });


   // });
    })->middleware('CheckCms');



//文章、公告Article
Route::group('admin/banner', function () {
    Route::get('get_all', 'admin.Banner/get');//查看广告
});


//公用接口(正在开发)
Route::group('admin/common', function () {
    Route::get('get_order_by_num', 'user.Order/get_order_by_num');//订单编号查询物流
    Route::post('upload_img', 'common.Common/upload_img');//上传图片
    Route::post('user_sign', 'common.Plan/user_sign');//订单签收
    Route::any('ue_uploads', 'admin.Common/ue_uploads');
    Route::get('get_notice', 'admin.Notice/get');//获取所有通知
    Route::get('task', 'common.Task/update_cw');//日更新
    Route::get('get_admin_auth', 'admin.Admin/get_admin_auth');//获取用户权限
    //公共
    Route::group('article', function () {
        Route::get('get_all_article', 'common.Article/getAllArticle');//获取所有的文章//暂停
        Route::get('get_one_article', 'common.Article/getOneArticle');//获取文章详情
        Route::get('user_article', 'common.Article/userArticle');//用户获取文章
        Route::get('type_article', 'common.Article/getTypeArticle');//用户获取某个类型的文章
    });

});

Route::group('map', function () {
    Route::post('upload_point', 'map.Trace/upload_point');//轨迹上传
    Route::get('get_trace', 'map.Trace/get_trace');//查看轨迹
});

Route::group('excel', function () {
    Route::get('plan_export', 'common.Excel/export_plan');//导出计划任务
    Route::get('export_car', 'common.Excel/export_car');//导出车辆信息
    Route::get('export_equip', 'common.Excel/export_equip');//导出设备信息
    Route::get('export_car_repair', 'common.Excel/export_car_repair');//导出车辆维修信息
    Route::get('export_car_oil', 'common.Excel/export_car_oil');//导出加油信息
    Route::get('export_sale', 'common.Excel/export_sale');//导出销售信息
    Route::get('export_oil_appli', 'common.Excel/export_oil_appli');//导出油量入库信息
    Route::get('export_oil', 'common.Excel/export_oil');//导出油量库存信息
    Route::get('export_parts', 'common.Excel/export_parts');//导出库存信息
    Route::get('export_parts_record', 'common.Excel/export_parts_record');//导出出入库记录信息
    Route::get('export_cw', 'common.Excel/export_cw');//导出财务信息
    Route::get('export_count', 'common.Excel/export_count');//导出财务信息
});





/*//猎鹰接口
Route::group('map', function () {

    //服务管理
    Route::group('service', function () {
        Route::post('create_Service', 'map.Service/create_Service');//创建服务
        Route::delete('del_Service', 'map.Service/del_Service');//删除服务
        Route::put('update_Service', 'map.Service/update_Service');//更新服务
        Route::get('get_Service', 'map.Service/get_Service_api');//查看服务
    });


    //终端管理
    Route::group('terminal', function () {
        Route::post('create_terminal', 'map.Terminal/create_terminal');//创建终端
        Route::delete('delete_terminal', 'map.Terminal/delete_terminal');//删除终端
        Route::put('update_terminal', 'map.Terminal/update_terminal');//更新终端
        Route::get('get_terminal', 'map.Terminal/get_terminal');//查看终端
        Route::post('search_terminal', 'map.Terminal/search_terminal');//终端搜索
        Route::post('round_search_terminal', 'map.Terminal/round_search_terminal');//周围终端搜索
    });

    //终端管理
    Route::group('trace', function () {
        Route::get('get_trace', 'map.Trace/get_trace');//查看轨迹
        Route::get('upload_point', 'map.Trace/upload_point');//添加轨迹
    });
});*/





























































Route::group('admin', function () {


Route::put('bind_mobile', 'admin.Admin/bind_mobile');//绑定接收短信通知的电话号码
Route::post('mobile_login', 'admin.Admin/mobile_login');//手机验证登录
Route::post('update_infor', 'admin.Admin/update_infor');//修改个人信息
Route::get('get_infor', 'admin.Admin/get_infor');//查看个人信息





Route::group('statistics', function () {
    Route::get('get_parts_static', 'admin.Statistics/parts_stock');//库存统计
    Route::get('index_data', 'admin.Statistics/index_data');//首页数据统计

});



//部门管理员
Route::group('worker', function () {
    Route::post('add_work', 'admin.Worker/add_work');//部门管理员添加
    Route::post('update_work', 'admin.Worker/update_work');//更新部门管理员
    Route::get('get_worker', 'admin.Worker/get_worker');//查看部门管理员
    Route::delete('del_worker', 'admin.Worker/del_worker');//查看部门管理员
});




Route::group('fleet', function () {
    Route::post('add_fleet', 'admin.Fleet/add');//增加车队
    Route::put('update_fleet', 'admin.Fleet/update');//分销车队信息
    Route::get('get_fleet', 'admin.Fleet/get');//获取车队信息
    Route::delete('del_fleet', 'admin.Fleet/del');//删除车队信息
    Route::put('add_fleet_user', 'admin.Fleet/add_user');//添加车队成员
    Route::put('del_fleet_user', 'admin.Fleet/del_user');//删除车队成员
    Route::get('get_driver_fid', 'admin.Fleet/get_driver_fid');//id获取车队成员
});

Route::group('trial', function () {
    Route::put('car_fee', 'admin.Trial/car_fee');//车辆费用审核
    Route::put('OilAppli', 'admin.Trial/OilAppli');//油购审批
    Route::put('plan_trial', 'admin.Trial/plan_trial');//运单财务打款审核
});




Route::group('parts', function () {
    Route::post('add_type', 'admin.Parts/add_type');//添加零配件类型
    Route::post('add_parts_appli', 'admin.Parts/appli');//添加零配件申购
    Route::get('get_parts', 'admin.Parts/get_parts');//查看所有零配件信息
    Route::get('get_appli', 'admin.Parts/get_appli');//查看所有零配件申购信息
});


Route::group('park', function () {
    Route::post('add_park', 'admin.Park/add_park');//添加停车场所
    Route::post('update_park', 'admin.Park/update_park');//更新停车场所
    Route::delete('del_park', 'admin.Park/del_park');//删除停车场所
    Route::get('get_park', 'admin.Park/get_park');//获取全部停车场所
    Route::get('get_park_id', 'admin.Park/get_park_id');//id获取停车场所
});


});






























/**
 * 公用
 */
Route::group('common', function () {
    Route::post('get_mobile_code', 'common.Common/sendCodeMsg');//获取手机验证码

    Route::post('user_login', 'common.Common/user_login');//用户登录


    Route::group('lineup', function () {
        Route::get('get_lineup', 'common.LineUp/get_line');//获取排队信息
        Route::get('up_qrcode', 'common.LineUp/up_qrcode');//实时更新二维码
    });

});



/**
 * 工作人员
 */
Route::group('worker', function () {
    Route::get('get_infor', 'worker.Worker/get_infor');//管理员登录

    //调度员
    Route::group('ddworker', function () {
        Route::get('get_no_plan', 'worker.DdWorker/get_no_plan');//获取等待分配的
        Route::get('get_fleet', 'admin.Fleet/get');//获取车队信息
        Route::get('get_driver_fid', 'admin.Fleet/get_driver_fid');//id获取车队成员
        Route::post('car_dd', 'worker.DdWorker/add');//调度员调度车辆
        Route::get('get_driver', 'admin.User/get_driver');//获取司机信息
    });

    //快递单员
    Route::group('kdworker', function () {
        Route::post('add_trans', 'worker.KdWorker/add_trans');//添加物流
        Route::put('add_peisong', 'worker.KdWorker/add_peisong');//物流配送
    });

    //会计员
    Route::group('kjworker', function () {

    });

    //油站管理员
    Route::group('yzworker', function () {
        Route::post('add_car_oil', 'admin.Oil/add_car_oil');//车辆加油信息添加

    });

});




/**
 * 服务
 */
Route::group('server', function () {
    Route::get('swoole', 'swoole.Socket/start');//swoole开启
    Route::post('update_position', 'drive.Car/upload_positon');//更新位置坐标
    Route::post('upload_ly', 'map.Start/connect');//上传行车坐标
});




/*//司机管理
Route::group('driver', function () {

    Route::get('get_infor', 'drive.Drive/get_infor');//司机获取个人信息
    Route::get('get_oil_record', 'drive.Oil/get_oil_record');//司机获取加油记录
    Route::post('update_infor', 'drive.Drive/update_infor');//司机修改个人信息
    //车辆管理
    Route::group('car', function () {
        Route::post('add_car_fee_appli', 'drive.Car/add_car_fee_appli');//车辆费用申报
        Route::get('get_all_car', 'drive.Car/get_all_car');//司机获取自己的车辆
        Route::get('get_user_car_fee', 'drive.Car/get_user_car_fee');//司机查看自己车辆申报
        Route::get('trans_car', 'drive.Car/trans');//车辆运行判定
    });

    Route::group('lineup', function () {
        Route::post('add_line', 'drive.CarLine/add');//司机加入队列
        Route::delete('cancel_line', 'drive.CarLine/cancel_line');//司机取消排队
    });

    Route::group('order', function () {
        Route::get('get_trans_plan', 'drive.Drive/get_trans_plan');//司机查看自己接的订单
        Route::post('user_sign', 'drive.Order/user_sign');//订单签收
    });

    Route::group('qrcode', function () {
        Route::post('add_qrocde', 'drive.Park/qrcode');//司机扫码
    });
});*/

//用户功能
Route::group('user', function () {
    Route::post('login', 'user.User/login');//用户手机登录
    Route::group('order', function () {

        Route::get('get_order', 'user.Order/get_order');//用户查看订单状况
        Route::get('get_order_by_num', 'user.Order/get_order_by_num');//订单编号查询物流
    });
});




















