local vim = vim
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

autocmd("FileReadPost", {
	pattern = "*",
	command = "normal zR",
})

autocmd("BufReadPost", {
	pattern = "*",
	command = "normal zR",
})

opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.completeopt = "noinsert,menuone,noselect"
opt.cursorline = true
opt.expandtab = true
opt.foldmethod = "manual"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.hidden = true
opt.inccommand = "split"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.smarttab = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.title = true
opt.ttimeoutlen = 0
opt.updatetime = 250
opt.wildmenu = true
opt.wrap = true

g.neomake_typescript_enabled_makers = true