" Section: Pathogen

  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
  call pathogen#helptags()

" Section: configuration

  " Pick up local vimrc files
  set exrc

  " Syntax highlighting
  set nocompatible
  syntax on

  " Wrap lines on word break
  set linebreak

  " Let me hide modified buffers
  set hidden

  " Theme
  colorscheme vividchalk

  " Font
  set gfn=Monaco:h10

  scriptencoding utf-8
  set encoding=utf-8 " Not sure if there's a difference

  " filetype-specific indenting and plugins
  filetype plugin indent on

  " Set the command window to be 2 lines tall.
  set cmdheight=2

  " Set wrap width
  set textwidth=80

  " show the best match so far as search strings are typed
  set incsearch

  " highlight search results
  set hlsearch

  " Ignore case when searching.
  set ignorecase
  set smartcase

  set visualbell

  " flashes matching brackets and parenthesis
  set showmatch

  " Tabs should be 2 spaces wide.
  set shiftwidth=2
  set tabstop=2

  " Convert a <Tab> to <space>s
  set expandtab

  " Helps with backspacing expanded tabs
  set smarttab

  " scroll off-screen 3 lines at a time
  set scrolloff=3

  " Enable tab completion for commands
  " first tab shows matches and next tab cycles through matches
  set wildmenu
  set wildmode=list:longest,full

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " filename
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%m%r%w " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " enable setting title
  set title

  " configure title to look like: /path/to/file
  set titlestring=%-25.55F\ %a%r%m titlelen=70

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " Hide MacVim's toolbar by default
  set guioptions-=T

  " Don't use double spaces when joining.
  set nojoinspaces


" Section: MacVim specific settings

  if has("gui_macvim")

    " highlight the current cursor line
    set cursorline

    " Size the window
    set lines=70 columns=191
    set cc=+1,+2
    hi ColorColumn guibg=#151515

  endif


" Section: matchit
  :source ~/.vim/plugin/matchit.vim


" Section: bufexplorer

  " Hide default help
  let g:bufExplorerDefaultHelp=0


" Section: NERDTree

  " Hide default help
  let NERDTreeQuitOnOpen=1


