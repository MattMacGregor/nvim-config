call plug#begin()
  Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
  Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
  Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
  Plug 'L3MON4D3/LuaSnip' " Snippets plugin
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
call plug#end()

lua require('lsp_config')
lua require('nvim_cmp_config')

" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>

" Command binding, basically says if the NERDTree window number is the current
" window number close, otherwise focus
" <silent> is simply to not echo the command in the shell
" <expr> indicates the keybinding is a expression
nnoremap <silent><expr> <leader>n winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>" : ":NERDTreeFocus\<CR>"

" Start NERDTree when Vim starts with a directory argument.
" XXX (mmac) Modified by me to only start with the tree open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | q | execute 'cd '.argv()[0] | endif

" Highlight trailing spaces
autocmd BufWinEnter <buffer> match Error /\s\+$/
autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
autocmd InsertLeave <buffer> match Error /\s\+$/
autocmd BufWinLeave <buffer> call clearmatches()

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set colorcolumn=100
