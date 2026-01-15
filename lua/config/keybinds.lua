-- Helper
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================
-- Clipboard
-- =========================================================
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to System Clipboard" }) -- Copy to system clipboard
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from System Clipboard" }) -- Paste from system clipboard

-- =========================================================
-- Telescope
-- =========================================================
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope: find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Telescope: live grep" })
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Telescope: Todo" })
map("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>", { desc = "Telescope: Projects" })

-- =========================================================
-- Neo-tree
-- =========================================================
map("n", "<leader>ee", ":Neotree filesystem toggle reveal left<CR>", { desc = "Toggle Neotree" })
map("n", "<leader>ef", ":Neotree focus<CR>", { desc = "Focus Neotree" })

-- =========================================================
-- Barbar (Buffer management)
-- =========================================================
-- Move to previous/next buffer
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Close / pin buffers
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- =========================================================
-- ToggleTerm / Terminal
-- =========================================================
local terminal_count = 0

-- Spawn a new floating terminal
local function new_float_term()
	terminal_count = terminal_count + 1
	vim.cmd("ToggleTerm " .. terminal_count .. " direction=float")
end

-- Toggle / focus last terminal
map("n", "<leader>tf", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Spawn a brand new floating terminal
map("n", "<leader>tt", new_float_term, { desc = "New Floating Terminal" })

-- Terminal buffer selection and naming
map("n", "<leader>ts", "<cmd>TermSelect<CR>", { desc = "Terminal Selection" })
map("n", "<leader>tn", "<cmd>ToggleTermSetName<CR>", { desc = "Terminal Naming" })

-- Terminal navigation / insert mode
map("t", "<leader>q", [[<C-\><C-n><cmd>close<CR>]], opts) -- Close terminal window
map("t", "<Esc><Esc>", [[<C-\><C-n>]], opts)

-- Auto enter insert mode whenever opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.cmd("startinsert")
	end,
})

-- =========================================================
-- Lazy
-- =========================================================
map("n", "<leader>lg", "<Cmd>LazyGit<CR>", opts)
map("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy Package Manager" })

-- =========================================================
-- Mason
-- =========================================================
map("n", "<leader>m", "<Cmd>Mason<CR>", { desc = "Mason" })

-- =========================================================
-- Alpha
-- =========================================================
map("n", "<leader>\\", "<Cmd>Alpha<CR>", { desc = "Dashboard" })
