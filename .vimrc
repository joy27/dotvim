set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-repeat'
Bundle 'Valloric/ListToggle'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on     " required!

" for testing out custom vim scripts
set rtp+=$HOME/.vim/bundle/YouCompleteMe

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"remap leader key{{{
let mapleader=','
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                scommon configs                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map visual mode vertical selectoin"
set fenc=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese
set encoding=utf-8  "if not set, the powerline plugins won't work 
if has("win32") || has("win64")
set fileencoding=chinese
endif
set autoindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set softtabstop=4
set expandtab
set textwidth=300
set t_Co=256
set number
set hidden
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set autoread
set title
set matchpairs+=<:>
set ruler
set backspace=indent,eol,start
map Y y$
set laststatus=2
set pastetoggle=<F2>
set nolist
syntax on

"map windows command {{{
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
"nmap ,c <c-w>c
"nmap ,<tab> <c-w><c-w>
"nnoremap j gj
"nnoremap k gk
"}}}


" tab navigation like firefox{{{
nnoremap <leader><tab> :tabnext<CR>
inoremap <leader><tab>   <Esc>:tabnext<CR>i
if has("gui_macvim")
nnoremap <m-t>     :tabnew<CR>
inoremap <m-t>     <Esc> :tabnew<CR>
else
nnoremap <A-t>     :tabnew<CR>
inoremap <A-t>     <Esc> :tabnew<CR>
endif

"}}}

"search" {{{
"set incsearch
"set hls
"nnoremap <silent> <leader>nl :<C-u>nohlsearch<CR><C-l>
"nnoremap <silent> <C-c> :%s///gn<cr>
"vnoremap < <gv
"vnoremap > >gv
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
"vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                DoxygenToolkit                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="guanghui.qu <guanghui8827@126.com>"
let g:DoxygenToolkit_licenseTag="MIT License"
"create doxygen comment
map <leader>dd :Dox<CR>
map <leader>da :DoxAuthor<Cr>
map <leader>dl :DoxLic<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                A                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"go back and forth from header file and source file
nmap <silent> <leader>f :A<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NeroTreeToggle                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>n :NERDTreeToggle <CR>
let NERDTreeShowHidden=1

" bufkill bd's: really do not mess with NERDTree buffer
nnoremap <silent> <backspace> :BD<cr>
nnoremap <silent> <s-backspace> :BD!<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme soloarizes                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=light
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                delimitMate                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                bufexplorer                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nmap <leader>bf :BufExplorer<cr>
"}}}

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
set macmeta
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                UltiSnips                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" we can't use <tab> as our snippet key since we use that with YouCompleteMe
let g:UltiSnipsSnippetsDir         = $HOME . '/.vim/UltiSnips'
if has("gui_macvim")
let g:UltiSnipsExpandTrigger       = "<m-s>"
let g:UltiSnipsListSnippets        = "<c-m-s>"
let g:UltiSnipsJumpForwardTrigger  = "<m-f>"
let g:UltiSnipsJumpBackwardTrigger = "<m-b>"
else
let g:UltiSnipsExpandTrigger       = "<A-s>"
"let g:UltiSnipsListSnippets        = "<c-A-s>"
let g:UltiSnipsJumpForwardTrigger  = "<A-f>"
let g:UltiSnipsJumpBackwardTrigger = "<A-b>"
endif
let g:snips_author                 = 'Strahinja Val Markovic'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tagbar                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window = 1
if has("gui_macvim")
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif
"open a tag list ivew
nmap <silent> <leader>ta :TagbarToggle <CR>


" Generate tags on save. Note that this regenerates tags for all files in current folder {{{
function! GenerateTagsFile()
exec ":!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q ."
endfunction

"function! GenerateJsTags()
"    exec ":!jsctags ."
"endfunction

nnoremap <leader>8   :call GenerateTagsFile() <cr>
"nnoremap <leader>9   :call GenerateJsTags() <cr>

" config ctags file locations {{{
set tags+=./tags


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              YouCompleteMe                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']
let g:ycm_filetype_specific_completion_to_disable = {'javascript': 1}

"better tag navigation from www.vimbits.com {{{
"nnoremap <leader><Enter> <C-]>
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader><Enter> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
nmap <c-t> :e#<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                syntastic                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_python_checkers = ['pyflakes']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ctrlp                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>p :CtrlP <cr>
let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git)$',
            \ 'file': '\v\.(log|jpg|png|jpeg)$',
            \ }
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*.o


