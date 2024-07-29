require("lazy").setup({
--put plugins here
  "folke/which-key.nvim",
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  "startup-nvim/startup.nvim",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
	  'nvim-treesitter/nvim-treesitter',
	  config = function()
		  vim.cmd("TSUpdate")
	  end,
  },
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "lewis6991/gitsigns.nvim", 
  --"projekt0n/github-nvim-theme",
  "savq/melange-nvim",
  {
  	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig",}
  },
  {
	"hrsh7th/nvim-cmp",
	dependencies = {"hrsh7th/cmp-nvim-lsp"},
  },
})
