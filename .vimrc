syntax on
set ruler
set number
set mouse=a

set tabstop=2
set shiftwidth=2
set expandtab
retab
set autoindent

set title
set showcmd

set showmatch
set ignorecase
set incsearch
set hlsearch

"Add underscore as word separator"
set iskeyword-=_

if has("gui_running")
  "Vundle required settings"
  set nocompatible   " be iMproved
  filetype off       " required!
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  "let Vundle manage Vundle"
  Bundle 'gmarik/vundle'

  "YouCompleteMe"
  Bundle 'Valloric/YouCompleteMe'

  "EasyMotion"
  Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_leader_key = '<Leader>'
  
  "CtrlP plugin"
  Bundle 'kien/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  
  "NerdTree"
  Bundle 'scrooloose/nerdtree'
  map <C-n> :NERDTreeToggle<CR>

  "vim-jade"
  Bundle 'digitaltoad/vim-jade'

  "Folding Settings"
  set foldmethod=indent
  set foldlevel=20
  au BufWinLeave * silent! mkview
  au BufWinEnter * silent! loadview
endif
  
"Ctrl G Grep"
map <c-g> :call CtrlGGrep()<CR>

function! CtrlGGrep()
  let pattern = input("Enter the search pattern: ")
  if pattern == ''
    echo 'Aborted'
    return
  endif
       
  "a hack for *nix to make sure the output of "grep" isnt echoed in vim
  "let old_shellpipe = &shellpipe
  "let &shellpipe='&>'
   
  try
    exec 'silent grep! --exclude-dir=.git --exclude=*.swp -rn --color "' . pattern . '" `pwd`'
  finally
    "let &shellpipe = old_shellpipe
  endtry
   
  let hits = len(getqflist())
  if hits == 0
    echo "No hits"
  elseif hits > 1
    copen
    echo "Multiple hits. Jumping to first, use :copen to see them all."
  endif
endfunction

"Colorscheme Railscasts"
if has("gui_running")
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
  set term=gnome-256color
  colorscheme railscasts
else
  colorscheme default
endif

"Highlight Lines exceed 80 characters"
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>79v.\+/
