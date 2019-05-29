public function upQuestionsWrite()  
    {  
        // 获取表单上传文件  
        $file = request()->file('filename');  
        if(empty($file)) {  
            $this->error('请选择上传文件');  
        }  
        // 移动到框架应用根目录/public/uploads/ 目录下  
        $info = $file->move(ROOT_PATH.'public'.DS.'upload'); 
        //如果不清楚文件上传的具体键名，可以直接打印$info来查看  
        //获取文件（文件名），$info->getFilename()  ***********不同之处，笔记笔记哦
        //获取文件（日期/文件名），$info->getSaveName()  **********不同之处，笔记笔记哦
        $filename = $info->getSaveName();  //在测试的时候也可以直接打印文件名称来查看 
        if($filename){              
            $this->success('文件上传成功！');  
        }else{  
            // 上传失败获取错误信息  
            $this->error($file->getError());  
        }  
    }   
