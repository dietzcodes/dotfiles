--      ___         ___  ___         ___                   ___         ___     
--     /\  \       /\__\/\__\       /\  \        ___      /\__\       /\  \    
--    /::\  \     /:/  /:/  /      /::\  \      /\  \    /::|  |     /::\  \   
--   /:/\:\  \   /:/  /:/  /      /:/\:\  \     \:\  \  /:|:|  |    /:/\ \  \  
--  /::\~\:\  \ /:/  /:/  /  ___ /:/  \:\  \    /::\__\/:/|:|  |__ _\:\~\ \  \ 
-- /:/\:\ \:\__/:/__/:/__/  /\__/:/__/_\:\__\__/:/\/__/:/ |:| /\__/\ \:\ \ \__\
-- \/__\:\/:/  \:\  \:\  \ /:/  \:\  /\ \/__/\/:/  /  \/__|:|/:/  \:\ \:\ \/__/
--      \::/  / \:\  \:\  /:/  / \:\ \:\__\ \::/__/       |:/:/  / \:\ \:\__\  
--       \/__/   \:\  \:\/:/  /   \:\/:/  /  \:\__\       |::/  /   \:\/:/  /  
--                \:\__\::/  /     \::/  /    \/__/       /:/  /     \::/  /   
--                 \/__/\/__/       \/__/                 \/__/       \/__/    

-- **Setup plugins here**

-- setup function to get current user
local function getUser()
	local handle = io.popen("whoami")
	local result = handle:read()
	handle:close()
	return "hello " .. result
end
-- install and setup plugins here
return {

	{"nightsense/carbonized",
	config = function()
      		-- load the colorscheme here
      		vim.cmd("colorscheme carbonized-dark")
    	end,
	},

	{"m4xshen/autoclose.nvim",
	opts = {}
	},
	{"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	-- setup keymaps for telescope, why it only works here is beyond me
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end,

	},

	{"nvim-treesitter/nvim-treesitter",
	config = function()
		vim.cmd("TSUpdate")
	end,
	opts = {
		ensure_installed = {"c", "lua", "python", "markdown", "javascript"}
	},
	},
	
	--{'goolord/alpha-nvim',
	--config = function ()
        	--require'alpha'.setup(require'alpha.themes.dashboard'.config)
    	--end,
	--},
	-- needed for full functionality in alpha-nvim
	--{"Shatur/neovim-session-manager",
	-- idk how this works compared to just using opts but just leave it
		--config = function()
			--local config = require('session_manager.config')
			--require('session_manager').setup({
				 --autoload_mode = config.AutoloadMode.Disabled
			--})
		--end,
	
	--},
	--{'nvimdev/dashboard-nvim',
	--event = 'VimEnter',
	--opts = {
		--theme = 'doom',
		--config = {
			--header = {
     --"___           ___           ___        	 ___     		   ___", 
    --"             /\\__\\         /\\  \\         /\\  \\         /\\__\\          ___        /\\__\\ ",    
    --"            /::|  |       /::\\  \\       /::\\  \\       /:/  /         /\\  \\      /::|  |",  
   --"           /:|:|  |      /:/\\:\\  \\     /:/\\:\\  \\     /:/  /          \\:\\  \\    /:|:|  |",   
  --"            /:/|:|  |__   /::\\~\\:\\  \\   /:/  \\:\\  \\   /:/__/  ___      /::\\__\\  /:/|:|__|__", 
 --"             /:/ |:| /\\__\\ /:/\\:\\ \\:\\__\\ /:/__/ \\:\\__\\  |:|  | /\\__\\  __/:/\\/__/ /:/ |::::\\__\\ ",
 --"             \\/__|:|/:/  / \\:\\~\\:\\ \\/__/ \\:\\  \\ /:/  /  |:|  |/:/  / /\\/:/  /    \\/__/~~/:/  / ",
     --"                |:/:/  /   \\:\\ \\:\\__\\    \\:\\  /:/  /   |:|__/:/  /  \\::/__/           /:/  / ", 
     --"               |::/  /     \\:\\ \\/__/     \\:\\/:/  /     \\::::/__/    \\:\\__\\          /:/  / ",  
     --"               /:/  /       \\:\\__\\        \\::/  /       ~~~~         \\/__/         /:/  / ",  
     --"                 \\/__/         \\/__/         \\/__/                                   \\/__/    "},
--		},
--	},
 -- dependencies = {{'nvim-tree/nvim-web-devicons'}},
--	},

	{'nvim-lualine/lualine.nvim',
    	dependencies = {'nvim-tree/nvim-web-devicons'},
	opts = {
		options = {
			theme = "gruvbox",
			component_separators = { left = '-', right = '-'},
    			section_separators = { left = '', right = ''},

		},
		sections = {
    			lualine_a = {'mode'},
    			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename','filetype', 'filesize'},
    			--lualine_x = {'encoding', 'fileformat', 'filetype'},	
    			lualine_x = { getUser },
			lualine_y = {'progress'},
    			lualine_z = {'location'}
  			},
		},
	},
}
