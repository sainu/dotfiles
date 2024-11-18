"--------------
" vim-plug
"--------------
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
" Use the catppuccin theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" AI complement. Execute ':Copilot setup' to set up.
Plug 'github/copilot.vim'

call plug#end()

"--------------
" Backups
"--------------
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

"--------------
" Bell
"--------------
" Disable error bells
set noerrorbells

"--------------
" Clipboard
"--------------
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

"--------------
" Color
"--------------
" Enable syntax highlighting
syntax on
" Use the hybrid theme
set background=dark
colorscheme catppuccin
" Highlight current line
set cursorline

"--------------
" Config
"--------------
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

"--------------
" Editor
"--------------
" Don’t add empty newlines at the end of files
set binary
set noeol
" Enable line numbers
set number
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set list
" Show the cursor position
set ruler
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling eight lines before the horizontal window border
set scrolloff=8
" Start scrolling 16 characters before the vertical window border
set sidescrolloff=16
set sidescroll=1
" Strip trailing whitespace
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Show ZenkakuSpace
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
" Handle indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
" Save file
nnoremap <leader>w :w<CR>
" Split window
noremap <leader>v :<C-u>vsplit<CR><C-w>l
noremap <leader>s :<C-u>split<CR><C-w>j

"--------------
" Encoding
"--------------
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

"--------------
" Key
"--------------
" Allow backspace in insert mode
set backspace=indent,eol,start
" Change mapleader
let mapleader=","

"--------------
" Mouse
"--------------
" Enable mouse in all modes
set mouse=a

"--------------
" Search
"--------------
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Don’t reset cursor to start of line when moving around.
set nostartofline

"--------------
" Terminal
"--------------
" Optimize for fast terminal connections
set ttyfast

"--------------
" View
"--------------
" Enhance command-line completion
set wildmenu
" Always show status line
set laststatus=2
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
