---@type MappingsTable
local M = {}

function Grep(...)
	local args = table.concat({ ... }, " ")
	local command = "silent grep! " .. args
	vim.cmd(command)
	vim.cmd("copen")
end

-- "call setqflist(map(getqflist(), 'extend(v:val, {"text":get(getbufline(v:val.bufnr, v:val.lnum),0)})'))"

M.general = {
	n = {
		["<leader>gg"] = { "<cmd>LazyGit <CR>" },
		["J"] = { "mzJ`z" },
		["<C-d>"] = { "<C-d>zz" },
		["<C-u>"] = { "<C-u>zz" },
		["n"] = { "nzzzv" },
		["N"] = { "Nzzzv" },
		["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },
		["<leader>d"] = { [["_d]] },
		["<C-k>"] = { "<cmd>cnext<CR>zz" },
		["<C-j>"] = { "<cmd>cprev<CR>zz" },
		["<leader>co"] = { "<cmd>copen<CR>" },
		["<leader>cc"] = { "<cmd>cclose<CR>" },
		["<leader>cx"] = { "<cmd>call setqflist([], 'r')<CR>" },
		["<leader>k"] = { "<cmd>lnext<CR>zz" },
		["<leader>j"] = { "<cmd>lprev<CR>zz" },
		["<leader>u"] = { "<cmd>UndotreeToggle<CR>" },
		-- LspSaga keymaps
		["<leader>lf"] = { "<cmd>Lspsaga finder<CR>" },
		["<leader>lo"] = { "<cmd>Lspsaga outline<CR>" },
		["<leader>lw"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>" },
	},
	v = {
		["J"] = { ":m '>+1<CR>gv=gv" },
		["K"] = { ":m '<-2<CR>gv=gv" },
		["<leader>d"] = { [["_d]] },
	},
	x = {
		["<leader>p"] = { [["_dP]] },
	},
}

-- more keybinds!

return M
