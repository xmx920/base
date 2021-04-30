<?php
namespace app\admin\validate;

use think\Validate;

class SystemGroup extends Validate
{
    protected $rule = [
        'name|分组名称' => [
            'require' => 'require',
            'max'     => '255',
            'unique'  => 'system_group',
        ],
        'sort|排序' => [
            'require' => 'require',
            'number'  => 'number',
        ],
    ];
}