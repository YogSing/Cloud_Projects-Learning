# Useful Linux cmds



1. **List content of directory**: `ls`

2. **Print current working Directory**:`PWD`

3. **Change directory**:`cd` 

4. **List content of directory**: `ls`

5. **Lists hidden files/folders**: `ls -a`

6. **Detailed listing including hidden files**: `ls -la`

7. **Search for hidden files(hidden file starts with .)**: `find . -name ".*"`

8. **Search files by name**:`find /path -name "pattern"`

9. **List files with sizes**: `ls -lh`

10. **Display disk usage**: `du -h`

11. **Find files larger than 10 MB**:  `find /path -type f -size +10M`

12. **Display file content**: `cat filename `

13. **Display user ID&groups**:` id `

14. **How to switch to another user in bash**: `sudo -u username -i`

15. **How to exit out of account**: `exit` 

16. **Detailed file information**: `stat filename `

17. **Find files with specific permissions**: `find / -perm 777(MODE)`

18. **Change file permissions**: `chmod MODE filename` 

19. **Displays protocol statistics and current TCP/IP network connections**: `netstat -tuln`

20. **Test HTTP service connectivity**: `curl localhost: port`

21. **Encode or decode text**: `base64 filename`

22. **How to decode a file or phrase**: `echo "VVRGU1IyVXlVbXhaTWpscllWYzFibGd5TVdoak0xSnNZMjR3U3dvPQo=" | base64 --decode`

23. **Common location of DNS config file**:  `/etc/resolv/conf`

24. **Common location of config Backup**: `/etc/resolv.conf.bak`

25. **Generate SSH keys**: `ssh-keygen`

26. **OpenSSH secure file copy**: `Scp path path`

27. **File editor**: `Nano filename `

28. **Creates a new file and writes content to it(save Ctrl + D)**: `cat > filename.txt`

29. **Appends content to an existing file**: `cat >> filename.txt`

30. **Read file**: `Cat filename.txt`

31. **Create an empty file or update timestamps**: `touch filename`

32. **Read first 10 lines without opening full file**: `head -n 10 filename.txt`

33. **Read last 10 lines**: `tail -n 10 filename.txt`

34. **Diff cmd for comparison**: `Diff file1 file1`

35. **Common file location of Nginx file**: `/etc/nginx/nginx.conf`

36. **Check status of nginx**: `sudo systemctl status nginx`

37. **Starting nginx**: `sudo systemctl start nginx`

38. **Stopping nginx**: `sudo systemctl stop nginx`

39. **Restarting nginx**: `sudo systemctl restart nginx`

40. **Contents of a file one screen at a time**: `less filename` 

41. **Editing and viewing files**: `vim filename `
