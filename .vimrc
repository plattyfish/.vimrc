colorscheme ron 

set cmdheight=6
set laststatus=2
set number
set spell
set incsearch
set hlsearch
set showcmd
set wildmenu
set foldenable
set textwidth=70
set showcmd
set statusline+=%F\ %l\:%c
set wrap
set linebreak
set nolist
set wrapmargin=3
au BufRead,BufNewFile * setlocal textwidth=70
set ignorecase

"For Stardict
let g:stardict_split_horizontal = 0


" Ready for typing the word in
    nnoremap <leader>sw :StarDict<Space>
	" Lookup the word under cursor
	nnoremap <leader>sc :StarDictCursor<CR>



" for vimwiki
set nocompatible
filetype plugin on
syntax on

"To enable plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" List of Plugins
call plug#begin('~/.vim/bundle')
Plug 'phongvcao/vim-stardict'

Plug 'vimwiki/vimwiki'

call plug#end()


" jk is escape
inoremap jk <esc>

"--FOLDS--



"show buffers with \bb
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <leader>bb :buffers<cr>:b<space>

"underline
function! s:Underline(chars)
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

"Links to files
map <Leader>1 :tabnew /home/james/.vimrc<CR>
map <Leader>2 :tabnew /home/james/Documents/refnotes/ref1<CR>
