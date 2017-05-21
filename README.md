## Git pull:
git remote add origin http://github.com/ray9550/my_vimrc.git  
git push -u origin master  

## Update files:  
git pull  
git add <file_name>  
git commit -m "Msg"  
git push origin master  

## Update files to local:  
git fetch origin master  
git merge origin/master  

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
