# git pull
git remote add origin http://github.com/ray9550/my_vimrc.git  
git push -u origin master  

# Update files:  
git pull  
git add <file_name>  
git commit -m "Msg"  
git push origin master  

# Update files to local:  
git fetch origin master  
git merge origin/master  
