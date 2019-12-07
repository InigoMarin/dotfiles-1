" set relative line number
set number relativenumber
"  Enable intelligent tabbing and spacing for indentation and alignment
set smarttab
" Enable intelligent tabbing and spacing for indentation and alignment
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" set ruler option
set ruler
" syntax
" set syntax highlighting
syntax enable
colorscheme monokai
set t_ut=

" split and navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" autonumbering when moving
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
" netrw filebrowser
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 15

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if argc() == 0 | Vexplore! | endif
augroup END

let g:NetrwIsOpen=1

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

" toggle file browser
noremap <silent> <C-E> :call ToggleNetrw()<CR>

" plugins [lets not get to carried away]
call plug#begin('$HOME/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'townk/vim-autoclose'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pakutoma/toggle-terminal'
Plug 'mboughaba/i3config.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'chase/vim-ansible-yaml'
call plug#end()

" Plugin Configuration

" Open terminal in working directory
" map <C-@> to toggle terminal
tnoremap <silent> <C-@> <C-w>:ToggleTerminal<CR>
nnoremap <silent> <C-@> :ToggleTerminal<CR>

" set your favorite shell
let g:toggle_terminal#command = 'zsh'

" set terminal window position
" (see possible options at :help vertical)
let g:toggle_terminal#position = 'belowright'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" UltiSnip User
let g:snips_author="Nikolai Shields"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" detect i3 config file
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead $HOME/.config/i3/config set filetype=i3config
aug end

" ALE 
let g:ale_sign_column_always = 1
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '>='

" ALE Perl
let g:ale_perl_perl_executable = 'perl'
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib'

"vim-session
" autosave session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

"❯ find . -type f -name '*.rmd' | entr -c make autorebuild on change