" Section: bindings

  " Set the leader to , instead of \
  let mapleader = ","

  " Toggle between two and three columns.
  map <leader>2 :set columns=191<cr>
  map <leader>3 :set columns=287<cr>

  " Close the active buffer, but keep the split open.
  map <leader>x :Bclose<CR>
  map <leader>X :bd<CR>

  " Shortcut for open Gundo
  nnoremap <leader>u :GundoToggle<CR>

  " insert hashrocket
  imap <C-l> <Space>=><Space>

  " toggle comments
  nmap <D-/> ,c<space>
  vmap <D-/> ,c<space>
  imap <D-/> <C-O>,c<space>

  " toggle file browser
  map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

  " no highlight
  nmap <leader>nn :noh<CR>

  " Check spelling
  nmap <leader>S :set spell<CR>]s
  nmap <leader>ns :set nospell<CR>

  " Search with ack
  map <leader>a :Ack<space>

  " Yank from the cursor to the end of the line.
  nnoremap Y y$

  " Mash pinkies to escape.
  "imap jj <Esc>

  " Window splitting mappings
  nmap <leader>v :vsplit<CR><C-w><C-w>
  nmap <leader>s :split<CR> <C-w><C-w>

  " Switch to previous buffer
  nmap <leader>w <C-w>p

  " Fix navigation to work when { is not in the first column
  map [[ ?{<CR>w99[{
  map ][ /}<CR>b99]}
  map ]] j0[[%/{<CR>
  map [] k$][%?}<CR>

  " Switching buffers
  nmap <tab> :tabnext<cr>
  nmap <s-tab> :tabprevious<cr>

  " Quickly edit vimrc
  map \v :sp ~/.vimrc<CR><C-W>_

  " Line up stuff in visual mode
  vmap <leader>: :Tabularize first_colon<CR>
  "vmap <leader>L :Tabularize colon<CR>
  vmap <leader>l :Tabularize hash_rocket<CR>
  vmap <leader>= :Tabularize first_equals<CR>
  vmap <leader>' :Tabularize first_single_quote<CR>
  vmap <leader>" :Tabularize first_double_quote<CR>
  vmap <leader>{ :Tabularize first_left_stash<CR>
  vmap <leader>} :Tabularize first_right_stash<CR>
  vmap <leader>\| :Tabularize bar<CR>

  " Git
  nmap <leader>gs :Gstatus<CR>
  nmap <leader>gc :Gcommit<CR>
  nmap <leader>gd :Gdiff<CR>

  nmap <leader>t :tabe<CR>:Bclose<CR>

  " Random mappings to convert from HAML
  nmap <leader>hh s<<ESC>V:s/\./ /g<CR>Wiclass="<ESC>A"><ESC>/^\s*\zs%<CR>
  nmap <leader>hd s<div class="<ESC>A"><ESC>
  nmap <leader>hb s<<ESC>f s><ESC>


" Section: closetag.vim

  let g:closetag_html_style=1

" Section: commands

  " Various useful Ruby command mode shortcuts
  augroup Ruby
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter *.rb
      \ :nmap <leader><leader> :w<CR>:call Send_to_Screen("ruby " . expand("%"))<CR>|
    autocmd BufRead,BufNewFile,BufEnter *_test.rb,test_*.rb
      \ :nmap <leader><leader> :w<CR>:call Send_to_Screen("ruby -Itest -Ilib -rubygems " . expand("%"))<CR>|
    autocmd BufRead,BufNewFile,BufEnter *_spec.rb
      \ :nmap <leader><leader> :w<CR>:call Send_to_Screen("ruby -Ispec -Ilib -rubygems " . expand("%"))<CR>|
    "autocmd BufRead,BufNewFile,BufEnter *_spec.rb
      "\ :nmap <leader><leader> :w<CR>:call Send_to_Screen("rspec " . expand("%"))<CR>|
      "\ nmap <leader>f ?\<it\\|context\\|scenario\\|feature\><CR>$gEa, :focused => true<ESC>``:noh<CR>|
      "\ nmap <leader>F ?\<it\\|context\\|scenario\\|feature\><CR>$4gE3dE``:noh<CR>


    autocmd Filetype eruby source ~/.vim/scripts/closetag.vim
  augroup END

  augroup CoffeeScript
    autocmd!
    autocmd BufNewFile,BufReadPost,BufEnter *.coffee
      \ imap <C-l> <Space>->
    autocmd BufLeave *.coffee
      \ imap <C-l> <Space>=><Space>
  augroup END

  augroup Cucumber
    autocmd!
    autocmd BufNewFile,BufReadPost,BufEnter *.feature,*.story
      \ set filetype=cucumber|
      \ :nmap <leader><leader> :w<CR>:call Send_to_Screen("bundle exec cucumber -r features " . expand("%") . "\:<C-R>=line(".")<CR>")<CR>|
      \ :nmap <leader>R :w<CR>:call Send_to_Screen("bundle exec cucumber -r features " . expand("%"))<CR>|
  augroup END

  augroup JST
    autocmd!
    autocmd BufNewFile,BufReadPost,BufEnter *.jst
      \ set filetype=html
  augroup END

  " Execute the last command executed in screen.
  :nmap <leader>l :w<CR>:call Send_to_Screen("exec_last_feature_or_test")<CR>
  :nmap <leader>L :w<CR>:call Send_to_Screen("!!")<CR>

  augroup Vim
    autocmd!

    " Reload vimrc after save.
    autocmd BufWritePost ~/.vimrc so ~/.vimrc

    " Create the directory if it doesn't exist.
    autocmd BufNewFile * silent !mkdir -p $(dirname %)
  augroup END
