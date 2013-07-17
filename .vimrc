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

set iskeyword-=_

if has("gui_running")
  "Load plugin automatically"
  execute pathogen#infect()
  
  "EasyMotion"
  let g:EasyMotion_leader_key = '<Leader>'
  
  "CtrlP plugin"
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  
  "NerdTree"
  map <C-n> :NERDTreeToggle<CR>

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
       
  "use the previous window to jump to the first search result
  "wincmd w
   
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

"if $COLORTERM == 'gnome-terminal'
"	set term=gnome-256color
"  colorscheme railscasts
"else
"  colorscheme default
"endif
