
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/alexx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Custom

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

eval "$(starship init zsh)"

# CUDA Paths
# export PATH="/opt/cuda/bin:$PATH"
# export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH"
# NOTE: IT NOW WORKS WITHOUT THEM

# Add go to PATH
export PATH=$PATH:$HOME/.go/bin
export PATH=$PATH:$HOME/go/bin

# Add pipx to path
export PATH=$PATH:/home/alexx/.local/bin

# Add cargo to path
export PATH=$PATH:$HOME/.cargo/bin

export EDITOR=nvim

# Alias for open to xdg-open
alias open='xdg-open'

# Alias for read only files
alias glow='nvim -R'

# Alias for here and there (custom scripts)
alias here='~/bin/here'
alias there='source ~/bin/there'

# Alias for s-here (custom scripts)
alias s-here='~/bin/s-here.py'

# Alias for docs (custom script)
alias docs='~/bin/docs/main.py'

# Alias for exa
alias ls='eza --icons'
compdef _ls eza

# Yazi change directory
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
compdef _cd cd

bindkey -d
bindkey -e
