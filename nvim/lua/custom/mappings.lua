local M = {}

M.general = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGit <CR>" },
    ["x"] = { '"_x' },
    ["<leader>+"] = { "<C-a>" },
    ["<leader>-"] = { "<C-x>" },
    ["<leader>sv"] = { "<C-w>v" },
    ["<leader>sh"] = { "<C-w>s" },
    ["<leader>se"] = { "<C-w>=" },
    ["<leader>sx"] = { "<cmd>close<CR>" },
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

return M
