<?php
namespace app\admin\validate;

use think\Validate;

class Debris extends Validate
{
    protected $rule = [
        'title|碎片标题' => [
            'require' => 'require',
            'max'     => '255',
        ],
        'name|调用名称' => [
            'require' => 'require',
            'max'     => '255',
            'unique'  => 'debris',
        ],
        'sort|排序' => [
            'require' => 'require',
            'number'  => 'number',
        ],
    ];
}