# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=($HOME/.completion_zsh $fpath)

HIST_STAMPS="dd/mm/yyyy"

# Path to your oh-my-zsh installation.
export ZSH="/home/frol/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git tmux docker direnv zsh-autosuggestions zsh-syntax-highlighting kubectl)

source $ZSH/oh-my-zsh.sh

if [ -e /usr/share/fzf/completion.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

alias v=nvim

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:$HOME/.cargo/bin
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH=$PATH:$HOME/.platformio/penv/bin

export PATH="$HOME/.emacs.d/bin:$PATH"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

export BUNDLE_GITHUB__COM=x-access-token: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
export CARGO_NET_GIT_FETCH_WITH_CLI=true
