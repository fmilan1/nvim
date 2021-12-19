inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')


inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"


:set number
:set scrolloff=5
:set shiftwidth=4

" resize panels
nnoremap <A-Left> :vertical resize -1<Enter>
nnoremap <A-Right> :vertical resize +1<Enter>
nnoremap <A-Up> :resize +1<Enter>
nnoremap <A-Down> :resize -1<Enter>

" F12 to run
map <F12> :RustRun<CR>
map <F12> :! g++ %:r.cpp -o %:r.out && ./%:r.out<Enter>

" comment C++
vnoremap <C-j> :norm ^xx<Enter>
vnoremap <C-k> :norm i//<Enter>


"NERDTree autorefresh
nnoremap <C-r> :NERDTreeRefreshRoot<CR>

"nerdtree tabs control
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" ctrl-D to duplicate line
inoremap <C-d> <ESC>:t.<CR>
nnoremap <C-d> :t.<CR>

" ctrl-space to open completetion
inoremap <silent><expr> <c-space> coc#refresh()

" move line up and down
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-k> <ESC>:m .-2<CR>
inoremap <A-j> <ESC>:m .+1<CR>

"back to normal mode
inoremap jj <ESC>

"quit without saving
nnoremap qq :q!<CR>

" quick save
nnoremap zz :w<CR>

" NERDTreeToggle
map <F8> :NERDTreeToggle<CR>

"source '$HOME/.config/nvim/plug-config/coc.vim'

call plug#begin('~/.config/nvim/autoload/plugged')

    " File explorer
    Plug 'scrooloose/NERDTree'

    " Auto pairs for '(' '[' '{'
    " Plug 'jiangmiao/auto-pairs'

    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'kyoz/purify', { 'rtp': 'vim' }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'rust-lang/rust.vim'

    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

    " git integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'


call plug#end()

colorscheme challenger_deep

" colorscheme purify "--------------------------------- Set onedark theme
" hi Normal guibg=#252334 ctermbg=234 "---- Place this after you set the colorscheme
" hi Normal guibg=#252834 ctermbg=234 "---- Place this after you set the colorscheme
