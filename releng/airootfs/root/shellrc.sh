# Configuration for Bourne-compatible shells
# by: Rain Gloom
# license: do whatever you want with it, just don't come crying or send lawyers when something breaks



#==Parameters==
# editor preferences
pref_visual=( nvim vim nano vi emacs )
pref_term=(urxvt xterm)
# custom xclip function use this
export clipname=clipboard
#==//////////==

export PAGER=less #WTF Kali, y u no page with less

if [ -d $HOME/bin ]; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -d /opt/openresty ]; then
	export PATH="/opt/openresty/bin:/opt/openresty/nginx/sbin:$PATH"
fi
if [ -d $HOME/.gem ]; then
	for version in `ls -1 "$HOME/.gem/ruby"`; do
		export PATH="$HOME/.gem/ruby/$version/bin:$PATH"
	done
fi


alias ls='ls --color=auto'
alias rmr='rm -rvf'
alias l=ls
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'


# preference looper
exppref(){
	for v in ${1[*]}; do
		if which "$v" > /dev/null; then
			export $2="$v"
			break
		fi
	done
}
exppref pref_visual VISUAL
export EDITOR=VISUAL #we are hard core like that :^)
exppref pref_term TERM

# quicker access to gvfs mounts
if which gvfs-open > /dev/null; then
	export GVFSD=/run/user/$UID/gvfs/
	ln -vsfT "$GVFSD" "$HOME/.gvfsd"
fi

#==Custom functions==
# xclip copy-pasting
xclipSelections=(
	primary
	secondary
	clipboard
)
clipx(){
	xclip -selection $clipname
}
# same as clipx, but floods all copy buffers from the default one
clipxflood(){
	xclip
	for sel in $xclipSelections; do
		xclip -o | xclip -selection $sel
	done
}
pastex(){
	xclip -o -selection $clipname
}
# symlink magix
lnmv (){
	mkdir -p $2
	mv -v -t "$2" "$1"
	ln -vs "$2/$(basename $1)" "$(dirname $1)"
}
mkcd (){
	mkdir -p $1
	cd $1
}
# luaenv needs manual activation
activate-luaenv(){
	if [ -d "$HOME/.luaenv" ]; then
		export PATH="$HOME/.luaenv/bin:$PATH"
		eval "$(luaenv init -)"
	fi
}
speedtest(){
	wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
}
#==////////////////==



# Welcome text
welcome_head="Hello $(whoami), welcome to $(hostname)"
welcome_body="When you don’t create things, you become defined by your tastes rather than ability. Your tastes only narrow and exclude people. so create.
— Why the Lucky Stiff\n$(date)\n$(uptime)"
if which figlet > /dev/null; then
	echo "$welcome_head" | figlet -t -f kban
else
	echo "$welcome_head"
fi
echo "$welcome_body"

# Fuck. That. Fucking. Goddamn. Fucktard. Bell.
xset -b #die bell die
# Fuck.

#EOF
