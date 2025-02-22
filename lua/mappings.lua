require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>:w<Cr>")
map("n", "qq", ":q!<Cr>")

map("n", "<A-j>", ":m+1<Cr>", { silent = true })
map("n", "<A-k>", ":m-2<Cr>", { silent = true })
map("v", "<A-j>", ":m '>+1<Cr>gv", { silent = true })
map("v", "<A-k>", ":m '<-2<Cr>gv", { silent = true })

map("n", "<C-d>", ":t .<Cr>", { silent = true })
map("i", "<C-d>", "<Esc>:t .<Cr>a", { silent = true })
map("v", "<C-d>", "yPgv", { silent = true })

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

map("t", "<Esc>", "<C-\\><C-n>")

map("i", "<C-Cr>", "<Esc>O")
map("i", "<S-Cr>", "<Esc>o")

map("i", "<C-v>", "<Esc>Pi")

map("n", "<leader>n", ":NvimTreeToggle<Cr>")

local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    },
})

local nvimtree = require("nvim-tree")

nvimtree.setup({
  filters = {
    dotfiles = false, -- Mutassa a rejtett fájlokat (pl. .gitignore, .env)
    git_ignored = false, -- Mutassa a git által figyelmen kívül hagyott fájlokat is
  },
  -- view = {
  --   width = 35, -- Fastruktúra szélessége
  -- },
})

map("n", "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts = {
        row = 0.12,
        col = 0.15,
        width = .7,
        height = .7,
    },
    }
end)
