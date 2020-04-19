" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
" syntax
  call dein#add('othree/html5.vim')
  call dein#add('othree/yajs.vim')
  call dein#add('othree/jsdoc-syntax.vim')
  call dein#add('elzr/vim-json')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('skwp/vim-html-escape')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('ap/vim-css-color')
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})
  call dein#add('rhysd/vim-grammarous')
  call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('itmammoth/doorboy.vim')
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('chemzqm/vim-easygit')
  call dein#add('jreybert/vimagit', {'on_cmd': ['Magit', 'MagitOnly']})
  call dein#add('sgeb/vim-diff-fold')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('junegunn/gv.vim')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('neomake/neomake', {'on_cmd': 'Neomake'})
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('sbdchd/neoformat')
  call dein#add('scrooloose/syntastic')
  call dein#add('cespare/vim-toml', {'on_ft': 'toml'})
" deoplete stuff
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/deol.nvim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('ctrlpvim/ctrlp.vim')

  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('chemzqm/denite-git')
  call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('ujihisa/neco-look')
  call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
  call dein#add('zchee/deoplete-jedi')
  call dein#add('junegunn/limelight.vim')
  call dein#add('Konfekt/FastFold')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('honza/vim-snippets')
  call dein#add('mhinz/vim-sayonara')
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim')
  call dein#add('pocari/vim-denite-gists')
  call dein#add('vim-scripts/SyntaxRange')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('MartinLafreniere/vim-PairTools')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('junegunn/gv.vim')
  call dein#add('chemzqm/denite-git')
  call dein#add('sjl/vitality.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  call dein#add('cocopon/iceberg.vim')
  call dein#add('mklabs/split-term.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('vim-jp/vimdoc-ja', {'on_ft': 'help'})
  call dein#add('mhinz/vim-signify')
  call dein#add('osyo-manga/vim-precious')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('dag/vim-fish')
  call dein#add('ponko2/deoplete-fish')
  call dein#add('fishbullet/deoplete-ruby')
  call dein#add('padawan-php/deoplete-padawan')
  call dein#add('kana/vim-submode')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on
" }}}

" System Settings  ----------------------------------------------------------{{{
  set modifiable
  set write
  set termguicolors
  set noswapfile
  filetype on
  set number
  set numberwidth=1
  set tabstop=2 shiftwidth=2 expandtab
  set wildmenu
  set wildmode=full
  set autoread
  set laststatus=2
  set spell
  set cursorline
  set cursorcolumn
  set autoindent
  set cmdheight=1
  set list
  set title
  set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
  set showmatch " 括弧の対応関係を一瞬表示する
  "カーソルを行頭，行末で止まらないようにする
  set whichwrap=b,s,h,l,<,>,[,]
  set backspace=indent,eol,start
  set listchars=tab:»-,trail:-,nbsp:%,eol:↲
  set helplang=ja,en
  set noshowmode
  set encoding=utf-8
  set ambiwidth=double
  set ttimeout
  set ttimeoutlen=50
" }}}

 " System mappings  ----------------------------------------------------------{{{

  nnoremap s <Nop>
  nnoremap sj <C-w>j
  nnoremap sk <C-w>k
  nnoremap sl <C-w>l
  nnoremap sh <C-w>h
  nnoremap sJ <C-w>J
  nnoremap sK <C-w>K
  nnoremap sL <C-w>L
  nnoremap sH <C-w>H
  nnoremap sn gt
  nnoremap sp gT
  nnoremap sr <C-w>r
  nnoremap s= <C-w>=
  nnoremap sw <C-w>w
  nnoremap so <C-w>_<C-w>|
  nnoremap sO <C-w>=
  nnoremap sN :<C-u>bn<CR>
  nnoremap sP :<C-u>bp<CR>
  nnoremap st :<C-u>tabnew<CR>
  nnoremap sT :<C-u>Unite tab<CR>
  nnoremap ss :<C-u>sp<CR>
  nnoremap sv :<C-u>vs<CR>
  nnoremap sq :<C-u>q<CR>
  nnoremap sQ :<C-u>bd<CR>
  nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
  nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

  call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
  call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
  call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
  call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
  call submode#map('bufmove', 'n', '', '>', '<C-w>>')
  call submode#map('bufmove', 'n', '', '<', '<C-w><')
  call submode#map('bufmove', 'n', '', '+', '<C-w>+')
  call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"}}}"

" Themes, Commands, etc  ----------------------------------------------------{{{
  syntax on
  colorscheme iceberg
  let g:OceanicNext_italic = 1
"}}}

" vim-airline ---------------------------------------------------------------{{{

  let g:airline_powerline_fonts=1
  let g:airline_theme='iceberg'
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
  let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
  let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
  let g:airline#extensions#tabline#show_splits = 0

"}}}

" Deoplete ------------------------------------------------------------------{{{

" enable deoplete
  call deoplete#enable()
  let g:echodoc_enable_at_startup=1

"}}}

" Denite ------------------------------------------------------------------{{{

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts',
              \ ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
"}}}

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'
let g:node_host_prog = '~/.nvm/versions/node/v10.20.0/bin/neovim-node-host'

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
set t_Co=256

autocmd FileType fish compiler fish|setlocal textwidth=79|setlocal foldmethod=expr

" ==========================================
" Ruby
" ==========================================
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2

