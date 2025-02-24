# Alias
This file explains how you can add aliases to different terminals.

## My favourite Aliases
```bash
ask=echo $* && gh copilot explain $*
c=cd..
clear=cls
clink="C:\work\cmder\vendor\clink\clink_x64.exe" $*
cmderr=cd /d "%CMDER_ROOT%"
e.=explorer .
edit_alias=code c:\work\cmder\config\user_aliases.cmd
g=git status
g2=git checkout master && git pull origin master
ga=git add .
gacp=git add . && git commit $* && /f %i in ('git rev-parse --abbrev-ref HEAD') do git push origin %i
gb=git branch
gc=git commit -m "$*"
gca=git commit --amend
gd=git diff
gl=git log --oneline --all --graph --decorate  $*
gp=for /f %i in ('git rev-parse --abbrev-ref HEAD') do git push origin %i
gs=git status
history="C:\work\cmder\vendor\clink\clink_x64.exe" history $*
j=jrnl $*
l=ls
m=mkdir $*
malias=code c:\work\cmder\config\user_aliases.cmd
pur=az repos pr create --detect true --title $*
pwd=cd
pwsh=%SystemRoot%/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%CMDER_ROOT%/vendor/profile.ps1'''"
r=cd c:\work\git
repo=cd c:\work\git
unalias=alias /d $1
vi=vim $*
```

## cmder
edit file `[root folder for cmder]\config\user_aliases.cmd`
