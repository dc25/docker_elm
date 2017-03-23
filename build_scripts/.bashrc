#This script gets called from .bashrc whenever a shell starts.
# Edit to suit your own tastes.


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v=vim
alias pyser='python -m SimpleHTTPServer'
alias cdgnc='cd /repos/gitnc'
alias cdgit='cd /repos/git'

function rebu
{
    find . -type f -name '*.elm' | xargs ls | entr sh -c 'echo;echo;echo;echo;echo;elm-make Main.elm --output output/index.html; echo done'
}

cd 




