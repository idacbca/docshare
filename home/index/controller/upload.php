<?php
namespace app\index\controller;

use think\Controller;
use think\org\Upload;
class upload extends Common
{	
	// //商品管理页
	// public function product_list(){
	// 	// $start_time = '';
	// 	// $end_time = '';
	// 	if($_POST){//输入查询信息时
	// 		$search = $_POST['search'];
	// 		$word=$search;
	// 		$goods = model('goods');
	// 		$data = $goods->where('goodsname','like','%'.$search.'%')->select();
	// 		$count = count($data);
	// 		$this->assign([
	// 			'data' => $data,
	// 			'count' => $count,
	// 			'word' => $word
	// 		]);
	// 		return $this->fetch();
	// 	} else{//没有输入查询信息时
	// 		$goods = model('goods');
	// 		$data = $goods->select();
	// 		$count = count($data);
	// 		$this->assign([
	// 			'data' => $data,
	// 			'count' => $count
	// 		]);
	// 		return $this->fetch();
	// 	}
	// }

	// // 删除商品ajax
	// public function product_del_ajax(){
	// 	$id = $_POST['id'];
	// 	$db = db('goods');
		
	// 	$path= $db->where('id',$id)->column('filepath');
	// 	$images=explode(',',$path);
	// 	$file= db('goods_files');
	// 	foreach($images as $v){
    //        $file->where('id'.$v)->delete();
    //     }
		
	// 	$re = $db->where('id', $id)->delete();
	// 	if($re){
	// 		echo 1;
	// 	}else echo 0;
	// }

	// // 商品上架ajax
	// public function product_start_ajax(){
	// 	$id = $_POST['id'];
	// 	$db = db('goods');
	// 	$re = $db->where('id', $id)->update(['status' => '0']);
	// 	if($re){
	// 		echo 1;
	// 	}else echo 0;
	// }

	// // 商品下架ajax
	// public function product_stop_ajax(){
	// 	$id = $_POST['id'];
	// 	$db = db('goods');
	// 	$re = $db->where('id', $id)->update(['status' => '1']);
	// 	if($re){
	// 		echo 1;
	// 	}else echo 0;
	// }

	// 编辑商品页面
	public function product_edit(){
		$data = db('goods_type')->field("*, concat(path, ',', id) as paths")->order('paths')->select();
		foreach ($data as $k => $v) {
			$data[$k]['name'] = str_repeat("|------", $v['level']).$v['name'];
		}
		$this->assign('data', $data);

		
		$db = db('goods');
		$id = input('param.id');
		$goods = $db->find($id);

		$images=explode(',',$goods['filepath']);
		$i=model('GoodsFiles');
        $image=[];
        foreach($images as $v){
           array_push($image,$i->find($v));
        }

		
		$this->assign('goods', $goods);
		
		$this->assign('image',$image);
		return $this->fetch();
	}

	//修改商品信息函数
	public function goods_edit(){
		$goods = model('goods');
		$tid = explode(",", $_POST['tid']);
		
		if(isset($_POST['imagepath'])){
				$result = $goods->save([
				'goodsname'  =>  $_POST['goodsname'],
				'tid' => $tid[0],
				'tpid' => $tid[1],
				'unit' => $_POST['unit'],
				'attributes' => $_POST['attributes'],
				'number' => $_POST['number'],
				'curprice' => $_POST['curprice'],
				'cosprice' => $_POST['cosprice'],
				'inventory' => $_POST['inventory'],
				'freight' => $_POST['freight'],
				'status' => $_POST['status'],
				'text' => $_POST['editorValue'],
				'filepath' =>implode(',', $_POST['imagepath'])
			],['id' => $_POST['id']]);
		} else{
			$result = $goods->save([
				'goodsname'  =>  $_POST['goodsname'],
				'tid' => $tid[0],
				'tpid' => $tid[1],
				'unit' => $_POST['unit'],
				'attributes' => $_POST['attributes'],
				'number' => $_POST['number'],
				'curprice' => $_POST['curprice'],
				'cosprice' => $_POST['cosprice'],
				'inventory' => $_POST['inventory'],
				'freight' => $_POST['freight'],
				'status' => $_POST['status'],
				'text' => $_POST['editorValue']
			],['id' => $_POST['id']]);

		}

		if($result){
			$this->success('商品修改成功！', 'product_list');
		} else{
			$this->error('商品修改失败！');
		}
	}

	// 商品添加页
	// public function product_add(){
	// 	$data = db('goods_type')->field("*, concat(path, ',', id) as paths")->order('paths')->select();
	// 	foreach ($data as $k => $v) {
	// 		$data[$k]['name'] = str_repeat("|------", $v['level']).$v['name'];
	// 	}
	// 	$this->assign('data', $data);
	// 	return $this->fetch();
	// }

	//添加商品函数
	public function goods_add(){
		$goods = db('goods');
		$goods->data([
            'title'  =>  $_POST['title'],
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
        if($data['file']){
            $info = $data['file']->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
            // 成功上传后 获取上传信息
            // 输出 jpg
            echo $info->getExtension();
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getSaveName();
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getFilename(); 
            }else{
            // 上传失败获取错误信息
            echo $file->getError();
            }
        }
		$result = $goods->save();
		// $result = $db->insert($data);
        
		if($result){
			$this->success('商品添加成功！', 'product_list');
		} else{
			$this->error('商品添加失败！');
		}
	}

	// 商品分类页
	public function product_category(){
		return $this->fetch();
	}

	
	public function upload(){
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