let mapleader = " "

:tnoremap <Esc> <C-\><C-n>


inoremap <C-Cr> <Esc>O
inoremap <S-Cr> <Esc>o

nnoremap <silent> <S-A-f> :PrettierAsync<Cr>

:set clipboard+=unnamedplus

let NERDTreeShowHidden=1
let NERDTreeMapOpenInTabSilent='T'
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
:set scrolloff=15
:set shiftwidth=4

inoremap jj <Esc>
nnoremap qq :q!<Cr>

nnoremap <silent> <leader>s :w<Cr>

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

nnoremap <silent> <leader>/ :Commentary<Cr>
vnoremap <silent> <leader>/ :Commentary<Cr>gv


nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>


call plug#begin('~/.config/nvim/plugged')

    Plug 'neoclide/coc.nvim'
    Plug 'navarasu/onedark.nvim'
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
    Plug 'nvim-lua/plenary.nvim'
    Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }
    Plug 'neovim/nvim-lspconfig'
call plug#end()


lua <<EOF

    require'nvim-treesitter.configs'.setup {
	highlight = {
	    enable = true,
	    additional_vim_regex_highlighting = false,
	},
    }

    require("lspconfig").rust_analyzer.setup {}
    require("nvim-autopairs").setup {}
    require("nvim-ts-autotag").setup {}
    require("toggleterm").setup {}
    require("ibl").setup()
    local mappings_utils = require('renamer.mappings.utils')
    require('renamer').setup {
	-- The popup title, shown if `border` is true
	title = 'Rename',
	-- The padding around the popup content
	padding = {
	    top = 0,
	    left = 0,
	    bottom = 0,
	    right = 0,
	},
	-- The minimum width of the popup
	min_width = 15,
	-- The maximum width of the popup
	max_width = 45,
	-- Whether or not to shown a border around the popup
	border = true,
	-- The characters which make up the border
	border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	-- Whether or not to highlight the current word references through LSP
	show_refs = true,
	-- Whether or not to add resulting changes to the quickfix list
	with_qf_list = true,
	-- Whether or not to enter the new name through the UI or Neovim's `input`
	-- prompt
	with_popup = true,
	-- The keymaps available while in the `renamer` buffer. The example below
	-- overrides the default values, but you can add others as well.
	mappings = {
	    ['<c-i>'] = mappings_utils.set_cursor_to_start,
	    ['<c-a>'] = mappings_utils.set_cursor_to_end,
	    ['<c-e>'] = mappings_utils.set_cursor_to_word_end,
	    ['<c-b>'] = mappings_utils.set_cursor_to_word_start,
	    ['<c-c>'] = mappings_utils.clear_line,
	    ['<c-u>'] = mappings_utils.undo,
	    ['<c-r>'] = mappings_utils.redo,
	},
	-- Custom handler to be run after successfully renaming the word. Receives
	-- the LSP 'textDocument/rename' raw response as its parameter.
	handler = nil,
    }


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

colorscheme onedark
