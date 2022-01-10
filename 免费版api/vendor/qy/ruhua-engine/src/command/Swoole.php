<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/7 0007
 * Time: 13:44
 */

namespace ruhua\command;


use app\controller\swoole\Socket;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\facade\Config;
use think\facade\Console;
use think\facade\Db;
use think\facade\Env;
use think\facade\Log;



class Swoole extends Command
{
    protected function configure()
    {
        // 指令配置
        $this->setName('swoole')
            ->setDescription('swoole run');
    }

    protected function execute(Input $input, Output $output)
    {
        (new Socket())->start();
    }


}