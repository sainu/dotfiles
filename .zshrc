# Use emac like keybind
bindkey -e

autoload -Uz compinit; compinit
autoload -Uz colors; colors

# History
HISTSIZE=1048576
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
# Record history with timestamp and duration
setopt extended_history
# Delete duplicated history
setopt hist_ignore_all_dups
# Delete leading space
setopt hist_ignore_space
# Not store `history` command
setopt hist_no_store
# Delete unnecessary spaces
setopt hist_reduce_blanks
# Write history file when the command finished
setopt inc_append_history_time

# Load zsh plugin
# Need to load first for the following scripts
eval "$(sheldon source)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# === Zsh-abbr integrations
# https://zsh-abbr.olets.dev/integrations.html

# Have zsh-autosuggestions suggest your zsh-abbr abbreviations.
# https://github.com/olets/zsh-autosuggestions-abbreviations-strategy
ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )

# Highlight user abbreviations that will expand
# https://zsh-abbr.olets.dev/integrations.html#fast-syntax-highlighting
chroma_single_word() {
  (( next_word = 2 | 8192 ))

  local __first_call="$1" __wrd="$2" __start_pos="$3" __end_pos="$4"
  local __style

  (( __first_call )) && { __style=${FAST_THEME_NAME}alias }
  [[ -n "$__style" ]] && (( __start=__start_pos-${#PREBUFFER}, __end=__end_pos-${#PREBUFFER}, __start >= 0 )) && reply+=("$__start $__end ${FAST_HIGHLIGHT_STYLES[$__style]}")

  (( this_word = next_word ))
  _start_pos=$_end_pos

  return 0
}

register_single_word_chroma() {
  local word=$1
  if [[ -x $(command -v $word) ]] || [[ -n $FAST_HIGHLIGHT["chroma-$word"] ]]; then
    return 1
  fi

  FAST_HIGHLIGHT+=( "chroma-$word" chroma_single_word )
  return 0
}

if [[ -n $FAST_HIGHLIGHT ]]; then
  for abbr in ${(f)"$(abbr list-abbreviations)"}; do
    if [[ $abbr != *' '* ]]; then
      register_single_word_chroma ${(Q)abbr}
    fi
  done
fi
# === Zsh-abbr integrations

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,exports,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
