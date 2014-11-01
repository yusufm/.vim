" Vim settings for Yusuf Mohsinally
" 12 Mar 2014
"
" Based on .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012

" ============================================================================
" Installation - plugins, colors, etc.
" ============================================================================

" Wombat - Colorscheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400


" Pathogen
" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"

" Vundle
" Setup Vundle for plugins
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


" Python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode


" ============================================================================
" General settings
" ============================================================================

" Moderned!
set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Set folding off by default
set nofoldenable

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
"" set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again

" Statusline
" 
au InsertEnter * hi StatusLine term=reverse ctermbg=5
au InsertLeave * hi StatusLine term=reverse ctermbg=DarkGray

set laststatus=2

set statusline=         " clear it
set statusline+=%m\     " modified
set statusline+=%t      " filename
set statusline+=%=      " right justified
set statusline+=%l/%c\ %3p%%

" Key bindings
"
" Rebind <Leader> key
let mapleader = ","
" f now activates easymotion search
nmap f <Plug>(easymotion-s)
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


" Quicksave command
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows



" easier moving between tabs
"" map <Leader>n <esc>:tabprevious<CR>
"" map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
"" set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Plugin : Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'git://github.com/davidhalter/jedi-vim'
Bundle 'thanthese/TortoiseTyping'


" Plugin : Pathogen
call pathogen#infect()
call pathogen#helptags()


" ============================================================================
" Python IDE Setup
" ============================================================================

" Plugin : CtrlP
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
" Note: disable rope, since jedi is taking over autocompletion 
let g:pymode_rope = 0
" Other settings
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0


" Settings for jedi-vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#use_splits_not_buffers = "left"
