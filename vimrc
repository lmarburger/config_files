" Section: Pathogen

  runtime! autoload/pathogen.vim
  if exists('g:loaded_pathogen')
    call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
  end

" Section: configuration

    " Syntax highlighting
    set nocompatible
    syntax on

    " Wrap lines on word break
    set linebreak

    " Let me hide modified buffers
    set hidden

    " Theme
    colorscheme ir_black

    " Font
    set gfn=Monaco:h10

    scriptencoding utf-8
    set encoding=utf-8 " Not sure if there's a difference

    " filetype-specific indenting and plugins
    filetype plugin indent on

    " Size the window
    set lines=51 columns=169

    " Set wrap width
    :set textwidth=80

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
    set statusline+=%h%1*%m%r%w%0* " flag
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
    
    " search next/previous and center on page
    nmap n nzz
    nmap N Nzz
    nmap * *Nzz
    nmap # #nzz

    " Search with ack
    map <leader>F :Ack<space>

    " Yank from the cursor to the end of the line.
    nnoremap Y y$

    " Bind escape to jj
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
    nmap <tab> :bn<cr>
    nmap <s-tab> :bp<cr>

    " Quickly edit vimrc
    map \v :sp ~/.vimrc<CR><C-W>_

    " Line up stuff in visual mode
    vmap =  :!$HOME/.vim/bin/line-up-equals<CR>
    vmap ,  :!$HOME/.vim/bin/line-up-commas<CR>
    vmap \| :!$HOME/.vim/bin/tableify<CR>


" Section: commands

  augroup HighlightPeskyTabs
    autocmd!
    autocmd BufRead,BufNewFile *
        \ syn match Tab "\t" |
        \ syn match TrailingWS "\s\+$" |
        \ if &background == "dark" |
        \   hi def Tab ctermbg=red guibg=#660000 |
        \   hi def TrailingWS ctermbg=red guibg=#660000 |
        \ else |
        \   hi def Tab ctermbg=red guibg=#ffdddd |
        \   hi def TrailingWS ctermbg=red guibg=#ffdddd |
        \ endif
  augroup END

  " Various useful Ruby command mode shortcuts
  augroup Ruby
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter *_test.rb,test_*.rb
      \ :nmap <leader>R V:<C-U>!$HOME/.vim/bin/ruby-run-focused-unit-test % <C-R>=line("'<")<CR>p \| tee /tmp/output.txt<CR>
    autocmd BufRead,BufNewFile,BufEnter *.rb
      \ :nmap <leader>r :<C-U>!ruby % \| tee /tmp/output.txt<CR>|
      \ :vmap b :!beautify-ruby<CR>
    autocmd BufRead,BufNewFile,BufEnter *_spec.rb
      \ :nmap <leader>r :<C-U>!spec % \| tee /tmp/output.txt<CR>
  augroup END

  augroup Cucumber
    autocmd!
    autocmd BufNewFile,BufReadPost,BufEnter *.feature,*.story
      \ set filetype=cucumber|
      \ :nmap <leader>r :call Send_to_Screen("cucumber -r features " . expand("%") . "\n")<CR>|
      \ :nmap <leader>R :call Send_to_Screen("cucumber -r features " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
  augroup END

  " Execute the last command executed in screen.
  :nmap <leader>l :call Send_to_Screen("!cucumber\n")<CR>
  :nmap <leader>L :call Send_to_Screen("!!\n")<CR>

  augroup Markdown
    autocmd!

    " Tabs should be 4 spaces wide in Markdown
    autocmd BufRead,BufNewFile,BufEnter *.md set ai formatoptions=tcroqn2 comments=n:&gt tabstop=4 shiftwidth=4
    autocmd BufLeave *.md set tabstop=2 shiftwidth=2
  augroup END

  augroup Vim
    autocmd!

    " Reload vimrc after save.
    autocmd BufWritePost ~/.vimrc so ~/.vimrc
  augroup END
