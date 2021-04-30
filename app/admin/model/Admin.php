<?php
namespace app\admin\model;

use app\common\model\System;
use think\facade\Db;
use think\facade\Event;
use think\facade\Request;
use think\facade\Session;

class Admin extends Base
{

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    /**
     * 管理员登录校验
     * @return array|\think\response\Json
     * @throws \think\Exception
     */
    public static function checkLogin()
    {
        //查找所有系统设置表数据
        $system = System::getListField()->toArray();
        //格式化设置字段
        $system = sysgem_setup($system);
        $systemArr = [];
        foreach ($system as $k => $v) {
            $systemArr[$v['field']] = $v['value'];
        }
        $system = $systemArr;

        $username = Request::param("username");
        $password = Request::param("password");
        $open_code = $system['code'];
        if ($open_code) {
            $code = Request::param("vercode");
            if (!captcha_check($code)) {
                $data = ['error' => '1', 'msg' => '验证码错误'];
                return json($data);
            }
        }
        $result = self::where(['username' => $username, 'password' => md5($password)])->find();
        if (empty($result)) {
            $data = ['error' => '1', 'msg' => '帐号或密码错误'];
            return json($data);
        } else {
            $check = Request::checkToken('__token__');
            if (false === $check) {
                $data = ['error' => '1', 'msg' => '验证有误'];
                return json($data);
            }
            if ($result['status'] == 1) {
                $uid = $result['id'];
                //更新登录IP和登录时间
                self::where('id', '=', $result['id'])
                    ->update(['logintime' => time(), 'loginip' => Request::ip()]);

                //查找规则
                $rules = Db::name('auth_group_access')
                    ->alias('a')
                    ->leftJoin('auth_group ag', 'a.group_id = ag.id')
                    ->field('a.group_id,ag.rules,ag.title')
                    ->where('uid', $uid)
                    ->find();

                //查询所有不验证的方法并放入规则中
                $authOpen = AuthRule::where('auth_open', '=', '0')
                    ->select();
                $authRole = AuthRule::select();
                $authOpens = [];
                foreach ($authOpen as $k => $v) {
                    $authOpens[] = $v['id'];
                    //查询所有下级权限
                    $ids = getChildsRule($authRole, $v['id']);
                    foreach ($ids as $kk => $vv) {
                        $authOpens[] = $vv['id'];
                    }
                }

                $authOpensStr = !empty($authOpens) ? implode(",", $authOpens) : '';
                $rules['rules'] = $rules['rules'] . $authOpensStr;

                //重新查询要赋值的数据[原因是toArray必须保证find的数据不为空，为空就报错]
                $result = self::where(['username' => $username, 'password' => md5($password)])->find();
                Session::set('admin', [
                    'id'        => $result['id'],
                    'username'  => $result['username'],
                    'logintime' => date('Y-m-d H:i:s', $result['logintime']),
                    'loginip'   => $result['loginip'],
                    'nickname'  => $result['nickname'],
                    'image'     => $result['image'],
                ]);
                Session::set('admin.group_id' , $rules['group_id']);
                Session::set('admin.rules'    , explode(',', $rules['rules']));
                Session::set('admin.title'    , $rules['title']);

                //触发登录成功事件
                Event::trigger('AdminLogin', $result);

                $data = ['error' => '0', 'href' => url('Index/index')->__toString(), 'msg' => '登录成功'];
                return json($data);
            } else {
                return json(['error' => 1, 'msg' => '用户已被禁用!']);
            }

        }
    }
}