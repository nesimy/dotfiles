execute pathogen#infect()

set exrc
set secure
set numberwidth=3
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent
set smartindent
set showmatch
set number
set wrap
set nocompatible
set ignorecase
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

filetype plugin on
filetype indent on
syntax enable
colorscheme solarized
set background=dark
set hidden
set backspace=indent,eol,start

let maplocalleader = ","

" Genereal mappings
" map tab to tabnext
nnoremap <tab> gt

" edit ~/.vimrc quickly
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" map jk to escape 
inoremap jk <esc>
" to Uppercase
inoremap <leader>u <esc>lviWUi
nnoremap <leader>u viWU

" surround word in double quotes
nnoremap <leader>" bi"<esc>ea"<esc>
vnoremap <leader>" v`>a"<esc>`<i"<esc>

set pastetoggle=<localleader>p

augroup C
autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
    au BufNewFile * silent! 0r ~/.vim/skeleton/template.%:e
    " comment shortcut (TODO: uncomment)
    autocmd FileType c nnoremap <buffer> <localleader>c 0i//<esc>
    autocmd FileType c inoremap <buffer> <localleader>c <esc>0i//
    autocmd FileType c vnoremap <buffer> <localleader>c :s/^/\/\//g<cr>

    autocmd FileType c setlocal nowrap
    
    " if snippet
    autocmd FileType c :iabbrev iff if (){<cr>}<left><left>
    autocmd FileType c setlocal tabstop=2
    autocmd FileType c setlocal expandtab
    autocmd FileType c setlocal shiftwidth=2
    autocmd FileType c setlocal softtabstop=2
augroup END

augroup Python
    autocmd!
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal expandtab
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal softtabstop=4
augroup END

augroup wrap
autocmd!
autocmd Filetype html setlocal nowrap
autocmd Filetype sh setlocal nowrap
augroup END

augroup other_config
autocmd!
autocmd Filetype text setlocal spell spelllang=en_us
autocmd Filetype notes :iab xdate [<c-r>=strftime("%d-%m %H:%M")<cr>]  " insert today's date
augroup END 

" ========== Vim-airline ===========
" Show statusline always
set laststatus=2
" Do not show 'insert' 'visual' 'normal' modes, airline already shows them
set noshowmode
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
let g:Powerline_symbols='unicode'
set term=xterm-256color

if has('gui_running')
"  set guifont=Droid\ Sans\ Mono\ for\ Powerline\
"  set guifont=Sauce\ Code\ Powerline\ Bold\
"  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\
  set guifont=DejaVu\ Sans\ Mono\ Bold\ for\ Powerline\
  set transparency=5        " set transparent window
  set guioptions=egmrt  " hide the gui menubar
endif

" airline themes I liked: 
" jellybeans, lucius, solarized, tomorrow, wombat, zenburn
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 

" show tabs
let g:airline#extensions#tabline#show_buffers = 0


if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:Powerline_symbols = 'fancy'
  
"" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = " "
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"let g:airline_mode_map = {}
"let g:airline_mode_map.n  = 'N'

" ========== NERDTree ==================
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <C-n> :NERDTreeToggle<cr>

" ========== Vim-Notes =================
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.note'

" ========== Codeforces ================
let g:CodeForcesDomain = 'com'
let g:CodeForcesShowUnofficial = 1
let g:CodeForcesToken = "ba190a3d956a700d64f09a76dc9147ae"
let g:CodeForces39ce7 = "CFrnzTBI"
let g:CodeForcesJSessionId = "D7279B8DE0DEC876EDD278CEE714CD04-n1"
let g:CodeForcesXUser = "d04916d39bfbd89689771c150af32689b2ae78502ba86d001a54cbbbc282400b48e803eb5785d5c1"
let g:CodeForcesUserAgent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"

let g:CodeForcesCommandStandings = 'badd'
let g:CodeForcesCommandLoadTask = 'badd'
let g:CodeForcesCommandSubmission= 'badd'

let g:CodeForcesUsername = 'Imprefect'
let g:CodeForcesTemplate = '/home/nesim/p/codeforces/template.py'
let g:CodeForcesLang = 'en'

nmap <leader>cfround <ESC>:CodeForcesSetRound
nmap <leader>cfparse <ESC>:CodeForcesParseContest<CR>
nmap <leader>cfl <ESC>:CodeForcesLoadTask

