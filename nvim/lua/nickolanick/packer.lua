-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Devicons
    use { 'nvim-tree/nvim-web-devicons'}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Colorscheme
	use { "ellisonleao/gruvbox.nvim" }
	use { 'rose-pine/neovim', as = 'rose-pine' }
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "folke/tokyonight.nvim", as = "tokyonight" }
	use {  "rebelot/kanagawa.nvim", as = "kanagwa" }

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
	-- Used with lsp for code diagnostics and formating
	use { "jose-elias-alvarez/null-ls.nvim" }
	-- Inegrate nvim with tmux
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
	-- Terminal integration plugin
	use {"akinsho/toggleterm.nvim", tag = '*'}
	-- Bufferline -> tabs for neovim
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use {'famiu/bufdelete.nvim'}
	-- Shows git changes
	--  use {'airblade/vim-gitgutter'}
	-- Async lib
	use "nvim-lua/plenary.nvim"

	use {
		"nvim-neotest/neotest",
		requires = {
		"nvim-neotest/neotest-go",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter"
		}
	}
end)
