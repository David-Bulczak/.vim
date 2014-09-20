# make pathogen link in autoload directory
mkdir -p autoload
ln -s ${PWD}/vim-pathogen/autoload/pathogen.vim autoload/pathogen.vim

# make .vimrc link in home directory
ls -s ${PWD}/.vimrc ${HOME}/.vimrc
