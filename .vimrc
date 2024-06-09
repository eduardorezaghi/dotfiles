let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Base VIM configuration.


set nocompatible " Use Vim settings, rather than Vi settings
set softtabstop=2 " Indent by 2 spaces when hitting tab
set shiftwidth=4 " Indent by 4 spaces when auto-indenting
set tabstop=4 " Show existing tab with 4 spaces width


set cursorline " Highlight the current line
"set cursorcolumn Highlight the current column
highlight CursorLine guibg=lightblue ctermbg=lightgrey

set history=1000 " Keep a history of 1000 commands
set ruler " Show the cursor position all the time
set relativenumber " Show line numbers relative to the current line
set mouse=a " Enable mouse support
set autoindent " Automatically indent new lines
set nobackup " Disable backup files
set laststatus=2 " Always show the status line
set wildmenu " Enable enhanced command-line completion

" Search options
set incsearch " Incremental search
set hlsearch " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching, unless an uppercase letter is used

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific plugins and indenting

" Persistent undo
set undodir=~/.vim/undodir
set undofile


" Vim-plug.
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes



Plug 'github/copilot.vim'



" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
