let NERDTreeShowHidden=1

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

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <silent> <C-/> :Commentary<Cr>
vnoremap <silent> <C-/> :Commentary<Cr>gv

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
