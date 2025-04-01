vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Devicons
	use { 'nvim-tree/nvim-web-devicons'}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = {
		  "nvim-telescope/telescope-fzf-native.nvim",
		  build = "make",
		  config = function()
		    require("telescope").load_extension("fzf")
		  end,
		},
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Colorscheme
	use { "ellisonleao/gruvbox.nvim" }
	use { 'rose-pine/neovim', as = 'rose-pine' }
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "folke/tokyonight.nvim", as = "tokyonight" }
	use { "rebelot/kanagawa.nvim", as = "kanagwa" }

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- Go
	use "fatih/vim-go"
	-- LSP config
	-- TODO: remove lsp-zero, configure from scratch
	-- TODO: figure out how this LSP magic works
	 use {
	   'VonHeikemen/lsp-zero.nvim',
	   branch = 'v2.x',
	   requires = {
	     -- LSP Support
	     {'neovim/nvim-lspconfig'},             -- Required
	     {                                      -- Optional
	       'williamboman/mason.nvim',
	       run = function()
	         pcall(vim.cmd, 'MasonUpdate')
	       end,
	     },
	     {'williamboman/mason-lspconfig.nvim'}, -- Optional
	     -- Autocompletion
	     {'hrsh7th/nvim-cmp'},     -- Required
	     {'hrsh7th/cmp-nvim-lsp'}, -- Required
	     {'L3MON4D3/LuaSnip'},     -- Required
	   }
	 }
	-- Used with lsp for code diagnostics and formatting
	use { "jose-elias-alvarez/null-ls.nvim" }
	-- Integrate nvim with tmux
	use { "alexghergh/nvim-tmux-navigation" }
	-- Nvim-tree plugin
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
		config = function()
			require("nvim-tree").setup {}
		end
	}
	-- Bufferline -> tabs for neovim
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use {'famiu/bufdelete.nvim'}
	-- Async lib
	use "nvim-lua/plenary.nvim"
	-- NeoTest
	use {
		"nvim-neotest/neotest",
		requires = {
		"nvim-neotest/neotest-go",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"Antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter"
		}
	}
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
end)
