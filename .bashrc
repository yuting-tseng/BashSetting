# ~/.bashrc: executed by bash(1) for non-login shells.
# Color avaliable
export TERM="xterm-256color"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTSIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# user:~$
case "$TERM" in
	xterm-color)
		#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
		PS1='\[\e[38;5;79m\]\u\[\e[0m\]:\[\e[38;5;228m\]\w\$ \[\e[00;37m\]'
		;;
	*)
		PS1='\[\e[38;5;79m\]\u\[\e[0m\]:\[\e[38;5;228m\]\w\$ \[\e[00;37m\]'
		#PS1='\[\033[38;5;79m\]\u:\[\033[01;93m\]\w\[\033[01;157m\]$(git_info)\[\033[38;5;228m\]\$ \033[00;37m\]'
		;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/~/~}\007"'
		;;
	*)
		;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Terminal colours (after installing GNU coreutils)
#NM="\[\033[0;38m\]" #means no background and white lines
#HI="\[\033[0;37m\]" #change this for letter colors
#HII="\[\033[0;31m\]" #change this for letter colors
#SI="\[\033[0;33m\]" #this is for the current directory
#IN="\[\033[0m\]"
#PS1=`\e[33;1m\u@\h: \e[31m\W\e[0m\$ `

#export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
	#LS_COLORS='rs=0:di=00;94:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
	#export LSCOLORS="Exfxcxdxcxegedabagacad"
	#export LS_COLORS
	eval "dircolors -b "
	alias ls='ls -G'
fi

function _ls() {
	#LANG=zh_TW.BIG5
	/bin/ls -G
	#/bin/ls -C --color=always $@ | /usr/bin/iconv -f big5 utf8
	#LANG=zh_TW.UTF-8
}

# some more ls aliases
alias ls='ls -G'
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Multiple reuirement
export EDITOR=vi
export GDFONTPATH="~/share/fonts"
export LANG=zh_TW.UTF-8
export PATH="$PATH:$HOME/bin"
export PATH=${HOME}/.local/bin:${PATH}


# vi:nowrap:sw=4:ts=4

