-- Edit your filesystem like a normal Neovim buffer
-- https://github.com/stevearc/oil.nvim

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  delete_to_trash = true,
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = { show_hidden = true },
  keymaps = {
    ['<C-s>'] = false,
    ['<C-h>'] = false,
    ['<C-l>'] = false,
    ['<A-d>'] = 'actions.close',
    ['<A-w>'] = 'actions.preview',
    ['<C-x>'] = 'actions.select_split',
    ['<C-v>'] = 'actions.select_vsplit',
  },
}

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
