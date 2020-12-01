PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)──}(%B%F{%(#.red.blue)}%(#.💀.㉿)%b%F{%(#.blue.green)})-[%B%F{%(#.red.blue)}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]$(git_prompt_info)%b%F{%(#.blue.green)}\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '

RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
