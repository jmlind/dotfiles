-- Fun screensaver-style effects, e.g. :CellularAutomaton make_it_rain
-- https://github.com/eandrju/cellular-automaton.nvim

vim.pack.add { 'https://github.com/eandrju/cellular-automaton.nvim' }

vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = '[M]ake it [R]ain' })
