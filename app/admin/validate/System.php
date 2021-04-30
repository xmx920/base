<?php
namespace app\admin\validate;

use think\Validate;

class System extends Validate
{
    protected $rule = [
        'group_id|所属分组' => [
            'require' => 'require',
        ],
        'type|字段类型' => [
            'require' => 'require',
        ],
        'field|字段名' => [
            'require' => 'require',
            'max'     => '255',
            'unique'  => 'system',
        ],
        'name|别名' => [
            'require' => 'require',
            'max'     => '255',
            'unique'  => 'system',
        ],
        'sort|排序' => [
            'require' => 'require',
            'number'  => 'number',
        ],
    ];
}