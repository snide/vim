" Vim setup by dave.snider@gmail.com

" ----------------------------------
" Vundle for plugins
" ----------------------------------

set nocompatible
filetype off
set shell=/bin/bash

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-session'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'brettof86/vim-swigjs'
Plugin 'maxbrunsfeld/vim-yankstack'

call vundle#end()

syntax on
filetype plugin indent on

" ----------------------------------
" Generic settings
" ----------------------------------

" Ignore these files
set wildignore+=*/.git/*,*/tmp/*,*/.hg/*,*/.svn/*,*/build/*,*/vendor/*,*/dist/*,*.css,*/node-modules/*,*/node_modules/*,*/bower_components/*,*/.sass-cache/*,*/.grunt/*,*.svg

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

"General key remaps
let mapleader = ","             " Replace the <leader> with ,
map <S-Tab> <C-W>
noremap <D-PageDown> :tabnext<CR>
noremap <D-PageUp> :tabprev<CR>
map <S-D-Right> vg_
map! <S-D-Right> <esc>vg_
map <S-D-Left> v^
map! <S-D-Left> <esc>v^

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

" Set up some colors
syntax enable
let macvim_skip_colorscheme=1
set background=dark
colorscheme solarized
highlight SignColumn guibg=#272822
highlight SyntasticErrorLine guifg=white guibg=#6e3232
highlight ExtraWhitespace ctermbg=red guibg=#CCCCCC

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

  "Open sidebar with cmd+k
  map <D-k> :NERDTreeTabsToggle<CR>

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
nnoremap <D-k> :NERDTreeTabsToggle<CR>

" Ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 10				" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
let g:ctrlp_use_caching = 1				" enable caching
let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 				" number of recently opened files
let g:ctrlp_working_path_mode=2

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


" Vim Sessions
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" Delitmate
let g:delimitMate_expand_cr = 1       "create line break when pressing enter
let g:delimitMate_expand_space = 1

" Multicursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<D-d>'
let g:multi_cursor_prev_key = '<D-u>'
let g:multi_cursor_skip_key = '<D-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'

" YouCompleteMe and Ultisnips
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_strings = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsSnippetDirectories=["snips"]

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

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

"Yankstack
nmap <M-p> <Plug>yankstack_substitute_older_paste

" Airline
set guifont=Meslo\ LG\ S\ for\ Powerline:h11
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1

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

" Ack
set grepprg=ack
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackhighlight = 1
" let g:ackpreview = 1


" ----------------------------------------- "
" Useful scripts
" ----------------------------------------- "

" Highlight bad whitespace
highlight ExtraWhitespace ctermbg=black guibg=#181818
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
    else
        set wrap
    endif
endfunction

" Use html django if the file is any sort of .html file.
au BufNewFile,BufRead *.html setlocal ft=htmldjango

" Reload vim when the vimrc file is edited.
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
