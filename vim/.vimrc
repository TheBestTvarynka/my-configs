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
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

set encoding=UTF-8
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"" call AutoHighlightToggle()

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
let g:gitgutter_set_sign_backgrounds = 1

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

highlight link GitGutterChangeLine DiffText

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16-spacemacs'
" let g:airline_theme='papercolor'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

