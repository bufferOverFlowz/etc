" prevent vim from emulating vi
set nocompatible    " set explicitly since not set when vimrc sourced with '-u' flag

" use '.vim' directory instead of 'vimfiles' under windows
 if has("win32")
     set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
endif

" *********************************************************************
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" vim-plug - automatic install of plugings for vim-plug
" Don't forget to vim +PlugUpdate. Warning Curl will not run in dos
" ********************************************************************
if !has("win32") 
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.vim/plugged')
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'SirVer/ultisnips'
    " Track the engine.
    Plug 'honza/vim-snippets' 
    "****************************************************************
    " You complete me IDE like functions - don't forget to insall.py
    " Follow install instructions on https://github.com/ycm-core/ycmd
    "****************************************************************
    Plug 'Valloric/YouCompleteMe'
    " Help you Snippets and Youcomplete work together 
    Plug 'ervandew/supertab'
    call plug#end()

    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
endif

" easier to reach than \
let mapleader = " "
" easier to reach than Esc or Ctrl-[
inoremap jk <Esc>

set backspace=indent,eol,start  " make backspace work like 'normal' text editors

" --history
set history=500    " history of commands and searches
set undolevels=500 " changes to be remembered

" --interface appearance
syntax enable    " enable syntax highlighting and allow custom highlighting
set title        " set title to filename and modification status
set number       " show line numbers
set ruler        " always show current position
set showcmd      " show the command being typed
set showmode     " show current mode (insert, visual, etc.)
set laststatus=2 " always show status line

" --searching
set ignorecase " ignore case when searching
set smartcase  " case sensitive only when capital letter in expression
set hlsearch   " highlight search terms
set incsearch  " show matches as they are found

" --feedback
set showmatch   " show matching braces when typed or under cursor
set matchtime=1 " length of time for 'showmatch'

" --redrawing / warnings
set lazyredraw   " don't redraw screen when executing macros
set noerrorbells " no bell for error messages
set visualbell   " use whatever 't_vb' is set to as a bell
set t_vb=        " set to nothing (disable)

" restore 't_vb' since it is reset after the GUI starts
if has("gui_running")
    augroup disable_gui_visualbell
        autocmd!
        autocmd GUIEnter * set t_vb=
    augroup end
endif

" --command-line completion
set wildmenu    " enhanced command-line completion

" --visual theme and appearance
colorscheme desert

if has("gui_running")
    " gVim specific

    " gVim interface modification
    set guioptions-=m " remove menu bar
    "set guioptions-=T " remove toolbar
endif

" --movement / navigation
set scrolloff=5 " scrolling starts 5 lines before window border

" easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --mouse input
"set mouse=a " enable mouse support

" --filetype detection
filetype plugin indent on   " let vim detect filetype and load appropriate scripts

" --character encoding
set encoding=utf-8                             " encoding used within vim
set fileencodings=ucs-bom,utf-8,default,latin1 " encodings to try when editing a file

" --buffer management
set hidden    " allow buffer to be changed without writing to disk
set autoread  " update file when externally modified

" --indenting
set fileformats=unix,dos,mac " try recognizing line endings in this order
set tabstop=8                " width of a tab character in spaces
set softtabstop=4            " defines number of spaces <Tab>/<BS> will insert/remove
set shiftwidth=4             " number of spaces to use for automatic indentation
set expandtab                " use spaces instead of tab characters; to insert real tab, use <C-v><Tab>
set autoindent               " fallback indenting, doesn't interfere with 'filetype indent'; see ':h C-indenting' for comparison

" --copying / pasting
" allow vim commands to copy to system clipboard (*)
" for X11:
"   + is the clipboard register (Ctrl-{c,v})
"   * is the selection register (middle click, Shift-Insert)
set clipboard=unnamed

" use clipboard register when supported (X11 only)
if has("unnamedplus")
    set clipboard+=unnamedplus
endif

" set paste to prevent unexpected code formatting when pasting text
" toggle paste and show current value ('pastetoggle' doesn't)
nnoremap <Leader>p :set paste! paste?<CR>
"set pastetoggle=<Leader>p
