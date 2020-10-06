# prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=''

if [ -r "/usr/share/git/git-prompt.sh" ] ; then
    source /usr/share/git/git-prompt.sh
    PS1='\[\e[0;32m\]\h \[\e[0;37m\]\w\[\e[0m\]$(__git_ps1 " \[\e[1;30m\]%s\[\e[0m\]") '
else 
    PS1='\[\e[0;32m\]\h \[\e[0;37m\]\w\[\e[0m\] '
fi
