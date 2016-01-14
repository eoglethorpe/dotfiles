
#CL shortcuts
alias l="ls -lhart"

exists () {
    type "$1" &> /dev/null ;
}
export -f exists

alias src="source ~/.bash_profile"
alias vb="vim ~/.bash_profile"
alias cb="cat ~/.bash_profile"
alias code="cd ~/code/"
alias df="cd ~/code/repos/dotfiles"

#python venv
alias activate=". $HOME/code/venv/bin/activate"

if [ -f $HOME/code/venv/bin/activate ];
then
    activate
fi

echo "consider it sourced"
