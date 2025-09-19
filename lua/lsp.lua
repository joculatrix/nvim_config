vim.pack.add({
    { src = Github('neovim/nvim-lspconfig') },
    { src = Github('nvim-treesitter/nvim-treesitter') },
    { src = Github('mrcjkb/rustaceanvim') },
})

vim.lsp.inlay_hint.enable(false)
vim.keymap.set('n', '<Leader>ch',
    function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
    { desc = 'Toggle inlay hints' })

vim.keymap.set('n', '<Leader>cr',
    function() vim.lsp.buf.rename(nil) end,
    { desc = 'Rename symbol' })

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash', 'c', 'cmake', 'cpp', 'haskell', 'lua', 'make',
        'markdown', 'nasm', 'rust', 'toml', 'yaml'
    }
})

vim.lsp.enable('asm_lsp')

vim.lsp.enable('bashls')

vim.lsp.enable('clangd')
vim.lsp.config['clangd'] = {
    filetypes = { 'c', 'cc', 'cpp', 'cxx', 'h', 'hh', 'hpp', 'hxx' }
}

vim.lsp.enable('hls')

vim.lsp.enable('lua_ls')
vim.lsp.config['lua_ls'] = {
    settings = {
        Lua = {
            workspace = {
                -- the evil ("unknown global object vim") is defeated!
                library = { vim.env.VIMRUNTIME }
            }
        }
    }
}

require('rustaceanvim')
vim.g.rustaceanvim = {
    tools = {
        code_actions = {
            ui_select_fallback = true,
        }
    },
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set('n', '<Leader>ca',
                function() vim.cmd.RustLsp('codeAction') end,
                { desc = 'Code action' })
            vim.keymap.set('n', '<Leader>cd',
                ':RustLsp renderDiagnostic<CR>',
                { desc = 'Render diagnostic' })
            vim.keymap.set('n', '<Leader>ct',
                ':RustLsp run<CR>',
                { desc = 'Run test' })
        end,
        default_settings = {
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true,
                    buildScripts = {
                        enable = true,
                    }
                },
                diagnostics = {
                    enable = diagnostics == 'rust-analyzer'
                },
                procMacro = {
                    enable = true
                }
            }
        }
    }
}
