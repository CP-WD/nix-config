local keymap = vim.keymap
local vscode = require('vscode')
local opts = { noremap = true, silent = true }

vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "<Space>"

require'hop'.setup {
    quit_key = '<Space>',
}


-- Normal mode mappings
keymap.set("n", "H", "^", opts)
keymap.set("n", "L", "$", opts)

keymap.set("n", "<Leader>h", "<C-w>h", opts)
keymap.set("n", "<Leader>j", "<C-w>j", opts)
keymap.set("n", "<Leader>k", "<C-w>k", opts)
keymap.set("n", "<Leader>l", "<C-w>l", opts)
keymap.set("n", "<Leader>u", "gt", opts)
keymap.set("n", "<Leader>y", "gT", opts)
keymap.set("n", "<Leader>s", ":split<CR>", opts)
keymap.set("n", "<Leader>v", ":vsplit<CR>", opts)

-- Hop mappings
keymap.set("n", "<Leader><Leader>w", ":HopWord<CR>", opts)
keymap.set("n", "<Leader><Leader>l", ":HopLineStart<CR>", opts)
keymap.set("n", "<Leader><Leader>v", ":HopVertical<CR>", opts)


-- Visual mode mappings
keymap.set("v", "<C-h>", "^", opts)
keymap.set("v", "<C-l>", "$", opts)


if vim.g.vscode then
    keymap.set("n", "<Leader>c", function()
        vscode.execute("editor.action.commentLine")
    end  , opts)
else
    -- Insert mode mapping
    keymap.set("i", "kj", "<ESC>", opts)
end
