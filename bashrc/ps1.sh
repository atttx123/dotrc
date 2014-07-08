#!/bin/bash

RETVAL=$1

prompt_command() {
    local RETVAL=$1
    local RED=$'\E[0;31m'
    local BG_RED=$'\E[0;41m'
    local LIGHTGREEN=$'\E[1;32m'
    local BG_LIGHTGREEN=$'\E[1;42m'
    local CLR_COLOR=$'\E[0m'

    ## parse term title
    case "$TERM" in 
        screen)
            [[ -n "$_TERM_TITLE" ]] \
                && __TERM_TITLE=$'\033k'"$TERM_TITLE"$'\033\\ ' \
                || __TERM_TITLE=$'\033k'"${HOSTNAME}"$'\033\\ '
            ;;
        xterm*)
            [[ -n "$_TERM_TITLE" ]] \
                && __TERM_TITLE=$'\E]0;'"$TERM_TITLE: ${PWD/$HOME/~}"$'\007' \
                || __TERM_TITLE=$'\E]0;'"${USER}@${HOSTNAME}: ${PWD/$HOME/~}"$'\007'
            ;;
        *)
            __TERM_TITLE=""
    esac

    # parse git branch
    IS_GIT_BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/-(git:\1${GIT_IS_DIRTY})/")

    ## parse command line color
    if [[ -z "$_IS_REMOTE" ]]; then
	[[ "$RETVAL" -eq 0 ]] && PS1_COLOR="${LIGHTGREEN}" || PS1_COLOR="${BG_LIGHTGREEN}"
    else
	[[ "$RETVAL" -eq 0 ]] && PS1_COLOR="${RED}" || PS1_COLOR="${BG_RED}"
    fi

    ## parse return value
    [[ "$RETVAL" -ne 0 ]] \
	&& IS_RETURN_VAL="-(\\\$?:$RETVAL)" \
	|| IS_RETURN_VAL=""

    ## parse shell level
    [[ "$SHLVL" -gt 2 ]] \
        && IS_SHLVL="-(SHLVL:$SHLVL)" \
        || IS_SHLVL=""

    local D=$'\e[37m'
    local PINK=$'\e[35m'
    local GREEN=$'\e[32m'
    local ORANGE=$'\e[33m'

    echo "${__TERM_TITLE}\w\r\[${PINK}\]\u \[${D}\]at \[${ORANGE}\]\h \[${D}\]in \[${GREEN}\]\w \[${CLR_COLOR}\]${IS_GIT_BRANCH}${IS_SHLVL}${IS_RETURN_VAL}\[${CLR_COLOR}\]\n\
\[${PS1_COLOR}\](! \!)->\[${CLR_COLOR}\] "
}

prompt_command $RETVAL
