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

" -------------------- 
"  Pathogen
" --------------------
execute pathogen#infect()

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

set t_Co=16                     " This is necessary for solarized theme since it needs 16 but not 8 colors
set background=dark
colorscheme solarized
"let g:solarized_bold=1
"let g:solarized_termcolors=256

"let g:NERDTreeDirArrows=0

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
