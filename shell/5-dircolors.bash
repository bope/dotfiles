# dircolors
if which dircolors &> /dev/null ; then
    if [ -r ~/.dircolors ] ; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        evel "$(dircolors -b)"
    fi
fi
