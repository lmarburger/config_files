" Section: Pathogen

  runtime! autoload/pathogen.vim
  if exists('g:loaded_pathogen')
    call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
  end

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
    "colorscheme ir_black
    colorscheme vividchalk

    " Font
    set gfn=Monaco:h10

    scriptencoding utf-8
    set encoding=utf-8 " Not sure if there's a difference

    " filetype-specific indenting and plugins
    filetype plugin indent on

    " Size the window
    set lines=52 columns=171

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

    " highlight the current cursor line
    set cursorline

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

    " line numbers
    set number
    setlocal numberwidth=5

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

    " Close the active buffer, but keep the split open.
    map <leader>x :Bclose<CR>
    map <leader>X :bd<CR>

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

    " Search with ack
    map <leader>F :Ack<space>

    " Yank from the cursor to the end of the line.
    nnoremap Y y$

    " Mash pinkies to escape.
    imap jj <Esc>

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
    vmap <leader>= :Tabularize equals<CR>
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

" Section: closetag.vim

  let g:closetag_html_style=1

" Section: commands

  " Various useful Ruby command mode shortcuts
  augroup Ruby
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter *.rb
      \ :nmap <leader>r :w<CR>:call Send_to_Screen("ruby " . expand("%") . "\n")<CR>|
    autocmd BufRead,BufNewFile,BufEnter *_test.rb,test_*.rb
      \ :nmap <leader>r :w<CR>:call Send_to_Screen("ruby -Itest -Ilib -rubygems " . expand("%") . "\n")<CR>|
    autocmd BufRead,BufNewFile,BufEnter *_spec.rb
      \ :nmap <leader>r :w<CR>:call Send_to_Screen("rspec " . expand("%") . "\n")<CR>|

    autocmd Filetype eruby source ~/.vim/scripts/closetag.vim
  augroup END

  augroup Cucumber
    autocmd!
    autocmd BufNewFile,BufReadPost,BufEnter *.feature,*.story
      \ set filetype=cucumber|
      \ :nmap <leader>r :w<CR>:call Send_to_Screen("cucumber -r features " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
      \ :nmap <leader>R :w<CR>:call Send_to_Screen("cucumber -r features " . expand("%") . "\n")<CR>|
  augroup END

  " Execute the last command executed in screen.
  :nmap <leader>l :w<CR>:call Send_to_Screen("exec_last_feature_or_test\n")<CR>
  :nmap <leader>L :call Send_to_Screen("!!\n")<CR>

  augroup Vim
    autocmd!

    " Reload vimrc after save.
    autocmd BufWritePost ~/.vimrc so ~/.vimrc

    " Create the directory if it doesn't exist.
    autocmd BufNewFile * silent !mkdir -p $(dirname %)
  augroup END
