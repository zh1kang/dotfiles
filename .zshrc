export PATH="$HOME/ngrok:$PATH"

# Added by Windsurf
export PATH="/Users/caleb/.codeium/windsurf/bin:$PATH"

# Added by Windsurf
export PATH="/Users/caleb/.codeium/windsurf/bin:$PATH"

# bun completions
[ -s "/Users/caleb/.bun/_bun" ] && source "/Users/caleb/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Added by Antigravity
export PATH="/Users/caleb/.antigravity/antigravity/bin:$PATH"

# opencode
export PATH=/Users/caleb/.opencode/bin:$PATH

# Start tmux automatically for interactive Ghostty shells.
if [[ $- == *i* ]] && [[ -z "${TMUX:-}" ]] && [[ "${TERM_PROGRAM:-}" == "ghostty" || "${TERM:-}" == xterm-ghostty* ]]; then
  if command -v tmux >/dev/null; then
    exec tmux new-session
  fi
fi

# Show fastfetch in each fresh top-level tmux shell so new windows start with it.
if [[ $- == *i* ]] && [[ -n "${TMUX:-}" ]] && [[ "${SHLVL:-1}" -eq 1 ]]; then
  if command -v fastfetch >/dev/null; then
    fastfetch --pipe false
  fi
fi

clear_terminal_images() {
  local seq passthrough
  seq=$'\e_Ga=d,q=2\e\\'

  if [[ -n "${TMUX:-}" ]]; then
    passthrough=${seq//$'\e'/$'\e\e'}
    printf '\ePtmux;\e%s\e\\' "$passthrough"
  else
    printf '%s' "$seq"
  fi
}

nvim() {
  clear_terminal_images
  command nvim "$@"
}

# Zsh completions, autosuggestions, and syntax highlighting.
if [[ -d "$HOME/.zsh/plugins/zsh-completions/src" ]]; then
  fpath=("$HOME/.zsh/plugins/zsh-completions/src" $fpath)
fi

autoload -Uz compinit
compinit -i

if [[ -r "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -r "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
