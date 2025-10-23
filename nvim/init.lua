-- Import? lazy vim
require('custom.lazy')

vim.cmd.colorscheme "gruvbox-material"

-- Neovim options ----------------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.scrolloff = 8             -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8         -- Keep 8 columns visible right of the cursor

vim.opt.clipboard = 'unnamedplus' -- Use systems clipboard
vim.opt.hidden = true             -- Allow switching buffers without saving

vim.opt.wrap = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit", "org", "typ", "typst" }, -- File types where wrapping is enabled
  callback = function()
    vim.opt_local.wrap = true                                           -- Enable wrapping
    vim.opt_local.linebreak = true                                      -- Wrap at word boundaries
  end,
})

vim.opt.tabstop = 2

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.smartindent = true -- Auto-indent new lines based on context
vim.opt.autoindent = true  -- Maintain indent of the current line

vim.opt.updatetime = 300   -- Faster completion and diagnostics updates

vim.opt.signcolumn = "yes"

vim.opt.mouse = 'a'

-- Make bindings work with wrapped text
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
vim.keymap.set('v', 'j', 'gj', { silent = true })
vim.keymap.set('v', 'k', 'gk', { silent = true })
vim.keymap.set('o', 'j', 'gj', { silent = true })
vim.keymap.set('o', 'k', 'gk', { silent = true })
----------------------------------------------------------------------------------------------
vim.o.timeoutlen = 1500

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>') -- Command to source file
vim.keymap.set('n', '<leader>x', ':.lua<CR>')                 -- Run/execute single line
vim.keymap.set('v', '<leader>x', ':lua<Cr>')                  -- Run/ execute selected lines

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Terminal shortcuts
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set('n', '<leader>t', function() -- use <C-d> to kill that terminal
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 10)
end)

vim.keymap.set('n', '-', '<cmd>Oil<CR>')

-- Run diagnostics
vim.keymap.set('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>')
