read -p "Setup Github (y/n)? " -n 1 -r
echo
echo "Instructions here: https://help.github.com/articles/generating-ssh-keys/#platform-mac"
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    #check to make sure we're not entering blank email address
    input=
    while [[ $input = "" ]]; do
        read -p "What is the email address? (leave next promprt blank) "
        input=$REPLY
    done

    echo
    ssh-keygen -t rsa -b 4096 -C input
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub
    ssh -T git@github.com
fi
