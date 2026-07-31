-- Quick file marks and jumps
-- https://github.com/ThePrimeagen/harpoon
-- NOTE: harpoon2 requires plenary.nvim, already installed by the Telescope section

vim.pack.add { { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' } }

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = '[A]ppend to harpoon list' })
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle harpoon quick menu' })

vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon to file 1' })
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon to file 2' })
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon to file 3' })
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon to file 4' })
