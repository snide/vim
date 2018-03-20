" Vim setup by dave.snider@gmail.com

" ----------------------------------
" Vundle for plugins
" ----------------------------------

set nocompatible
filetype off
set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'xolox/vim-misc'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'brettof86/vim-swigjs'
Plugin 'svermeulen/vim-easyclip'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'jlong/sass-convert.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'dag/vim-fish'
Plugin 'sickill/vim-pasta'
Plugin 'vimwiki/vimwiki'
Plugin 'skwp/greplace.vim'

call vundle#end()

syntax on
filetype plugin indent on

" ----------------------------------
" Generic settings
" ----------------------------------

" Ignore these files
set wildignore+=*/.git/*,*/tmp/*,*/.hg/*,*/.svn/*,*/build/*,*/vendor/*,*/dist/*,*.css,*/node-modules/*,*/node_modules/*,*/bower_components/*,*/.sass-cache/*,*/.grunt/*,*.svg,*/assets/*

" Generic Vim settings
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup                		" Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set macmeta                     " Allow use of command key for mac
set tabstop=2                   " Use 2 spaces for tabs
set shiftwidth=2                " Shift by 2 spaces
set softtabstop=2               " Use 2 spaces for tabs
set expandtab                   " Use tabs for spaces
set nowrap                      " Don't word wrap
set autoindent                  " Try and figure out indedentation when possible
set foldmethod=indent
set foldlevelstart=20

"General key remaps
let mapleader = ","             " Replace the <leader> with ,
map <S-Tab> <C-W>
noremap <D-PageDown> :tabnext<CR>
noremap <D-PageUp> :tabprev<CR>
map <S-D-Right> vg_
map! <S-D-Right> <esc>vg_
map <S-D-Left> v^
map! <S-D-Left> <esc>v^
map <S-F> za

"Clear search once I'm done
nnoremap <esc><esc> :noh<cr>

"Enter and shift enter create new lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Arrow keys move between windows
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <left> <C-w><left>
nnoremap <right> <C-w><right>
nnoremap j gj
nnoremap k gk
nnoremap <D-j> 10j
nnoremap <D-k> 10k
vnoremap . :norm.<CR>

" Set up some colors
syntax enable
let macvim_skip_colorscheme=1
set background=dark
colorscheme solarized
highlight SignColumn guibg=#272822
highlight SyntasticErrorLine guifg=white guibg=#6e3232
highlight ExtraWhitespace ctermbg=red guibg=#CCCCCC
highlight MatchParen cterm=none guibg=#22a398 guifg=#002b35
" This makes macvim / solarized work well with gitgutter
highlight clear SignColumn

" ----------------------------------
" Macvim only
" ----------------------------------

if has("gui_macvim")
  " No toolbars, menu or scrollbars in the GUI
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h12 "TODO: include these fonts by default
  set clipboard+=unnamed
  set vb t_vb=
  set guioptions-=m  "no menu
  set guioptions-=T  "no toolbar
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r  "no scrollbar
  set guioptions-=R

  " Open goto symbol on current buffer
  nmap <D-r> :MyCtrlPTag<cr>
  imap <D-r> <esc>:MyCtrlPTag<cr>

  " Open goto symbol on all buffers
  nmap <D-R> :CtrlPBufTagAll<cr>
  imap <D-R> <esc>:CtrlPBufTagAll<cr>

  " Open goto file
  nmap <D-t> :CtrlP<cr>
  imap <D-t> <esc>:CtrlP<cr>

  " Comment lines with cmd+/
  map <D-/> :TComment<cr>
  vmap <D-/> :TComment<cr>gv

  " Indent lines with cmd+[ and cmd+]
  nmap <D-]> >>
  nmap <D-[> <<
  vmap <D-[> <gv
  vmap <D-]> >gv


  " This mapping makes Ctrl-Tab switch between tabs.
  " Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " switch between tabs with cmd+1, cmd+2,..."
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt

  " until we have default MacVim shortcuts this is the only way to use it in
  " insert mode
  imap <D-1> <esc>1gt
  imap <D-2> <esc>2gt
  imap <D-3> <esc>3gt
  imap <D-4> <esc>4gt
  imap <D-5> <esc>5gt
  imap <D-6> <esc>6gt
  imap <D-7> <esc>7gt
  imap <D-8> <esc>8gt
  imap <D-9> <esc>9gt

  " Select text whit shift
  let macvim_hig_shift_movement = 1

  " Stop completion with enter, in addition to default ctrl+y
  imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

endif

" ----------------------------------------- "
" Plugin configs
" ----------------------------------------- "

" Nerdtree
let NERDTreeShowHidden=1        " Show Nerdtree hidden files
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <D-p> :NERDTreeTabsToggle<CR>
map <D-p> :NERDTreeTabsToggle<CR>

" Ctrlp
let g:ctrlp_cmd                 = 'CtrlPMixed' " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode   = 'ra'         " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0            " show the match window at the top of the screen
let g:ctrlp_by_filename         = 0            " use filename for search
let g:ctrlp_max_height          = 10           " maxiumum height of match window
let g:ctrlp_switch_buffer       = 'et'         " jump to a file if it's open already
let g:ctrlp_use_caching         = 0            " enable caching
let g:ctrlp_clear_cache_on_exit = 0            " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max            = 250          " number of recently opened files
let g:ctrlp_working_path_mode   = 2
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' "use silver searcher.

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

func! MyPrtMappings()
    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<c-t>'],
        \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
        \ }
endfunc

func! MyCtrlPTag()
    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
    CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

let g:ctrlp_buftag_types = {
\ 'go'     	   : '--language-force=go --golang-types=ftv',
\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
\ 'objc'       : '--language-force=objc --objc-types=mpci',
\ 'rc'         : '--language-force=rust --rust-types=fTm'
\ }

" Gitgutter
let g:gitgutter_override_sign_column_highlight = 0

" Gundo
nnoremap wtf :GundoToggle<CR>

" Delitmate
let g:delimitMate_expand_cr    = 1       "create line break when pressing enter
let g:delimitMate_expand_space = 1

" Vim-Pasta for better paste indenting
let g:pasta_enabled_filetypes = ['html', 'javascript', 'css', 'coffee']

" Multicursor
" let g:something_cursor_use_default_mapping = 0
" let g:something_cursor_next_key = '<D-d>'
" let g:something_cursor_prev_key = '<D-u>'
" let g:something_cursor_skip_key = '<D-k>' "until we got somethingple keys support
" let g:something_cursor_quit_key = '<Esc>'


" YouCompleteMe and Ultisnips
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion           = 1
let g:ycm_complete_in_strings                       = 0
let g:ycm_key_list_select_completion                = []
let g:ycm_key_list_previous_completion              = []

let g:UltiSnipsExpandTrigger                        = "<tab>"
let g:UltiSnipsJumpForwardTrigger                   = "<tab>"
let g:UltiSnipsListSnippets                         = "<c-e>"
let g:UltiSnipsSnippetDirectories                   = ["snips"]

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

let g:EasyClipAutoFormat             = 1
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipUseCutDefaults = 0

nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

nmap <M-v> <plug>EasyClipSwapPasteForward
nmap <M-D-v> <plug>EasyClipSwapPasteBackwards

" Airline
set guifont=Meslo\ LG\ S\ for\ Powerline:h11
let g:airline_powerline_fonts               = 1
let g:airline#extensions#whitespace#enabled = 1

" JSX
let g:jsx_ext_required = 0

" Easymotion
nmap ff <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

" Spellcheck
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us
set lsp=0

" Surround
let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>""
let g:surround_{char2nr("s")} = "<span\1class: \r..*\r class=\"&\"\1>\r</span>""

" Syntastic
" let g:syntastic_enable_signs=0
" highlight SyntasticErrorLine guifg=white guibg=#6e3232
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript', 'python', 'php', 'json', 'sass'],
                           \ 'passive_filetypes': ['html'] }

" Tabular

if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:<CR>
  vmap <leader>t: :Tabularize /:<CR>
endif

let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'coffee' : 1,
  \}


" inoremap <silent> = =<Esc>:call <SID>ealign()<CR>a
" function! s:ealign()
"   let p = '^.*=\s.*$'
"   if exists(':Tabularize') && getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
"     Tabularize/=/l1
"     normal! 0
"     call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction

" Ack
" set grepprg=ack
" let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'
let g:ag_highlight = 1
" let g:ackpreview = 1

let g:ag_working_path_mode="r"
nnoremap \ :Ag<SPACE>-i<SPACE>
nnoremap \\ :Ag<SPACE>-G<SPACE>'\.(less)$'<SPACE>

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'


" ----------------------------------------- "
" Useful scripts
" ----------------------------------------- "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Highlight bad whitespace
highlight ExtraWhitespace ctermbg=red guibg=#DC322F
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove whitespace on save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.* :call TrimWhiteSpace()

" Use gh flavored markdown by default
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Turn on wordwrap with F9
nnoremap <F9> :call Wrap()<cr>

function! Wrap()
    if (&wrap == 1)
        set nowrap
        set nolinebreak
    else
        set wrap
        set linebreak
    endif
endfunction

" Use html django if the file is any sort of .html file.
au BufNewFile,BufRead *.html setlocal ft=htmldjango
au BufNewFile,BufRead *.css setlocal ft=sass

" Reload vim when the vimrc file is edited.
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END
