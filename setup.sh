echo 'Running Setup'


#install all prop files and source them
shopt -s dotglob
for PROP in ./props/*
do
    if [ -a $PROP ]
    then
        echo 'Copying and sourcing' $PROP
        toloc=$HOME"/"$(basename $PROP)
        cp $PROP $toloc
        . $toloc
    fi
done

#check to see if there is a code file in the default dir and create one if not
if [ ! -d $HOME"/code/" ];
then
    mkdir $HOME"/code/"
fi


#get OS and do some initial installs
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    os='linux'
    
    if ! exists pip;
    then
        sudo apt-get install python-pip
        sudo yum install python-pip
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    os='osx'
    
    #insall homebrew
    if ! exists brew;
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install python
fi


echo 'OS is' $os

#run all scripts in dir
for SCRIPT in ./scripts/*
do
    if [ -f -a $SCRIPT ]
    then
        echo 'Executing' $SCRIPT
        sh $SCRIPT $os
    fi
done
