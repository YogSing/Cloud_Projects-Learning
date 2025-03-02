Useful linux cmds
Print current working Directory:PWD 
Change directory:cd 
List content of directory: Ls 
Lists hidden folder/files: Ls -a
Detailed listing including hidden file: ls-la
Search for hidden files(hidden file starts with .): find . -name ".*"
Search files by name: find /path -name "pattern"
List files with sizes: ls -lh
Display disk usage: du -h
Fin files larger than 10 MB:  find /path -type f -size +10M
Display file content: cat filename 
Display user ID&groups: id 
How to switch to another user in bash: sudo -u username -i
How to exit out of account: exit 
Detailed file information: stat filename 
Find files with specific permissions: find / -perm 777(MODE)
Change file permissions: chmod MODE filename 
Displays protocol statistics and current TCP/IP network connections: netstat -tuln
Test HTTP service connectivity: curl localhost: port
Encode or decode text: base64 filename
How to decode a file or phrase: echo "VVRGU1IyVXlVbXhaTWpscllWYzFibGd5TVdoak0xSnNZMjR3U3dvPQo=" | base64 --decode
Common location of DNS config file:  /etc/resolv/conf
Common location of config Backup: /etc/resolv.conf.bak
Generate SSH keys: ssh-keygen
OpenSSH secure file copy: Scp path path
File editor: Nano filename 
Creates a new file and writes content to it(save Ctrl + D): cat > filename.txt
Appends content to an existing file: cat >> filename.txt:
Read file: Cat filename.txt
Create an empty file or update timestamps: touch filename
Read first 10 lines without opening full file: head -n 10 filename.txt
Read last 10 lines: tail -n 10 filename.txt
Diff cmd for comparison: Diff file1 file1
Common file location of Nginx file: /etc/nginx/nginx.conf
Check status of nginx: sudo systemctl status nginx
Starting nginx: sudo systemctl start nginx
Stopping nginx: sudo systemctl stop nginx
Restarting nginx: sudo systemctl restart nginx
Contents of a file one screen at a time : less filename 
Editing and viewing files: vim filename 
