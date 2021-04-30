<?php
namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        'username|用户名' => [
            'require' => 'require',
            'min'     => '4',
            'max'     => '25',
            'unique'  => 'admin',
        ],
        'password|密码' => [
            'min'     => '6',
            'max'     => '25',
        ],
        'nickname|昵称' => [
            'require' => 'require',
            'max'     => '100',
            'unique'  => 'admin',
        ],
    ];



}