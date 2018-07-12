# Standard Aliases

function _cd() {
	cd "$@"
	ls -G
}
alias ptt='ssh bbsu@ptt.cc'
alias scr='screen -U -R -D'
alias cls='clear'
alias cp='cp -i'
alias ..='cd ..'
alias du='du -h --max-depth=1'
alias h='history | grep'
alias mv='mv -i'
alias rm='_rm'
alias rrm='/bin/rm -i'	# real rm
alias mkdir='mkdir -p'
alias vi='vim'
#alias cd='cd "$@"; _ls'
alias cd='_cd'
alias j='jobs -l'
alias which='type -a'
alias grep='grep --color=auto'

# Screen alias
alias scrl='screen -ls'
alias scrk='scr_kill'

# git 
alias git-log='_git-log'

function _git-log() {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

function _rm() {
	while [ $# -ge 1 ]; do
		mv -f "$1" $HOME/tmp
		echo "$1 deleted."
		shift
	done
}

function _ls() {
	/bin/ls -C --color=always $@ | /usr/bin/iconv -f big5 -t utf8
}

function scr_kill () {
	while [ $@ -ge 1 ]; do
		screen -X -S "$1" kill
		echo "screen $1 killed."
		shift
	done
}




# Personal Aliases

if [ -e ~/.alias ]; then
	. ~/.alias
fi

# Local Functions and Commands

function git_info {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;

now=`date +%s`;
sec=$((now-last_commit));
min=$((sec/60)); hr=$((min/60)); day=$((hr/24)); yr=$((day/365));
if [ $min -lt 60 ]; then
	info="${min}m"
elif [ $hr -lt 24 ]; then
	info="${hr}h$((min%60))m"
elif [ $day -lt 365 ]; then
	info="${day}d$((hr%24))h"
else
	info="${yr}y$((day%365))d"
fi

echo "(${ref#refs/heads/} $info)";
#	echo "(${ref#refs/heads/})";
}

function old() {
day=$1; shift
find . -maxdepth 1 -mtime +${day} $@
}

function _rm() { 
while [ $# -ge 1 ]; do
	mv -f "$1" $HOME/tmp
	echo "$1 deleted."
	shift
done
}

function rmold() {
find . -maxdepth 1 -mtime +$1 -exec rm -rf {} \;
}

# vi:nowrap:sw=4:ts=4
export FONTCONFIG_PATH=/etc/fonts
export LS_OPTIONS='--color=auto';
