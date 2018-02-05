" The struture of this file follows the order of vim options list :options

" important {{{
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
" }}}

" plugins {{{
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" file navigation
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 't9md/vim-choosewin'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'MattesGroeger/vim-bookmarks' 
Plugin 'simeji/winresizer'

" tags
Plugin 'majutsushi/tagbar'

" completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rdnetto/YCM-Generator'

" coding
Plugin 'henrik/vim-indexed-search'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-conflicted'
" Plugin 'jeaye/color_coded'
Plugin 'xuhdev/SingleCompile'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rizzatti/dash.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'

" writing
" Plugin 'lervag/vimtex'
Plugin 'plasticboy/vim-markdown'

" async
Plugin 'skywind3000/asyncrun.vim'

" status line
Plugin 'vim-airline/vim-airline'

" buffer
Plugin 'fholgado/minibufexpl.vim'
Plugin 'moll/vim-bbye'
Plugin 'BufOnly.vim'

" colorscheme
Plugin 'freeo/vim-kalisi'

call vundle#end()
filetype on
" }}}

" moving around, searching and patterns {{{
set path=.,**
set incsearch
set magic
set ignorecase
set smartcase
" solve ESC delay
set timeoutlen=1000 ttimeoutlen=0
" load directory specific .vimrc
set exrc
set secure
set noautochdir
" }}}

" displaying text {{{
set scrolloff=3
set number
set relativenumber
" set linebreak
set foldenable
set foldmethod=marker
set lazyredraw
set nowrap
highlight ColorColumn ctermbg=gray
set colorcolumn=81
" }}}

" syntax, highlighting and spelling {{{
filetype plugin indent on
syntax enable
set hlsearch
set cursorline
set background=dark
set shortmess=a
" }}}

" gui and mouse {{{
set showcmd
set t_Co=256
set ttymouse=xterm2
" set bg=light
set bg=dark
set mouse=a
" colorscheme valloric
colorscheme kalisi
if has('gui_running')
    set guioptions+=a
    set guioptions-=T
    set guioptions-=m
endif
" auto open quickfix window when something adds to it
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END
" }}}

" editing {{{
set nobackup
set clipboard=unnamed
set textwidth=80
set backspace=indent,eol,start
set showmatch
set autowrite " auto save when make
set noswapfile
" }}}

" tabs and indenting {{{
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set nosmartindent
set autoindent
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.cu,*.cuh set syntax=cpp
" }}}

" encoding {{{
set encoding=utf-8
set fileencoding=utf-8
" }}}

" command line {{{
set wildmenu
" }}}

" mapping {{{
let mapleader=","
let maplocalleader="\\"

" remap begin/end of line
nnoremap B ^
nnoremap E $

" call ag
nnoremap <leader>a :Ack! -Q<space>

" call asyncrun
nnoremap <leader>y :AsyncRun<space>
nnoremap <leader>m :AsyncRun make<CR>

" esc
inoremap jk <esc>:w<CR>

" highlight without moving cursor
nnoremap <leader>w :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap <leader>gw :let @/ = expand('<cword>')\|set hlsearch<C-M>

" save file
nnoremap <leader>s :w<CR> 
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" format paragraph
nnoremap <leader>f :normal gwip<CR>

" toggle folding
nnoremap <space> za

" clear highlight
nnoremap <leader><space> :noh<CR>

" edit vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>

" buffers
nnoremap <leader>n :bn!<CR>
nnoremap <leader>p :bp!<CR>
nnoremap <leader>d :Bdelete<CR>

" navigate between windows
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" movement in insert mode
inoremap <c-l> <right>
inoremap <c-h> <left>


" }}}

" plugin settings {{{

" NERDTree
let NERDTreeIgnore = ['\.*pyc$']

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

" airline
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" winresizer
let g:winresizer_start_key = '<C-X>'
let g:winresizer_vert_resize = 5
let g:winresizer_horiz_resize = 3

" airline
set laststatus=2

" ctrlp
let g:ctrlp_working_path_mode='0'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git)$',
    \ 'file': '\v\.(pyc|exe|so|dll|jpg|png|bmp|gif)$',
    \ }

" vim-multiple-cursors
let g:multi_cursor_exit_from_insert_mode=0

" MBE explorer
nnoremap <F4> :MBEToggle<CR>
hi link MBEVisibleActiveNormal Special
hi link MBEVisibleNormal Underlined
hi link MBEVisibleChanged Underlined

" Tagbar 
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

" NERDTree
nnoremap <F3> :NERDTreeTabsToggle<CR>

" SingleCompile
nnoremap <leader>b :AsyncRun make<CR>
nnoremap <leader>r :SCCompileRun<CR>

" Dash
nnoremap <leader>D :Dash<CR>

" " YCM
nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_confirm_extra_conf=0
let g:ycm_auto_trigger = 1
set completeopt-=preview
let g:ycm_preview_to_completeopt=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_show_diagnostics_ui = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" vimtex
" nnoremap <leader>B :VimtexCompile<CR>:VimtexView<CR>
" nnoremap <leader>xv :VimtexView<CR>

" let g:vimtex_latexmk_continuous=1
" let g:vimtex_quickfix_mode=2
" let g:vimtex_quickfix_open_on_warning=0
" let g:vimtex_latexmk_options='-xelatex -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
" if has("win32")
"     let g:vimtex_view_general_viewer='SumatraPDF'
"     let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
"     let g:vimtex_view_general_options_latexmk='-reuse-instance'
" elseif has("unix")
"     let g:vimtex_view_general_viewer='qpdfview'
"     let g:vimtex_view_general_options='--unique @pdf\#src:@tex:@line:@col'
"     let g:vimtex_view_general_options_latexmk='--unique'
" endif

" let g:vimtex_view_general_callback = 'ViewerCallback'
" function! ViewerCallback(status) dict
"     if a:status
"         VimtexView
"     endif
" endfunction

" }}}

" other functions {{{ 

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type <leader>h to toggle highlighting on/off.
nnoremap <leader>h :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" auto source vimrc
augroup ReloadVimrc " {
    au!
    au BufWritePost ~/.vimrc source ~/.vimrc
    au BufWritePost .vimrc source .vimrc
augroup END " }

" hard text wrap in Tex
let g:tex_flavor='latex'
autocmd FileType tex :setlocal formatoptions+=mMB

" set prototxt filetype
autocmd BufRead,BufNewFile *.prototxt set ft=conf
autocmd BufRead,BufNewFile *.pt set ft=conf

" dollar in math
autocmd FileType tex inoremap $ $$<left>

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowrite (file is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif

" }}}

