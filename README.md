## Reference:  
http://justcoding.iteye.com/blog/1830388

## Git pull:  
git remote add origin http://github.com/ray9550/my_vimrc.git  
git push -u origin master  

## Update files:  
git pull  
git add <file_name>  
git commit -m "Msg"  
git push origin master  

## Update files to local:  ???  
git fetch origin master  
git merge origin/master  
## Update files to local V2:  
如果希望用代码库中的文件完全覆盖本地工作版本. 方法如下:  
git reset --hard  
git pull  
其中git reset是针对版本,如果想针对文件回退本地修改,使用  
git checkout HEAD file/to/restore  

## If git remote add WRONG url:  
git remote rm origin  
git remote add origin [url]  

## Git pull ERROR：  
### error: The following untracked working tree files would be overwritten by merge:  
git clean  -d  -fx ""  
其中  
x  -----删除忽略文件已经对git来说不识别的文件  
d  -----删除未被添加到git的路径中的文件  
f  -----强制运行  

## Git remove dirctionary  
git rm -r --cached [dirname]  
git commit -m 'Msg'  
git push origin master  
