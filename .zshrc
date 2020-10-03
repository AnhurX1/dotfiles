
setopt correct
export SPROMPT="Correct %R to %r? [Yes, No, Abort, Edit] "

chpwd() ls

plugins=(git sudo z)

source $ZSH/oh-my-zsh.sh
