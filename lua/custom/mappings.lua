---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },

        --  format with conform
        ["<leader>fm"] = {
            function()
                require("conform").format()
            end,
            "formatting",
        },
        -- custom
        ["<C-d>"] = { ":t.<CR>" },
        ["<A-j>"] = { ":m .+1<CR>"},
        ["<A-k>"] = { ":m .-2<CR>"},
        ["qq"] = { ":q!<CR>"},
    },
    v = {
        [">"] = { ">gv", "indent" },
    },
}

-- more keybinds!

return M
