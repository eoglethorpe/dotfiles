if [[ "$1" == "linux-gnu" ]]; then
        os='linux'
elif [[ "$1" == "darwin"* ]]; then
        os='osx'
fi

sudo pip install virtualenv

if [ ! -d $HOME"/code/venv/" ];
then
    virtualenv $HOME"/code/venv/"
fi

. $HOME/".bash_profile"
