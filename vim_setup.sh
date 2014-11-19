#! /bin/bash

# Install required software
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install curl
sudo apt-get install git

# setup your config directory
mkdir ~/.vim
mv ~/.vimrc .vim/vimrc
touch ~/.vim/vimrc
mkdir ~/.vim/bundle
mkdir ~/.vim/autoload

# clone the pathogen plugin installer
cd ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# clone all the best plugins
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/flazz/vim-colorschemes.git colorschemes
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/kien/ctrlp.vim

# set up your vimrc
cd ~/.vim
echo "set nu" 						>> vimrc
echo "set tabstop=4" 				>> vimrc
echo "set colorcolumn=80" 			>> vimrc
echo "set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P" >> vimrc
echo "set cursorline" 				>> vimrc
echo "" 							>> vimrc
echo "execute pathogen#infect()" 	>> vimrc
echo "" 							>> vimrc

echo "\"syntastic setup"
echo "let g:syntastic_java_checkers = ['javac']"	>> vimrc
echo "let g:syntastic_maven_executable = 'mvn'" 	>> vimrc
echo "let g:syntastic_javac_autoload_maven_classpath = 1" >> vimrc
echo "let g:syntastic_enable_balloons = 1" 			>> vimrc
echo "autocmd vimenter * NERDTree" 					>> vimrc

echo "if \$TERM == \"xterm-256color\" || \$TERM == \"screen-256color\" || \$COLORTERM == \"gnome-terminal\"" >> vimrc
echo "    set t_Co=256" 			>> vimrc
echo "    colorscheme hybrid-light" >> vimrc
echo "endif" 						>> vimrc


# now setup tmux
cd
echo "alias tmux=\"TERM=xterm-256color tmux\"" >> ~/.bashrc
echo "set -g default-terminal \"screen-256color\"" >> ~/.tmux.conf

