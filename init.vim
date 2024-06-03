
:tnoremap <Esc> <C-\><C-n>

inoremap <C-Cr> <Cr><Up>

nnoremap <silent> <S-A-f> :PrettierAsync<Cr>

:set clipboard+=unnamedplus

let NERDTreeShowHidden=1
let NERDTreeMapOpenInTabSilent='<S-Cr>'
nnoremap <silent> <TAB> :tabn<Cr>
nnoremap <silent> <S-TAB> :tabp<Cr>
nnoremap <silent> <A-1> :tabn1<Cr>
nnoremap <silent> <A-2> :tabn2<Cr>
nnoremap <silent> <A-3> :tabn3<Cr>
nnoremap <silent> <A-4> :tabn4<Cr>
nnoremap <silent> <A-5> :tabn5<Cr>
nnoremap <silent> <A-6> :tabn6<Cr>
nnoremap <silent> <A-7> :tabn7<Cr>
nnoremap <silent> <A-8> :tabn8<Cr>
nnoremap <silent> <A-9> :tabn9<Cr>
nnoremap <silent> <A-0> :tabn10<Cr>
nnoremap <silent> <A-Left> :tabm -<Cr>
nnoremap <silent> <A-Right> :tabm +<Cr>

:set number
:set scrolloff=10
:set shiftwidth=4

inoremap jj <Esc>
nnoremap qq :q!<Cr>

nnoremap <silent> <C-s> :w<Cr>
inoremap <silent> <C-s> <Esc>:w<Cr>a

nnoremap <silent> <C-d> :t.<CR>
inoremap <silent> <C-d> <Esc>:t.<CR>a
vnoremap <C-d> yPgv

nnoremap <silent> <A-j> :m .+1<CR>
inoremap <silent> <A-j> <Esc>:m .+1<CR>a

nnoremap <silent> <A-k> :m .-2<CR>
inoremap <silent> <A-k> <Esc>:m .-2<CR>a

vnoremap <silent> <A-j> :m '>+1<CR>gv
vnoremap <silent> <A-k> :m '<-2<CR>gv

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : '<TAB>'
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <S-TAB> <Backspace>

nnoremap <silent> <C-/> :Commentary<Cr>
vnoremap <silent> <C-/> :Commentary<Cr>gv

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

call plug#begin('~/.config/nvim/plugged')

    Plug 'neoclide/coc.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'omnisharp/omnisharp-vim'
    Plug 'tpope/vim-commentary'
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'honza/vim-snippets'
    Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install --frozen-lockfile --production',
	\ 'branch': 'release/0.x'
    \ }
    Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()


lua <<EOF
    require'nvim-treesitter.configs'.setup {
	highlight = {
	    enable = true,
	    additional_vim_regex_highlighting = false,
	},
    }

    require("nvim-autopairs").setup {}
    require("nvim-ts-autotag").setup {}
    require("toggleterm").setup {}
    require("ibl").setup()


    local Terminal  = require('toggleterm.terminal').Terminal
    local termH = Terminal:new({ direction='horizontal' })
    local termF = Terminal:new({ direction='float' })
    local termV = Terminal:new({ direction='vertical' })

    function _termH_toggle()
    termH:toggle(15)
    end

    function _termF_toggle()
	termF:toggle()
    end

    function _termV_toggle()
	termV:toggle(50)
    end

    vim.api.nvim_set_keymap("n", "<A-h>", "<Cmd>lua _termH_toggle()<Cr>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("t", "<A-h>", "<Cmd>lua _termH_toggle()<Cr>", {noremap = true, silent = true})

    vim.api.nvim_set_keymap("n", "<A-i>", "<Cmd>lua _termF_toggle()<Cr>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("t", "<A-i>", "<Cmd>lua _termF_toggle()<Cr>", {noremap = true, silent = true})

    vim.api.nvim_set_keymap("n", "<A-v>", "<Cmd>lua _termV_toggle()<Cr>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("t", "<A-v>", "<Cmd>lua _termV_toggle()<Cr>", {noremap = true, silent = true})

    vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h13"
    vim.g.neovide_transparency = 0.8

EOF

colorscheme catppuccin
