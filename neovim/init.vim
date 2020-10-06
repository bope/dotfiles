syntax enable
set number
set noruler
set autoindent
set autowrite
set ruler
set showmode
set smartindent
set smarttab
set expandtab
set norelativenumber
set nobackup
set noswapfile
set nowritebackup
set laststatus=0
set icon
set listchars=tab:\→\ ,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set hlsearch
set incsearch
set linebreak
set shortmess=aoOtI
set foldmethod=manual
set hidden
set history=100
set ttyfast
set list
filetype plugin on

map <silent> <leader><cr> :noh<cr>:redraw!<cr>

set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars in join 
set formatoptions+=1   " don't break a line after a one-letter word

autocmd FileType go setlocal noexpandtab
set omnifunc=syntaxcomplete#Complete


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
map <F1> :set spell!<cr>

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    echo "Don't forget to GoInstallBinaries if you're doing Go dev."
endif

if filereadable(expand("~/.config/nvim/autoload/plug.vim"))
    call plug#begin('~/.config/nvim/plugged')
    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'morhetz/gruvbox'
    call plug#end()
    " theme
    colorscheme gruvbox
    set background=dark
    set cursorline
    " golang
    let g:go_fmt_fail_silently = 0 " let me out even with errors
    let g:go_fmt_command = 'goimports' " autoupdate import
    let g:go_fmt_autosave = 1
    let g:go_gopls_enabled = 1
    au FileType go nmap <leader>t :GoTest!<CR>
    au FileType go nmap <leader>v :GoVet!<CR>
    au FileType go nmap <leader>b :GoBuild!<CR>
    au FileType go nmap <leader>i :GoInstall!<CR>
    au FileType go nmap <leader>l :GoMetaLinter!<CR>
else
    autocmd vimleavepre *.go !gofmt -w %
endif


