# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nickolanick/.zshrc'
autoload -Uz compinit
compinit
# exports
export KERN_DIR=/usr/src/kernels/`uname -r`
export TERM="xterm-256color" 
# modulus
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/nickolanick/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# My aliases
alias "..=cd .."
alias "c=xclip -selection clipboard"
alias "v=xclip -selection clipboard -o"
alias "vim=vimx"
alias "work=cd ~/Documents/work"
alias "keys=cd ~/Documents/keys"
#
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
