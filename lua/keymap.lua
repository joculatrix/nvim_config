vim.g.mapleader = ' '

vim.pack.add({{ src = Github('folke/which-key.nvim') }})
require('which-key').setup({
    preset = 'helix',
    show_help = false,
    show_keys = false,
    spec = {
        { '<Leader>b', group = 'Buffer' },
        { '<Leader>c', group = 'Code' },
        { '<Leader>w', group = 'Window' }
    }
})

-- WINDOW/BUFFER KEYMAPS

vim.keymap.set('n', '<Leader>wh',
    '<C-w>h',
    { desc = 'Switch window (left)' })
vim.keymap.set('n', '<Leader>wj',
    '<C-w>j',
    { desc = 'Switch window (down)' })
vim.keymap.set('n', '<Leader>wk',
    '<C-w>k',
    { desc = 'Switch window (up)' })
vim.keymap.set('n', '<Leader>wl',
    '<C-w>l',
    { desc = 'Switch window (right)'})
vim.keymap.set('n', '<Leader>ws',
    ':split<CR>',
    { desc = 'Split window (horizontal)' })
vim.keymap.set('n', '<Leader>wv',
    ':vsplit<CR>',
    { desc = 'Split window (vertical)' })
vim.keymap.set('n', '<Leader>wd',
    '<C-w>q',
    { desc = 'Quit window' })
vim.keymap.set('n', '<Leader>wq',
    '<C-w>q',
    { desc = 'Quit window' })
vim.keymap.set('n', '<Leader>bd',
    ':bdelete<CR>',
    { desc = 'Delete buffer' })
vim.keymap.set('n', '<Leader>bD',
    ':bdelete!<CR>',
    { desc = 'Delete buffer (force)' })
vim.keymap.set('n', '<C-h>',
    ':bprevious<CR>',
    { desc = 'Prev buffer' })
vim.keymap.set('n', '<C-l>',
    ':bnext<CR>',
    { desc = 'Next buffer' })
