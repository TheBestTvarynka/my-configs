" set laststatus=2
set number
"" set relativenumber
"" set number relativenumber
set scrolloff=3
"" set showtabline=2
set statusline=%t%m%r%h%w\ %10{&encoding}\ %20b,0x%B\ %10l,%v\ %10p%%
syntax on
" autocompletion mode(list all and complete to general on first <Tab> then full completion)
set wildmode=list:longest,full
set wildmenu
set wildcharm=<Tab>

" ctermbg colors: https://jonasjacek.github.io/colors/
set hlsearch
hi Search ctermbg=153
hi Search ctermfg=62

set cursorline
hi cursorline cterm=none term=none
" 8 23 59 66 109 236
highlight CursorLine guibg=#495462 ctermbg=236

" Clear the search buffer when hitting ctrl-n
function! MapC_N()
  nnoremap <c-n> :nohlsearch<cr>
endfunction
call MapC_N()
nnoremap <leader><leader> <c-^>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
" function! AutoHighlightToggle()
  " let @/ = ''
  " if exists('#auto_highlight')
    " au! auto_highlight
    " augroup! auto_highlight
    " setl updatetime=2000
    " "" echo 'Highlight current word: off'
    " return 0
  " else
    " augroup auto_highlight
      " au!
      " au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    " augroup end
    " setl updatetime=500
    " "" echo 'Highlight current word: ON'
    " return 1
  " endif
" endfunction

syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" search for results while typing
Plug 'haya14busa/incsearch.vim'
" autocomplit
" Plug 'ycm-core/YouCompleteMe'

" Another elegant statusline for vim
" Plug 'liuchengxu/eleline.vim'

" Underlines the word under the cursor
" Plug 'itchyny/vim-cursorword'

Plug 'rust-lang/rust.vim'

call plug#end()

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"" call AutoHighlightToggle()
