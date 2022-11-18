local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer, close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Reload neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use protected call to avoid error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer not found")
	return
end

-- Have packer use a floating window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Plugins
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "nvim-lua/popup.nvim" } -- Allows plugins to use popups instead of splits
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" } -- Smart commenting
  use { "JoosepAlviste/nvim-ts-context-commentstring" } -- Companion to Comment plugin, sets code language based on context so you can use different comment styles within the same file, based on what's being commented
  use { "kyazdani42/nvim-web-devicons" } -- Adds NerdFont devicon support to Vim for plugins like treesitter to use. Lua fork of Ryanoasis
  use { "kyazdani42/nvim-tree.lua" } -- Lua-based file explorer, replaces NERDTree?
  use { "akinsho/bufferline.nvim" } -- Adds a buffer line at top of nvim, emulates GUI IDEs
	use { "moll/vim-bbye" } -- "Buffer Bye", it removes buffers intelligently and gives user options to do so as well
  use { "nvim-lualine/lualine.nvim" } -- Vim Airline replacement
  use { "akinsho/toggleterm.nvim" } -- Allows persistent and toggle-able terminals within nvim
  use { "ahmedkhalf/project.nvim" } -- Project management? Telescope integration too
  use { "lewis6991/impatient.nvim" } -- Speeds up loading nvim lua modules
  use { "lukas-reineke/indent-blankline.nvim" } -- Auto indents lines, even blank ones
  use { "goolord/alpha-nvim" } -- Greeter for nvim
	use {"folke/which-key.nvim"} -- Keybind helper for commands you're typing

	-- Colorschemes
  use { "EdenEast/nightfox.nvim" }

  -- Statusline
  use { 'feline-nvim/feline.nvim' }

	-- Cmp 
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completions
	use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp" } -- for lsp
	use { "hrsh7th/cmp-nvim-lua" } -- for lsp
  use { "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  } -- rust completions

	-- Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" } -- Highlights other uses of word for LSP

	-- Search-related plugins
	use { "nvim-telescope/telescope.nvim" } -- list FZF
  use { "mileszs/ack.vim" } -- Ack search
  use { "junegunn/fzf",
    run = "./install",
  } -- Classic FZF search

	-- Treesitter
	use {	"nvim-treesitter/nvim-treesitter" } -- better command highlighting

	-- Git
	use { "lewis6991/gitsigns.nvim" } -- git decorations in nvim

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
