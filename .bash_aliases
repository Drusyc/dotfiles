
alias ls='ls -hF --color'
alias ll='ls -l' 
alias lt='ll -ct'

alias cdd='cd `ls -t | head -1`'

alias prettyjson='python -m json.tool $1'


### Aliases.gzt

alias rm='/bin/rm -i'
alias cp='/bin/cp -iv'
alias mv='/bin/mv -iv'

alias rsync='/usr/bin/rsync -rtvzuP'

# Get space occupation on disk of current directory (files + subdir)
alias duh='/usr/bin/du -h . | /usr/bin/tail -n1'

alias :q='exit'

# Ls and grep
#alias ll='/bin/ls -l --color'
alias l='/bin/ls -l --color'
alias la='/bin/ls -lA --color'
alias lr='/bin/ls -lRt --color'
alias grep='/bin/grep --color=auto'
