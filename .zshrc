[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
export ZSH=/Users/frol/.oh-my-zsh

ZSH_THEME="honukai"

plugins=(git tig ruby brew rails gem rvm rake bundler osx encode64 node yarn tmux fasd docker wd k jira mix vagrant)

# export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/opt/Ghostscript/bin:/usr/local/git/bin:/opt/ImageMagick/bin:/usr/local/MacGPG2/bin:/Users/frol/.rvm/bin"

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

if _has FZF && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [ -e /usr/local/opt/FZF/shell/completion.zsh ]; then
  source /usr/local/opt/FZF/shell/key-bindings.zsh
  source /usr/local/opt/FZF/shell/completion.zsh
fi

# export GOPATH="/Users/frol/go"
# export PATH=$PATH:$GOPATH/bin
# export PATH="$HOME/.cask/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
alias frol_server="ssh -p 2002 frol@95.213.161.130"
alias mini="ssh frol@192.168.88.11"
alias psq="psql postgres frol"
alias weather="curl wttr.in/moscow"
alias v="nvim"
alias git='LANG=en_US.UTF-8 git'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
