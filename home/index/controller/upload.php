<?php
namespace app\index\controller;

use think\Controller;
use think\org\Upload;
class Upload extends Common
{	
	
	// 编辑商品页面
	
	//添加商品函数
	public function goods_add(){
		$goods = db('goods');
		$file = getfile();
		$goods->data([
            'goodsname' => $_POST['goodsname'],
			'goodtype' => $_POST['goodtype'],
			'categoryid' => $_POST['categoryid'],
			'brief' => $_POST['brief'],
			'unitprice' => $_POST['unitprice'],
			'quantity' => $_POST['quantity'],
			'freight' => $_POST['freight'],
			'file' => $_POST['file'],
			'filepath' => implode(',', $_POST['imagepath']),
		]);
    
    // 移动到框架应用根目录/public/uploads/ 目录下
		$result = $goods->save();
		// $result = $db->insert($data);
		if($result){
			$this->success('商品添加成功！', 'product_list');
		} else{
			$this->error('商品添加失败！');
		}
	}

	// 商品分类页
	public function uploadfile(){
		 // 获取表单上传文件
		 $files = request()->file();
		 foreach($files as $file){
			 // 移动到框架应用根目录/public/uploads/ 目录下
			 $info = $file->rule('date')->move(ROOT_PATH . 'public' . DS . 'uploads');
			 $keyName = $file -> getInfo()['name'];
			 if($info){
				 $db=db('goods_files');
				 $filename =  DS . 'uploads'.'/'.$info->getSaveName();
				 $filename =str_replace('\\', '/', $filename);
				 //$data['id']=$keyName;
				 $data['filepath']=$filename;
				 $res=$db->insert($data);
				 $id = db('goods_files')->getLastInsID();
				 $filedata=['id'=>$id,'paths'=>$data['filepath']];

				 echo json_encode($filedata);

			 }else{
				 // 上传失败获取错误信息
				 echo $file->getError();
			 }
		 }
	}
	//商品图片删除
	public function product_del_images(){
		$db=db('goods_files');
		$id= $_GET['id'];
		$result=$db->delete($id);
		
        if($result){
            echo 1;
        }else{
            echo 0;
        }
    }
    
}