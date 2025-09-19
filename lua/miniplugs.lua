vim.pack.add({
    { src = Github('echasnovski/mini.completion') },
    { src = Github('echasnovski/mini.diff') },
    { src = Github('echasnovski/mini.extra') },
    { src = Github('echasnovski/mini-git') },
    { src = Github('echasnovski/mini.indentscope') },
    { src = Github('echasnovski/mini.notify') },
    { src = Github('echasnovski/mini.pairs') },
    { src = Github('echasnovski/mini.pick') },
    { src = Github('echasnovski/mini.starter') },
    { src = Github('echasnovski/mini.tabline') },
})

require('mini.completion').setup()
require('mini.diff').setup()
require('mini.git').setup()
require('mini.indentscope').setup()
require('mini.notify').setup()
require('mini.pairs').setup()

require('mini.pick').setup()
vim.keymap.set('n', '<Leader>u',
    ':Pick colorschemes<CR>',
    { desc = 'Pick colorscheme' })
vim.keymap.set('n', '<Leader>f',
    ':Pick files<CR>',
    { desc = 'Pick files' })
vim.keymap.set('n', '<Leader>g',
    ':Pick grep<CR>',
    { desc = 'Grep' })
vim.keymap.set('n', '<Leader>h',
    ':Pick help<CR>',
    { desc = 'Help' })

require('mini.tabline').setup()
require('mini.extra').setup()

local starter = require('mini.starter')
if pcall(require, 'dash') then
    local dash = require('dash')
    starter.setup({
        header = dash.header,
        footer = dash.footer,
        content_hooks = {
            starter.gen_hook.adding_bullet('░ ', false),
            starter.gen_hook.aligning('center', 'center'),
        },
    })
else
    starter.setup()
end
