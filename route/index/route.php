<?php
/**
 * | 前台路由
 */
use think\facade\Route;

// 默认栏目路由
$cate = \think\facade\Db::name('cate')
    ->alias('a')
    ->leftJoin('module m', 'a.moduleid = m.id')
    ->field('a.id, a.catname, a.catdir, m.title as modulename, m.name as moduleurl')
    ->order('a.sort ASC, a.id ASC')
    ->select();
foreach ($cate as $k => $v) {
    // 当栏目设置了[栏目目录]字段时注册路由
    if ($v['catdir']) {
        if ($v['moduleurl'] == 'page') {
            // 单页模型
            Route::any('' . $v['catdir'] . '', '' . $v['catdir'] . '/index');
        } else {
            // 列表+详情模型
            Route::any('' . $v['catdir'] . '/<id>', $v['catdir'] . '/info');
            Route::any('' . $v['catdir'] . '', $v['catdir'] . '/index');
        }
    }
}
// tag路由
Route::any('tag_<module>/<t>', 'Index/tag');