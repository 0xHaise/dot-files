ZSH_THEME="agnoster"

# Plugins:
# - git : autocompletado de git al presionar tab
# - zsh-autosuggestions : sugerencias automaticas basadas en el historial de comandos ejecutados
# - sudo : agregar sudo al inicio mediante esc+esc (la tecla esc 2 veces) en lugar de por ejemplo ctrl+a (ir a inicio) y escribirlo
# - colored-man-pages  : listar man pages con colores para mejorar la legibilidad
plugins=(git zsh-autosuggestions colored-man-pages sudo )
 
source /usr/share/fzf/key-bindings.zsh

# Autocompletado con fzf
source /usr/share/fzf/completion.zsh

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias l1='ls -1'
alias cat='batcat' 
#alias ls='lsd --group-directories-first'
