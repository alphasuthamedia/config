# just source me... 

alias l='ls'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\e[38;2;180;190;254m\]\A \
\[\e[38;2;137;180;250m\]\u\
\[\e[38;2;205;214;244m\]@\
\[\e[38;2;137;220;235m\]\h \
\[\e[38;2;203;166;247m\]\W\
\[\e[38;2;205;214;244m\]\$ '

export EDITOR=nvim

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
else
    echo "bash-completion missing woi"
fi

if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --bash)"

    if command -v fd >/dev/null 2>&1; then
        export FZF_CTRL_T_COMMAND='fd --type f'
        export FZF_ALT_C_COMMAND='fd --type d'
    else
        echo "fd belum terinstall, Ctrl+T dan Alt+C pakai backend bawaan fzf"
    fi
else
    echo "fzf belum terinstall"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
else
    echo "zoxide belum terinstall"
fi


