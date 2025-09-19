function Github(repo)
    return 'https://github.com/' .. repo
end

-- dependencies for other plugins:
vim.pack.add({
    { src = Github('MunifTanjim/nui.nvim') },
    { src = Github('nvim-lua/plenary.nvim') },
})

require('vimopt')
require('colorscheme')
require('keymap')
require('lsp')
require('miniplugs')

-- MISC PLUGINS

vim.pack.add({
    { src = Github('nvim-lualine/lualine.nvim') },
    { src = Github('nvim-neo-tree/neo-tree.nvim') },
    { src = Github('rachartier/tiny-inline-diagnostic.nvim') },
})

require('lualine').setup({
    options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '▒', right = '▒' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype', 'lsp_status' },
        lualine_y = { 'progress', 'location' },
        lualine_z = { },
    }
})

require('neo-tree').setup({
    sources = {
        'filesystem',
        'document_symbols'
    }
})
vim.keymap.set('n', '<Leader>e',
    ':Neotree filesystem left toggle<CR>',
    { desc = 'Neo-tree: Toggle file explorer' })
vim.keymap.set('n', '<Leader>s',
    ':Neotree document_symbols right toggle<CR>',
    { desc = 'Neo-tree: Toggle symbol explorer' })

require('tiny-inline-diagnostic').setup({
    preset = 'powerline',
    options = {
        throttle = 0,
        multiple_diag_under_cursor = true,
        multilines = { enabled = true },
        show_all_diags_on_cursorline = true,
        enable_on_insert = true,
    },
    signs = {
        left = '▒',
        right = '▒',
        diag = '■',
        arrow = '   ',
    },
})
vim.diagnostic.config({ virtual_text = false })
