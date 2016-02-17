" ==================================================  
"   
"               .vimrc
"               ------
"
"   File: .vimrc
"   Author: David Bulczak
"   Email: david.bulczak@gmail.com
"   Decription: This .vimrc is basically used for 
"   software developement. Partially it is based on 
"   http://vim.wikia.com/wiki/Using_vim_as_an_IDE_all_in_one.
"   Feel free to configure it.
" ================================================== 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" Ack (grep search style)
Plugin 'mileszs/ack.vim'

" GDB support
Plugin 'vim-scripts/Conque-GDB'

" CMake support
Plugin 'jalcine/cmake.vim'

" File search
Plugin 'kien/ctrlp.vim'

" Doxygen
Plugin 'vim-scripts/DoxygenToolkit.vim'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Git
Plugin 'tpope/vim-fugitive'

" Showmarks
Plugin 'vim-scripts/ShowMarks'

" Airline
Plugin 'bling/vim-airline'

" GLSL support
Plugin 'tikhomirov/vim-glsl'

" Lua support
Plugin 'xolox/vim-lua-inspect'
Plugin 'xolox/vim-misc'

" Snippets
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'


call vundle#end()            " required
filetype plugin indent on    " required

" -------------------- 
"  Pathogen
" --------------------
" execute pathogen#infect()

" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

" --------------------
" Project
" --------------------
map <A-S-p> :Project<CR>
map <A-S-o> :Project<CR>:redraw<CR>/
nmap <silent> <F3> <Plug>ToggleProject
let g:proj_window_width = 30
let g:proj_window_increment = 50

" --------------------
"  Clang complete
" --------------------
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

" --------------------
"  YouCompleteMe
" --------------------
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_confirm_extra_conf = 0

" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" --------------------
"  CMake Vim
" --------------------
let g:cmake_build_dirs = ["_build"]
let g:cmake_build_directories = ["_build"]

" --------------------
"  ConnqueGDB
" --------------------
"autocmd vimenter * ConqueGdb
let g:ConqueGdb_Leader = ','

" --------------------
" NERDTree
" -------------------- 
autocmd vimenter * NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p 
autocmd VimEnter * wincmd l 
" close if last window is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd BufEnter * NERDTreeMirror
let g:nerdtree_tabs_open_on_console_startup=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" --------------------
"  Syntastic
" --------------------
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++0x'

" --------------------
"  Doxygen Toolkit
" --------------------
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Mathias Lorente"
let g:DoxygenToolkit_licenseTag="My own license"

let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""

" --------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" -------------------- 
"  General settings
" -------------------- 
syntax on
filetype plugin indent on
syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set cindent
set cinoptions=g0
setlocal spell spelllang=en_us
":set cursorline cursorcolumn
:set cursorline 
" tab and shift tab mapping as in other text editors
vmap <Tab> >gv
vmap <S-Tab> <gv
set syntax=cpp.doxygen 
set t_Co=16                     " This is necessary for solarized theme since it needs 16 but not 8 colors
set background=dark
colorscheme solarized
au FocusGained * :redraw!
set cole=0

" ---------------------
"  My commands & abbrevations
" ---------------------

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" uppercase word
nnoremap <leader>U viwUe
" alternative normal mode entering
inoremap jj <esc>l
inoremap jk <esc>l
" build project
nnoremap <leader>b :silent execute "cd _build"<cr>:silent execute "make -j8"<cr>:silent execute "cd .."<cr>:copen<cr>:redraw!<cr>
" copy to system clipboard (check if your vim supports is with :echo has('clipboard'))
vnoremap <C-c> "+y
" paste from system clipboard
nnoremap <C-p> "+p
nnoremap <C-p> "+v

" --------------------
"  My data
" --------------------
iabbrev @@g david.bulczak@gmail.com
iabbrev @@d mail@david-bulczak.com
iabbrev @@s david.bulczak@uni-siegen.com
iabbrev @@r mail@raw-mind.com

" --------------------
"  Disabling for learning reasons
" --------------------
nnoremap <esc> <nop>
vnoremap <esc> <nop>
inoremap <esc> <nop>

"let g:Tex_AutoFolding = 0

"let g:solarized_bold=1
"let g:solarized_termcolors=256

"let g:NERDTreeDirArrows=0

" VIMlike tab movement 
"nnoremap th  :tabfirst<CR>
"nnoremap tj  :tabnext<CR>
"nnoremap tk  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap td  :tabclose<CR>

" --------------------  
"  Asciidoc
" --------------------
" Show tabs and trailing characters.
"set listchars=tab:»·,trail:·,eol:¬
set listchars=tab:»·,trail:·
set list

" Reformat paragraphs and list.
nnoremap <Leader>r gq}

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

autocmd BufRead,BufNewFile *.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ textwidth=80 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

" -------------------- 
"  CMake
" -------------------- 

"au BufRead,BufNewFile CMakeLists.txt setlocal syntax=cmake-syntax
