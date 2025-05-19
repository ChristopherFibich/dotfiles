vim.g.mapleader = " "

-- cycle through buffers
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { desc = "next buffer"})
vim.keymap.set("n", "<leader>N", ":bprev<CR>", { desc = "last buffer"})
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "delete current buffer"})

vim.opt.autoindent = true
vim.opt.copyindent = true

vim.keymap.set("n", "<C-j>", "o<ESC>", {desc = "insert empty line below"})
vim.keymap.set("n", "<C-k>", "O<ESC>", {desc = "insert empty line above"})



