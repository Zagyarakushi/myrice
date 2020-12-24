set -x TERMINAL st 
set -x BROWSER firefox
set -x READER zathura
set -x FILE lf
set -x PAGER less
set -x EDITOR vim

#Get rid of greeting
set fish_greeting 
set fish_color_command 5c5cd6

#firefox
set -x MOZ_WEBRENDER 1

#fcitx
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx

#Directories
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x HISTFILE $XDG_DATA_HOME/bash/history
set -x INPUTRC $XDG_CONFIG_HOME/readline/inputrc
set -x ANDROID_SDK_HOME $XDG_CONFIG_HOME/android
set -x LESSKEY $XDG_CONFIG_HOME/less/lesskey
set -x LESSHISTFILE $XDG_CACHE_HOME/less/history
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -x XAUTHORITY $XDG_CONFIG_HOME/X11/Xauthority
set -x PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonstartup
set -x PASSWORD_STORE_DIR $HOME/.local/share/gitstuff/password-store
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -x KODI_DATA $XDG_DATA_HOME/kodi
set -x WINEPREFIX $XDG_DATA_HOME/wineprefixes/default

#set path
set PATH $HOME/.local/bin $PATH

#set xdg_runtime_dir
if test -z $XDG_RUNTIME_DIR
	set -x XDG_RUNTIME_DIR /tmp/{$UID}-runtime-dir
	if ! test -d {$XDG_RUNTIME_DIR}
		mkdir {$XDG_RUNTIME_DIR}
		chmod 0700 {$XDG_RUNTIME_DIR}
	end
end

# If running from tty1 start sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  exec startx $XDG_CONFIG_HOME/X11/xinitrc
end
