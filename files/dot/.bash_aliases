if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing up a
    # separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "-[svn]";
    elif __has_parent_dir ".git"; then
        echo "-[$(__git_ps1 'git %s')]";
    elif __has_parent_dir ".hg"; then
        echo "-[hg $(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# DISABLED BY DEJAN
# Nicely formatted terminal prompt
#export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '

source ~/.git-completion.sh

COLOR_1="\[\e[0;32m\]" # green
COLOR_2="\[\e[1;34m\]" # blue
COLOR_3="\[\e[1;37m\]" # white
USER_AT_HOST="\u@\h"
TIME_WITH_BRACKETS="[\t]"
SPACE=" "
DIR="\w"
DIR_BASENAME="\W"
PROMPT="$"
GIT_PROMPT='$(__git_ps1 "[%s]")'
PS1=${COLOR_1}${USER_AT_HOST}${SPACE}${COLOR_3}${DIR_BASENAME}${SPACE}${GIT_PROMPT}${SPACE}${COLOR_1}${PROMPT}${SPACE}${COLOR_3}

alias ls='ls -F --color=always'
alias dir='dir -F --color=always'
alias ll='ls -l'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'
alias grep='grep --color=auto -in'
alias ..='cd ..'
