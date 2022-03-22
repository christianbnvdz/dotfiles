#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias gitlog='git log --all --oneline --graph'
alias ls='ls --color=auto'

get_branch_name () {
  if git status &> /dev/null; then
    echo "\\[\\e[48;5;17;38;5;18m\\] \\[\\] $(git status | grep "On branch" | cut -c11-) \\[\\e[0m\\]"
  fi
}

prompt_cmd () {
  dir='\[\e[48;5;16;38;5;18m\] \w \[\e[0m\]'
  PS1=${dir}
  PS1+=$(get_branch_name)
  PS1+=' '
}

PROMPT_COMMAND=prompt_cmd

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION