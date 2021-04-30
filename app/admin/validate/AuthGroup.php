<?php
namespace app\admin\validate;

use think\Validate;

class AuthGroup extends Validate
{
    protected $rule = [
        'title|用户组名' => [
            'require' => 'require',
            'max'     => '100',
            'unique'  => 'auth_group',
        ]
    ];
}