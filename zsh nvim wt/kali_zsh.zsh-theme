PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)──}(%B%F{%(#.red.blue)}%(#.㉿.💀)%b%F{%(#.blue.green)})-[%B%F{%(#.red.blue)}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]$(prompt_git)%F{yellow}%D{%H:%M}%b%F{%(#.blue.green)}\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '

RPROMPT=$'%(?.. %?%F{red}%B⨯%b%F{reset})%(1j. %j%F{yellow}%B⚙%b%F{reset}.)'


prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    
  }
  local ref dirty mode repo_path

   if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
 
    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '±'
    zstyle ':vcs_info:*' formats '%u%c'
    zstyle ':vcs_info:*' actionformats '%u%c'
    vcs_info
    echo -n "%{$fg_bold[blue]%}(%{$fg[red]%}${ref/refs\/heads\//$PL_BRANCH_CHAR}${vcs_info_msg_0_%%}${mode}%{$fg[blue]%})"
  fi
}

