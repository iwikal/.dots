# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/iwikal/.zshrc'

fpath=($fpath "/home/iwikal/.zfunctions")

autoload -Uz compinit
compinit
# End of lines added by compinstall

export TERMINAL=termite

source <(starship init zsh --print-full-init)

case $TERM in
  (*xterm* | rxvt)

    # Write some info to terminal title.
    # This is seen when the shell prompts for input.
    function precmd {
      print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
    }
    # Write command and args to terminal title.
    # This is seen while the shell waits for a command to complete.
    function preexec {
      printf "\033]0;%s\a" "$1"
    }

  ;;
esac

export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.yarn/bin/:$PATH

source $HOME/.bash_aliases
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/config"
