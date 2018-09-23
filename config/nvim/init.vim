call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Completion with deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Git Support
Plug 'tpope/vim-fugitive'

" Golang Languae Plugin
Plug 'fatih/vim-go'

" Syntax Highlighting for languages and configs
Plug 'cespare/vim-toml'                        " toml syntax highlighting
Plug 'hashivim/vim-terraform'                  " Terraform syntax highlighting
Plug 'stephpy/vim-yaml'                        " YAML support
Plug 'elzr/vim-json'                           " JSON support
Plug 'wgwoods/vim-systemd-syntax'              " Systemd unit file support
Plug 'editorconfig/editorconfig-vim'



" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Various Plugins
Plug 'itchyny/calendar.vim'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'

" Initialize plugin system
call plug#end()


" -----------------------------------------------------------------------------
" Common settings
" -----------------------------------------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set colorcolumn=81                " highlight the 80th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often

" -----------------------------------------------------------------------------
" neovim specific settings
" -----------------------------------------------------------------------------
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" -----------------------------------------------------------------------------
" Enable mouse if possible
" -----------------------------------------------------------------------------
if has('mouse')
    set mouse=a
endif

" -----------------------------------------------------------------------------
" Allow vim to set a custom font or color for a word
" -----------------------------------------------------------------------------
syntax enable

" -----------------------------------------------------------------------------
" Set the leader button
" -----------------------------------------------------------------------------
let mapleader = ','

" -----------------------------------------------------------------------------
" Autosave buffers before leaving them
" -----------------------------------------------------------------------------
autocmd BufLeave * silent! :wa

" -----------------------------------------------------------------------------
" Remove trailing white spaces on save
" -----------------------------------------------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

" -----------------------------------------------------------------------------
" Center the screen quickly
" -----------------------------------------------------------------------------
nnoremap <space> zz

" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------
set background=dark
colorscheme PaperColor

" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green backgroun with black foreground.
"
" Reference:
" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>

" -----------------------------------------------------------------------------
"  About Searching
" -----------------------------------------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" -----------------------------------------------------------------------------
"  Split buffers
" -----------------------------------------------------------------------------

" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

" -----------------------------------------------------------------------------
" Plugin: Shougo/deoplete.nvim
" -----------------------------------------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" -----------------------------------------------------------------------------
" Plugin: 'itchyny/calendar.vim'
" -----------------------------------------------------------------------------
" Enable Google Calendar integration.
let g:calendar_google_calendar = 1

" Enable Google Tasks integration.
let g:calendar_google_task = 1

" Other options
let g:calendar_first_day = "monday"           " Weeks starts with Monday
let g:calendar_date_endian = "big"            " Format: year / month / day
let g:calendar_date_separator = "-"           " Format: year - month - day
let g:calendar_week_number = 1                " Show week numbers
let g:calendar_view = "days"                  " Set days as the default view

" -----------------------------------------------------------------------------
" Golang // go-vim settings
" -----------------------------------------------------------------------------

