-- Shows number lines on the left
vim.opt.number = true

-- Shows relative number lines, based on where you are
vim.opt.relativenumber = true

-- Wrap text when too long
vim.opt.wrap = true

-- Only works when wrap is on, makes the break nicer around words
vim.opt.linebreak = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Show which column the cursor is on
vim.opt.cursorcolumn = true

-- Allows Vim to make backups of your files
vim.opt.backup = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Enter normal mode with jk
vim.keymap.set('i', 'jk', '<Esc>')

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = 'a'

-- Make search case sensitive or insensitive
vim.opt.ignorecase = true

-- Only works if ignorecase is enabled
vim.opt.smartcase = true

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- Saves undo history after you close Nvim, great for long term editing
vim.opt.undofile = true

-- Find out where the undo directory is located on your system
:echo &undodir

-- Shows diagnostics and stuff
vim.opt.signcolumn = 'yes'

-- Add abbreviations
vim.cmd [[
  iabbrev @@ your@email.com
]]

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Auto insert stuff
vim.keymap.set('i', '(', '()<Esc>i')
vim.keymap.set('i', '[', '[]<Esc>i')
vim.keymap.set('i', '{', '{}<Esc>i')

-- Auto insert stuff specifically for C file types
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.keymap.set('i', '(', '() {<Esc>i', { buffer = 0 })
  end,
})

-- Auto insert stuff specifically for files ending in the .c extension
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.c",
  callback = function()
    vim.keymap.set('i', '(', '()<Esc>i', { buffer = true })
    vim.keymap.set('i', '[', '[]<Esc>i', { buffer = true })
    vim.keymap.set('i', '{', '{}<Esc>i', { buffer = true })
  end,
})

-- Set your leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Delete without yanking
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Allow Neovim to share a clipboard with your OS
vim.opt.clipboard = 'unnamedplus'

-- Open a Terminal in a different window
vim.keymap.set('n', '<leader>a', ':split | terminal<CR>', { desc = 'Open a termin[a]l' })

-- Insert C boilerplate
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.c',
  callback = function()
    vim.keymap.set('n', '<leader>bc', 'i#include <stdio.h><CR><CR>int main() {<CR>}<Esc>O', { buffer = true }, { desc = '[B]oilerplate [C]' })
  end,
})

-- Move lines around
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')

-- Enable spelling
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }
vim.keymap.set('n', '<leader>st', ':set spell!<CR>', { desc = 'Spelling toggle' })
vim.keymap.set('n', '<leader>su', 'z=', { desc = 'Spelling suggestions' })
vim.keymap.set('n', '<leader>sf', ']s', { desc = 'Next spelling mistake' })
vim.keymap.set('n', '<leader>sb', '[s', { desc = 'Previous spelling mistake' })

-- This enables you to execute  code, depending on which file type you're in
vim.keymap.set('n', '<leader>er', ':w<CR>:!ruby %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ep', ':w<CR>:!python %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ec', ':w<CR>:!gcc % -o %:r && ./%:r<CR>', { noremap = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Wrap visual selection in quotation marks or brackets
vim.keymap.set('v', "<leader>'", "c''<Esc>P")
vim.keymap.set('v', '<leader>"', 'c""<Esc>P')
vim.keymap.set('v', '<leader>(', 'c()<Esc>P')
vim.keymap.set('v', '<leader>)', 'c()<Esc>P')
vim.keymap.set('v', '<leader>[', 'c[]<Esc>P')
vim.keymap.set('v', '<leader>]', 'c[]<Esc>P')
vim.keymap.set('v', '<leader>{', 'c{}<Esc>P')
vim.keymap.set('v', '<leader>}', 'c{}<Esc>P')

-- Paste hyperlinks for Markdown
vim.keymap.set('n', '<leader>li', 'i[]()<Left><Left><Left><Esc>a')
vim.keymap.set('v', '<leader>li', '"ac[<C-r>"]()<Esc><Left>a')
vim.keymap.set('n', '<leader>lp', 'i[]()<Left><Esc>pF[a')
vim.keymap.set('v', '<leader>lp', '"ac[<C-r>"]()<Esc><Left>p')

-- Exit Neovim in style
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Force Quit' })
