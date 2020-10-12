#!/bin/bash

# Default programs:
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
export PAGER="less"
export EDITOR="nvim"

#fcitx mozc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

#firefox
export MOZ_WEBRENDER=1

#Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export HISTFILE="$XDG_DATA_HOME"/bash/history
#Set XDG_RUNTIME_DIR
if test -z "${XDG_RUNTIME_DIR}"; then
      export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
      if ! test -d "${XDG_RUNTIME_DIR}"; then
          mkdir "${XDG_RUNTIME_DIR}"
          chmod 0700 "${XDG_RUNTIME_DIR}"
      fi
fi
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#add .local/bin to path
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonstartup
export PASSWORD_STORE_DIR="$HOME"/dc/projects/github/password-store
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IGNOREEOF=100
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

#alias
alias calcurse='calcurse -C "$XDG_CONFIG_HOME"/calcurse -D "$XDG_DATA_HOME"/calcurse'
alias calcurse-caldav='calcurse-caldav --config $XDG_CONFIG_HOME/calcurse/caldav/config --lockfile $XDG_DATA_HOME/calcurse/lock --syncdb $XDG_DATA_HOME/calcurse/sync.db --datadir $XDG_DATA_HOME/calcurse/ --hookdir $XDG_CONFIG_HOME/calcurse/hooks'
alias startx='startx $XDG_CONFIG_HOME/X11/xinitrc'
alias irssi='irssi --config=$XDG_CONFIG_HOME"/irssi/config --home="$XDG_DATA_HOME"/irssi'

# Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

#colorize
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto" \
	egrep="egrep --color=auto" \
	fgrep="fgrep --color=auto"

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"

# These common commands are just too long! Abbreviate them.
alias \
	xi="doas xbps-install" \
	xr="doas xbps-remove" \
	xq="xbps-query"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx $XDG_CONFIG_HOME/X11/xinitrc
fi
