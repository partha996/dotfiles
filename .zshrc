# Starship themes
eval "$(starship init zsh)"

# pokemon art on startup
pokemon-colorscripts -r


# path for rust binaries
export PATH=$PATH:/home/partha/.cargo/bin:/home/partha/.local/bin


# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
#type starship_zle-keymap-select >/dev/null || \
#  {
#    echo "Load starship"
#    eval "$(/usr/local/bin/starship init zsh)"
#  }  

# default editor
export EDITOR="/bin/nvim"

#set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


#fzf theme(catppuccin)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220} Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34} Installation successful.%f%b"  \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

#Plugin installations
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode

# Load completions
autoload -U compinit && compinit

# Completion styling
zstyle ':completion=*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd --color $realpath'


#History configuration
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Keybinding for history cycle
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Fzf key bindings and completion
[ -f ~/.fzf/key-bindings.zsh ] && source ~/.fzf/key-bindings.zsh
[ -f ~/.fzf/completion.zsh ] && source ~/.fzf/completion.zsh


# for zoxide
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias ls='lsd'  
alias nv='nvim'
alias hyprco='cd ~/dotfiles/.config/hypr/ && nv hyprland.conf'
alias keyco='cd ~/dotfiles/.config/hypr/ && nv keybinds.conf'
alias poinfo='sudo tlp-stat -b'
alias zshrc='cd $HOME/dotfiles/ && nvim .zshrc'
alias src='source /$HOME/dotfiles/.zshrc'
alias peel='7z x '
alias bset='brightnessctl set'
alias wallc='cd /home/partha/scripts/ && ./wallpaperswitcher.sh'
alias play='playerctl play-pause'
alias cx='~/vcode/java/classclear.sh'
alias bx='~/tempclab/clean.sh'
alias playn='playerctl next'
alias playp='playerctl previous'
alias cp='cp -iv'
alias rm='rm -v'
alias mv='mv -v'
alias kdec='kdeconnect-cli' 
