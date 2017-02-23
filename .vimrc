" -- Variables --
runtime bundle/pathogen/autoload/pathogen.vim

" -- Functionality --
execute pathogen#infect()

" Nerdtree plugin
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Indentation
set autoindent
"set smartindent
set preserveindent
set tabstop=4
set shiftwidth=4
set expandtab ts=4 sw=4 ai
filetype indent on
filetype plugin on

" Code folding
set foldcolumn=0
set foldmethod=indent
set foldlevel=100

" Mouse
set mouse=a

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Key mappings
set pastetoggle=<F3>
inoremap jk <esc>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
"map <f9> :make^M
"map <f10> :!cc %^M
map k <down>
map j <up>
map l <left>
map ; <right>
nmap     <silent> <Space>    za:nohlsearch<CR>

" Splitting
set splitright
set splitbelow
set diffopt=filler,vertical

" Backup
set nobackup

" Other
set scrolloff=5
set backspace=indent,eol,start

" Window title
if $TERM=='screen'
	exe 'set title titlestring=vim:%t%(\ %m%)'
	exe 'set title t_ts=]2;%t\\'
endif

" Wild menu (tab completion)
set wildmenu
set wildmode=full
set wildchar=<Tab>
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>

" File browser
let netrw_browse_split=4

" -- Appearance --

" Text display
set t_Co=256

syntax enable
" let g:solarized_termtrans = 1
" colorscheme jellybeans
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme monokai

"togglebg#map("<F5>")

if has('gui_running')
    set background=light
else
    set background=dark
endif

"syntax on
set number
set numberwidth=5
set showmatch
set linebreak
set showbreak=>
set list
set listchars=tab:>-,trail:.
"colors blackbeauty

"set spell
set display=lastline

" Window size
set equalalways
set textwidth=79
set winminwidth=10
set winwidth=80
set nowrap

" Status line
set laststatus=2
set statusline=[%F]\%([%M%R]%)%=[%c,%l\ of\ %L]
set showcmd
set noruler
set cursorline

" Whole window
set vb t_vb=

" mutt
au BufRead /tmp/mutt-* set tw=72

" vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

let vala_comment_strings = 1
let vala_space_errors = 1

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Java compilation streamline
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

" Ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html

" Octave syntax highlighting
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END

" Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Ruby autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Run npm start from editor
command R !npm start %
