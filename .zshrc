source $HOME/.profile

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

source <(starship init zsh --print-full-init)

source $HOME/.bash_aliases
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/config"
