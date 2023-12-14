-- set leader key to space
vim.g.mapleader = " "

local k = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------
-- use jk to exit insert mode
k.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
k.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
k.set("n", "x", '"_x')

-- increment/decrement numbers
k.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
k.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
k.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
k.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
k.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

k.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
k.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
k.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
k.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
k.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

k.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close the currnet buffer" })
k.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazy Git" })
k.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diff View Open" })
k.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diff View History" })
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")
k.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
k.set("n", "<leader>d", [[_d]])
k.set("n", "<C-k>", "<cmd>cnext<CR>zz")
k.set("n", "<C-j>", "<cmd>cprev<CR>zz")
k.set("n", "<leader>co", "<cmd>copen<CR>")
k.set("n", "<leader>cc", "<cmd>cclose<CR>")
k.set("n", "<leader>cx", "<cmd>call setqflist([], 'r')<CR>")
k.set("n", "<leader>k", "<cmd>lnext<CR>zz")
k.set("n", "<leader>j", "<cmd>lprev<CR>zz")
k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("v", "K", ":m '<-2<CR>gv=gv")
k.set("v", "<leader>d", [["_d]])
k.set("x", "<leader>p", [["_dP]])
k.set("n", "<TAB>", "<cmd>bn<CR>")
k.set("n", "<S-TAB>", "<cmd>bp<CR>")
k.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
k.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
k.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
k.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})
