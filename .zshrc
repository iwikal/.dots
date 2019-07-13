# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/iwikal/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt spaceship
# End of lines added by compinstall

export TERMINAL=termite

SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  # git           # Git section (git_branch + git_status)
  git_branch
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_GIT_BRANCH_SUFFIX=" "

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
