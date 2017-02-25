" Powerline settings
let g:powerline_pycmd="py3"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

"Vundle settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle manage vundle
Plugin 'VundleVim/Vundle.vim'

" Ansible
Plugin 'pearofducks/ansible-vim'

" Syntastic syntax checker
Plugin 'scrooloose/syntastic'

" Solarized colors
Plugin 'thomwiggers/vim-colors-solarized'

"Git gutter
Plugin 'airblade/vim-gitgutter'

" Python mode
Plugin 'klen/python-mode'

" LaTeX
Plugin 'vim-latex/vim-latex'

" WebAPI
Plugin 'mattn/webapi-vim'

" Gist
Plugin 'mattn/gist-vim'

" Html5
Plugin 'othree/html5.vim'

" js
Plugin 'othree/yajs.vim'

"Editorconfig support
Plugin 'editorconfig/editorconfig-vim'

" Camil's Clean plugin
Plugin 'camilstaps/vim-clean'

" Camil's BB-script highlighter
Plugin 'camilstaps/vim-bb'

" Fugitive for git
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on

" Own settings
" ------------------
"  Text formatting
" ------------------

set autoindent                  " Autoindent newlines
set autowrite                   " autosave on :make
set smartindent
inoremap # X<BS>#
set nowrap                      " Don't wrap lines
set softtabstop=4
set shiftwidth=4
set tabstop=4                   " 4-space tab
set expandtab
set smarttab                    " At start of line, tab inserts sw, <BS> deletes sw
set formatoptions+=n            " Support for numbered/bullet lists
set virtualedit=block           " Allow virtual edit in block mode

" --------------------
"  Remapping
" --------------------

" lead with ,
let mapleader=","

" reflow with Q in normal and visual mode
nnoremap Q gqap
nnoremap Q gp

" sane movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" ----------------------
"  UI
" ----------------------
set ruler                       " Show cursor pos all the time
set noshowcmd                   " don't display incomplete commands
set nolazyredraw                " don't do this
set number                      " Linenos
set wildmenu                    " turn on wild menu
set wildmode=list:longest,full
set ch=1                        " cli height
set backspace=2                 " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]      " backspace and cursor keys wrap to
set shortmess=filtIoOa          " shorten messages
set report=0                    " tell us about changes
set nostartofline               " don't jump to start of line when scrolling
set esckeys                     " allow cursor keys in insert mode
set foldenable
set foldlevel=2
" set foldlevelstart=2          " sets foldlevel when editing a new buffer
set foldmethod=syntax           " markers are used to specify folds
set foldminlines=0              " allow folding single lines
set foldnestmax=3               " max vold nesting
set formatoptions=
set formatoptions+=c            " format comments
set formatoptions+=r            " continue comments by default
set formatoptions+=o            " make comments when using o or O from comment line
set formatoptions+=q            " format comment with gp
set formatoptions+=n            " recognize numbered lists
set formatoptions+=2            " Use indent from second line of a paragraph
set formatoptions+=l            " Don't break long lines that were already long
set formatoptions+=1            " break before 1-letter words
set history=1000                " long history
set hlsearch                    " highlight searches
set ignorecase                  " Ignore case of search
set incsearch                   " search as pattern is typed
set magic                       " extended regexes
set mouse=a                     " enable mouse always
set noerrorbells                " no bell
set nojoinspaces                " only insert ingle space after a '.', '?' and '! with join cmd
set title                       " show title in window titlebar
set ttyfast                     " Fast tty: send more characters at a time
set undofile                    " Persistent undo
set visualbell                  " don't use audible bell
set wildchar=<TAB>              " Use tab for cli expansion
set wildignore+=*.jpg,*.png,*.gif,*.psd,*.o,*.obj,*.min,*.pyc,*.min.js,*.out,*.gz,*.gpg,*.tar.*
set wildignore+=*/vendor/*,*/node_modules/*,*/.git/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*
" Ignore these files
set suffixes=.bak,~,.swo,.swp,.o,.d,.info,.aux,.log,.dvi,.pdf,.bbl,.bin,.blg,.brf,.cb,.dmg,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo,.pyd,.dll,.prj,.prp

" Vim-only
if !has('nvim')
    set ttymouse=xterm          " Mouse type=xterm
endif

" --------------------------------------

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Remap :W to :w
command W w

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Indent/unindent block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" Toggle folds (<Space>)
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
  
" ZSH
au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh

" LaTeX settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats = 'pdf,dvi'
let g:Tex_DefaultTargetFormat    = 'pdf' 
let g:Tex_CompileRule_pdf = 'latexmk -pdf -bibtex $*'
let g:Tex_Diacritics = 0

" spellang
set spelllang=en_gb
map <silent> <C-p> :setlocal invspell<CR>
imap <silent> <C-p> <ESC>:setlocal invspell<CR>a

" Gist settings
let g:gist_clip_command="xsel --input --clipboard"
let g:gist_detect_filetype=1

" ----------------------------------------
"  Visual cues
" ----------------------------------------

set showmatch                           " matching brackets
set mat=5
set laststatus=2                        " Always show the status line

" ---------------------------------------
"  Strip trailing whitespace
" ---------------------------------------
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <leader>ss :call StripWhitespace ()<CR>

" --------------------------------------
" swapfiles
" --------------------------------------
" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" --------------------------------------
" Solarized
" --------------------------------------
syntax enable
set background=dark
call togglebg#map("<F5>")
colorscheme solarized

let g:solarized_contrast="high"    "default value is normal
" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
let g:solarized_termcolors=256
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1



" -----------------------------------
" pastebin
" -----------------------------------
let g:pastebin_api_dev_key = "8f0cbc6cf0dd0c11d39e13ab896809cb"

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" -----------------------------------
"  Python Mode
" ----------------------------------
let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project  = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep527']
let g:pymode_lint_cwindow = 1
