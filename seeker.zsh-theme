ZSH_THEME_GIT_PROMPT_PREFIX="git:‹%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}› %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}›"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="venv:‹%{$fg[red]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$fg[blue]%}› "
ZSH_THEME_VIRTUALENV_PREFIX=""
ZSH_THEME_VIRTUALENV_SUFFIX=""

function _virtualenv_prompt_info {
    if [[ -n "$(whence virtualenv_prompt_info)" && -n ${VIRTUAL_ENV} ]]; then
        # [[ -n ${VIRTUAL_ENV} ]] || return
        echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$(virtualenv_prompt_info)$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}

function _git_prompt_info {
    [[ -n $(whence git_prompt_info) ]] && git_prompt_info
}

PROMPT='╭ %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%n in %{$fg[cyan]%}%~ %{$reset_color%}
╰ ➤ '

RPROMPT='%{$fg_bold[blue]%}$(_virtualenv_prompt_info)$(_git_prompt_info)'
