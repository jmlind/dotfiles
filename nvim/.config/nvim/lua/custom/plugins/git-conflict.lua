-- Visualize and resolve git merge conflicts
-- https://github.com/akinsho/git-conflict.nvim

vim.pack.add { { src = 'https://github.com/akinsho/git-conflict.nvim', version = vim.version.range '2.*' } }

require('git-conflict').setup {}

require('which-key').add {
  { 'co', desc = 'Git Conflict: [C]hoose [O]urs' },
  { 'ct', desc = 'Git Conflict: [C]hoose [T]heirs' },
  { 'cb', desc = 'Git Conflict: [C]hoose [B]oth' },
  { 'c0', desc = 'Git Conflict: [C]hoose n[0]ne' },
}
