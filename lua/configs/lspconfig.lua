-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "clangd", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

vim.api.nvim_set_hl(0, 'MyErrorLineBg', { bg = "#bf2a4d", fg = "#000000" })

vim.diagnostic.config({
    virtual_text = false, -- Ez tünteti el a szöveget a sor végéről
    underline = true,
    update_in_insert = true,
    severity_sort = false,

    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "☠️",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "MyErrorLineBg",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "MyErrorLineBg",
        },
    },
})

-- Segédfüggvény az on_attach-hez
local on_attach = function(client, bufnr)
    -- Betöltjük az alap NvChad on_attach funkciókat (billentyűkombinációk, stb.)
    require("nvchad.configs.lspconfig").on_attach(client, bufnr)

    -- 2. Automatikus ablak megjelenítése, ha a kurzor a hiba felett áll
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = nvlsp.on_attach,
        on_attach = on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
