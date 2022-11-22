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
	-- Core --
	use({ "wbthomason/packer.nvim", -- Have packer manage itself
    commit = "6afb67460283f0e990d35d229fd38fdc04063e0a",
  })
  use({          -- Useful lua functions used by lots of plugins
    "nvim-lua/plenary.nvim",
    commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
  })
  use({          -- Allows plugins to use popups instead of splits
    "nvim-lua/popup.nvim",
    commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
  })
  --[[ use({          -- Keybind helper for commands you're typing ]]
  --[[   "folke/which-key.nvim", ]]
  --[[   commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9", ]]
  --[[ }) ]]
  use({          -- Lua-based file explorer
    "nvim-tree/nvim-tree.lua",
    commit = "68a2a0971eb50f13e4d54498a2add73f131b9a85",
  })
  use({          -- Allows persistent and toggle-able terminals within nvim
    "akinsho/toggleterm.nvim",
    commit = "3ba683827c623affb4d9aa518e97b34db2623093",
  })
	-- use({ "lewis6991/impatient.nvim" }) -- Speeds up loading nvim lua modules
	-- use({ "goolord/alpha-nvim" }) -- Greeter for nvim

	-- Bufferline --
  use({          -- Adds a buffer line at top of nvim, emulates GUI IDEs
    "akinsho/bufferline.nvim",
    commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363",
  })
  use({          -- "Buffer Bye", it removes buffers intelligently and gives user options to do so as well
    "moll/vim-bbye",
    commit = "25ef93ac5a87526111f43e5110675032dbcacf56",
  })

  --[[ use({          -- Project management? Telescope integration too ]]
  --[[   "ahmedkhalf/project.nvim", ]]
  --[[   commit = "", ]]
  --[[ }) ]]

	-- Theming --
	-- Colorschemes
  use({          --Includes several themes, see website
    "EdenEast/nightfox.nvim",
    commit = "741366250cff3aa7b85d6588ffc9db60ebbfdcc9",
  })

	-- Statusline
	use({
    "feline-nvim/feline.nvim",
    commit = "6d4e3f934bffaa1893a690cd9b8f8b584ef0a7ea",
  })

	-- Characters
  use({          -- Adds NerdFont devicon support to Vim for plugins like treesitter to use. Lua fork of Ryanoasis
    "kyazdani42/nvim-web-devicons",
    commit = "3b1b794bc17b7ac3df3ae471f1c18f18d1a0f958",
  })

	-- Completions and Linting --
	-- Cmp
  use({          -- The completion plugin
    "hrsh7th/nvim-cmp",
    commit = "8a9e8a89eec87f86b6245d77f313a040a94081c1",
  })
  use({          -- buffer completions
    "hrsh7th/cmp-buffer",
    commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
  })
  use({          -- path completions
    "hrsh7th/cmp-path",
    commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
  })
  use({          -- cmdline completions
    "hrsh7th/cmp-cmdline",
    commit = "8bc9c4a34b223888b7ffbe45c4fe39a7bee5b74d",
  })
  use({          -- snippet completions
    "saadparwaiz1/cmp_luasnip",
    commit = "18095520391186d634a0045dacaa346291096566",
  })
  use({          -- for lsp
    "hrsh7th/cmp-nvim-lsp",
    commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb",
  })
  use({          -- for lsp
    "hrsh7th/cmp-nvim-lua",
    commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
  })
  use({          -- Crates.io dependency helper + crates completions
		"saecki/crates.nvim",
    commit = "e11e27864428a68b25e43b833e9081e350a38d96",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	})
  use({          -- Autopairs, integrates with both cmp and treesitter
    "windwp/nvim-autopairs",
    commit = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4",
  })

	-- Snippets
  use({          --snippet engine
    "L3MON4D3/LuaSnip",
    commit = "09ce9a70bd787d4ce188f2de1390f656f119347c",
  })
  use({          -- a bunch of snippets to use
    "rafamadriz/friendly-snippets",
    commit = "ef8caa5002e53977779ce8ab18a9c393ed624386",
  })

	-- LSP
  use({          -- enable LSP
    "neovim/nvim-lspconfig",
    commit = "ea5744f9243ec25a178a0bc403a4c8203ecc4f23",
  })
  use({          -- simple to use language server installer
    "williamboman/mason.nvim",
    commit = "9f84d49d33a790fb6d0fe23371c662cf77957ec5",
  })
	use({
    "williamboman/mason-lspconfig.nvim",
    commit = "a1e2219ecea273d52b1ce1d527dd3a93cfe5b396",
  })
  use({          -- for formatters and linters
    "jose-elias-alvarez/null-ls.nvim",
    commit = "07d4ed4c6b561914aafd787453a685598bec510f",
  })
  use({          -- Highlights other uses of word for LSP
    "RRethy/vim-illuminate",
    commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3",
  })

	-- Misc
  use({          -- Auto indents lines, even blank ones
    "lukas-reineke/indent-blankline.nvim",
    commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6",
  })
  use({          -- Smart commenting
    "numToStr/Comment.nvim",
    commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d",
  })
  use({          -- Companion to Comment plugin, sets code language based on context so you can use different comment styles within the same file, based on what's being commented
    "JoosepAlviste/nvim-ts-context-commentstring",
    commit = "32d9627123321db65a4f158b72b757bcaef1a3f4",
  })

	-- Telescope search --
  use({          -- Telescope search
    "nvim-telescope/telescope.nvim",
    commit = "7a4ffef931769c3fe7544214ed7ffde5852653f6",
  })
  use({          -- Clipboard/Macro history, searchable with Telescope
		"AckslD/nvim-neoclip.lua",
    commit = "3e0b9a134838c7356d743f84a272c92410c47d8d",
		config = function()
			require("neoclip").setup()
		end,
	})

	-- Treesitter --
  use({          -- better highlighting
		"nvim-treesitter/nvim-treesitter",
    commit = "be5ed65f7f4a2266447651d480215bcda04b8842",
		run = ":TSUpdate",
	})
  use({          -- Rainbow parentheses for treesitter
    "p00f/nvim-ts-rainbow",
    commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750",
  })

	-- Git --
  use({          -- git decorations in nvim
    "lewis6991/gitsigns.nvim",
    commit = "9ff7dfb051e5104088ff80556203634fc8f8546d",
  })

	-- Debugger --
	use({
    "mfussenegger/nvim-dap",
    commit = "61643680dcb771a29073cd432894e2f81a7c2ae3",
  })
	-- Debugger UI --
	use({
		"rcarriga/nvim-dap-ui",
    commit = "69a39820656af5f286d2ea0664f0f7bb52782c4f",
		requires = { "mfussenegger/nvim-dap" },
	})
	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
