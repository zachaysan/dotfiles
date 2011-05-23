set runtimepath=$DOTFILES_PATH/.vim,$VIMRUNTIME

"Keep all temporary and backup files in ~/.vim
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

set expandtab
set history=1000
set number
set nowrap
set nostartofline " Maintain cursor column position across rows

" Search
set hlsearch
set incsearch
set ignorecase

" Autocomplete
set wildmode=list:longest

" Pathogen Bundles
call pathogen#runtime_append_all_bundles()


syntax on " Syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype


" Indentation per filetype
au FileType html,css,js,mako,htmldjango setlocal expandtab shiftwidth=4 tabstop=4
au FileType python setlocal expandtab shiftwidth=4 tabstop=4

" Keep vim's directory context same as the current buffer
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Alternatives for Esc to exit insert mode.
imap jj <ESC>

" Reveal rogue spaces
set list listchars=tab:>\ ,trail:.,extends:$,nbsp:_
set fillchars=fold:-

" Evaporate rogue spaces
function! StripWhitespace ()
    exec ':%s/\s*$//g'
endfunction
noremap <leader><space> :call StripWhitespace ()<CR>



" Bundles:

"" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
