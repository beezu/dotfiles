local opts = { noremap = true, silent = true }

local term_opts = { silent = true }


-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Map comma as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Ag plugin setting
vim.g.ackprg = "ag --vimgrep --hidden"

-- Leader keys
vim.cmd "nnoremap <leader>a :Ack!<Space>" -- lua method requires <cr> after every cmd
keymap("n", "<leader>f", "<cmd>FZF<cr>", opts)
keymap("n", "<leader>h", "<cmd>new<cr>", opts)
keymap("n", "<leader>v", "<cmd>vnew<cr>", opts)
keymap("n", "<leader>u", "<cmd>Packersync<cr>", opts)
keymap("n", "<leader>d", "<cmd>Lex 30<cr>", opts)
keymap("n", "<leader>e", "<cmd>Explore<cr>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Rebind arrow keys
keymap("n", "j", "h", opts)
keymap("n", "k", "k", opts)
keymap("n", "l", "j", opts)
keymap("n", ";", "l", opts)
keymap("n", "h", "<Nop>", opts)
-- Better window navigation
keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
-- vim.cmd "nnoremap \\[1;5Q <C-w>l" -- lua method broke after setting up. Fixed for now, but leaving this version in case issues return
keymap("n", "\\[1;5Q", "<C-w>l", opts)   -- Bound terminal to treat ctrl+semicolon as ctrl+f2

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Exit insert mode with jj
keymap("i", "jj", "<ESC>", opts)

-- Command --
-- Exit command mode with jj
keymap("c", "jj", "<ESC>", opts)

-- Visual --
-- Rebind arrow keys
keymap("v", "j", "h", opts)
keymap("v", "k", "k", opts)
keymap("v", "l", "j", opts)
keymap("v", ";", "l", opts)
keymap("v", "h", "<Nop>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep yanked text when deleting other text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "L", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-l>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-F2>", "<C-\\><C-N><C-w>l", term_opts)

