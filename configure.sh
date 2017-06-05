# make pathogen link in autoload directory
#mkdir -p autoload
#ln -s ${PWD}/vim-pathogen/autoload/pathogen.vim autoload/pathogen.vim

# make .vimrc link in home directory
ln -s ${PWD}/.vimrc ${HOME}/.vimrc
