<?php
// 事件定义文件
//'app\\behavior\\CORS'
return [

    'listen' => [
        'AppInit' => ['app\\behavior\\CORS'],
        'HttpRun' => [],
        'HttpEnd' => [],
        'LogLevel' => [],
        'LogWrite' => [],
    ],
];
