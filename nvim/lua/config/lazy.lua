--[[
      ___       ___           ___           ___     
     /\__\     /\  \         /\  \         |\__\    
    /:/  /    /::\  \        \:\  \        |:|  |   
   /:/  /    /:/\:\  \        \:\  \       |:|  |   
  /:/  /    /::\~\:\  \        \:\  \      |:|__|__ 
 /:/__/    /:/\:\ \:\__\ _______\:\__\     /::::\__\
 \:\  \    \/__\:\/:/  / \::::::::/__/    /:/~~/~   
  \:\  \        \::/  /   \:\~~\~~       /:/  /     
   \:\  \       /:/  /     \:\  \        \/__/      
    \:\__\     /:/  /       \:\__\                  
     \/__/     \/__/         \/__/                  
--]]


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Default setup, I can't get this to work
--require("lazy").setup({
	--spec = {
    	-- import your plugins
    	--{ import = "config.plugins" },
  	--},
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  --install = { colorscheme = { "carbonized-dark" } },
  -- automatically check for plugin updates
  --checker = { enabled = true },
--})
-- Setup that should work, loads plugins from ~/.config/nvim/lua/config/plugins/init.lua or ~/.config/nvim/lua/config/plugins.lua
require("lazy").setup("config.plugins")
