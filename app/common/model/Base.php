<?php
namespace app\common\model;
use think\Model;

class Base extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 通用修改数据
    public static function edit($id){
        $info = self::find($id);
        return $info;
    }

    // 通用修改保存
    public static function editPost($data)
    {
        $result = self::where('id',$data['id'])
            ->update($data);
        if ($result) {
            return ['error' => 0, 'msg' => '修改成功'];
        } else {
            return ['error' => 1, 'msg' => '修改失败'];
        }
    }

    // 通用添加保存
    public static function addPost($data){
        $result = self::create($data);
        if ($result) {
            return ['error' => 0, 'msg' => '添加成功'];
        } else {
            return ['error' => 1, 'msg' => '添加失败'];
        }
    }

    // 删除
    public static function del($id){
        self::destroy($id);
        return json(['error'=>0,'msg'=>'删除成功!']);
    }

    // 批量删除
    public static function selectDel($id){
        if ($id) {
            $ids = explode(',',$id);
            self::destroy($ids);
            return json(['error'=>0, 'msg'=>'删除成功!']);
        }else{
            return ['error' => 1, 'msg' => '删除失败'];
        }
    }

    // 排序修改
    public static function sort($data){
        $info = self::find($data['id']);
        $info -> sort = $data['sort'];
        $info -> save();
        return json(['error'=>0, 'msg'=>'修改成功!']);
    }

    // 状态修改
    public static function state($id){
        $info = self::find($id);
        $info-> status = $info['status'] == 1 ? 0 : 1;
        $info -> save();
        return json(['error'=>0, 'msg'=>'修改成功!']);
    }


}