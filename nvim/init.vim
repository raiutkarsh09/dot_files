"set vim incompatible with vi to enable interesting features"
set nocompatible

"for vundle"
filetype off

call plug#begin('~/.nvim/plugs')
" surroundings
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
" /surroundings

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/syntastic'
Plug 'balanceiskey/vim-framer-syntax'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'

Plug 'suan/vim-instant-markdown'
" Language syntaxes
Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-cpp-modern'
" /Language syntaxes
call plug#end()

" Plugins

" CoC.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <c-`> <Plug>(coc-terminal-toggle)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
noremap fd <esc>:Format<cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? QUOTE\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? QUOTE\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>

" /CoC.nvim
" lightline
let g:lightline = {
      \ 'colorscheme': 'framer',
      \ }
" /lightline
" rainbow
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}
" /rainbow
" vim-clang-fomat
" /vim-clang-fomat
" nerdtree
noremap <silent> <F5> :NERDTreeToggle<cr>
" /nerdtree
" /Plugins

"customisation
color vim-framer-syntax
set relativenumber
set number
set autoindent
set shiftwidth=4
set tabstop=4

" Backup
se nobackup writebackup

let s:vim_cstmztn_files_dir=expand('~/tools/Vim_Files/')
let &directory=s:vim_cstmztn_files_dir.'vim_backup'
let &backupdir=s:vim_cstmztn_files_dir.'vim_backup'

"Split screen switch ctrl+ (h,j,k,l)"
map gj <C-W>j
map gk <C-W>k
map gh <C-W>h
map gl <C-W>l

"hilighting current line"
set cursorline
hi Comment cterm=italic

" hilighting pop up menu
hi Pmenu ctermbg=black ctermfg=blue guibg=black guifg=blue
hi PmenuSel ctermbg=blue  ctermfg=black guibg=blue  guifg=black

"Substitue escape key"
inoremap jk <Esc>
vnoremap ;; <Esc>

"remove split seperators"
set fillchars="vert:,"

"split right and bottom"
set splitbelow
set splitright

"save on ctrl + s
inoremap <C-s> <esc>:w<CR>
vnoremap <C-s> <esc>:w<CR>gv
nnoremap <C-s> :w<CR>

"save and quit all
nnoremap aa :wqa<CR>
vnoremap aa <esc>:wqa<CR>
nnoremap zz :q<CR>

"disable arrow keys
nnoremap <Up>    :echo "Don't use that!"<CR>
nnoremap <Down>  :echo "Don't use that!"<CR>
nnoremap <Left>  :echo "Don't use that!"<CR>
nnoremap <Right> :echo "Don't use that!"<CR>

inoremap <Up>   <esc> :echo "Don't use that!"<CR>
inoremap <Down> <esc> :echo "Don't use that!"<CR>
inoremap <Left> <esc> :echo "Don't use that!"<CR>
inoremap <Right> <esc>:echo "Don't use that!"<CR>

" Add empty lines
nnoremap <c-o> o<esc>

" Activate Mouse in normal mode
set mouse=n

" Bugfixes
" fix ^^^ in statusline, occurs when statusline(NC) same theme
set fillchars+=stl:\ ,stlnc:." 
" /Bugfixes
" GUI
" /GUI
