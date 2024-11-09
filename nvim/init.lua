-- sources required files
require("config.keybinds")
require("config.lazy")
-- changes background color to terminal background color
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
-- configures line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")
--turns off bottom line
vim.cmd("set noshowmode")
vim.cmd("set cmdheight=0")
