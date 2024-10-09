call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-monokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'wikitopian/hardmode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rktjmp/lush.nvim'
Plug 'alligator/accent.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'mfussenegger/nvim-dap'
Plug 'airblade/vim-rooter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'puremourning/vimspector'

call plug#end()

set nocompatible
set tags=./tags,tags;$HOME
set mouse=a
set noshowmode
imap jj <Esc>

syntax on
filetype plugin indent on

" indentation
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set tabstop=4 shiftwidth=4 expandtab smarttab
set scrolloff=8
set tw=0 wm=0
au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0

set incsearch hlsearch showmatch
set number relativenumber

" bash-like TAB completion
set wildmode=longest,list

" Navigate through completion variants using ← and →
set wildmenu

" Case insensitive search if all lowercase
set ignorecase smartcase

" Apply rename to all matches in line
set gdefault

" Show unprintable chars
set list
"set listchars=tab:▹\ ,eol:¬
"set listchars=tab:→\ ,eol:¬
"set listchars=tab:\:\ ,eol:¬
"set listchars=tab:⁞\ ,eol:¬
set listchars=tab:⁞\
"set lcs+=space:·

set termguicolors
set background=dark
colorscheme kanagawa-dragon
"colorscheme zenbones
"colorscheme base16-default-dark
"colorscheme noirblaze
"colorscheme 256_noir
"colorscheme railscasts
"colorscheme solarized8_dark
"colorscheme zenburn
"colorscheme molokai
"colorscheme seoul256-light
"colorscheme gruvbox
"colorscheme accent

" enable Normal mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Highlight extra whitespaces at the end
highlight ExtraWhitespace ctermbg=red guibg=red
au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Use Ag as default grep if available
"if executable('ag')
"	set grepprg=ag\ --nogroup\ --nocolor\ --column
"	set grepformat=%f:%l:%c:%m
"	command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright
"	copen
"endif

 " vim-airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
"let g:airline_theme='solarized'

" indent-guides
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_space_guides = 1
"let g:indent_guides_enable_on_vim_startup = 1
"hi IndentGuidesOdd  guibg=#282a36 ctermbg=235
"hi IndentGuidesEven guibg=#383a46 ctermbg=236

" GLSL syntax
autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl,*.rgen,*.comp,*.rchit,*.rahit,*.rmiss set ft=glsl

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_type_glsl = {
    \ 'ctagstype' : 'c',
    \ 'kinds' : [
        \ 'h:header files:1:0',
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 's:structs',
        \ 'u:unions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'f:functions',
        \ '?:unknown',
    \ ],
\ }

" S P E E D
let g:airline_highlighting_cache=1
set ttyfast
set lazyredraw

" CoC
" set tagfunc=CocTagFunc
inoremap <silent><expr> <c-sopace> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" FZF
nmap <C-P> :Files<CR>
nnoremap <C-g> :Ag<Cr>

" move among buffers with CTRL
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>

"NERD Tree configuration
autocmd BufEnter * :lchdir %:p:h
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

set tags=./tags;
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
  \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui']
