# Project Management
A collection of simple scripts for managing all of your projects.

Just place the project.sh and .bashrc_template in any folder where you want to store your project files.
Enter in the project.sh your name and email address for git support.

Add an alias like
```
alias project='bash -c "PATH/project.sh"'
```
Now you can go into your projects from anywhere by just typing
```
user@LinuxMachine:~$ project
################# Project Management ####################
Available Projects in /home/user/Projekte:
1) ./2018_10_13_BackupOld              user
2) ./2018_10_13_NGSpiceTools           user
0) Abort
-1) Create New
#########################################################

Your selection: ___

```

This script is opening a new bash session with modified home directory, additional commands and the path variable is aiming at the project's bin folder.
You can exit a project by just typing
```
exit
```
