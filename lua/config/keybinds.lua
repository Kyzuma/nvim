-- Helper
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================
-- Clipboard
-- =========================================================
map({ "n", "v" }, "<leader>y", '"+y', { desc = 'Copy to System Clipboard'})  -- Copy to system clipboard
map({ "n", "v" }, "<leader>p", '"+p', { desc = 'Paste from System Clipboard'})  -- Paste from system clipboard

-- =========================================================
-- Telescope
-- =========================================================
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope: find files' })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope: live grep' })

-- =========================================================
-- Neo-tree
-- =========================================================
map('n', '<leader>e', ':Neotree filesystem reveal left<CR>', { desc = 'File Explorer'})

-- =========================================================
-- Barbar (Buffer management)
-- =========================================================
-- Move to previous/next buffer
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Go to buffer in position 1-9 / last buffer
for i = 1, 9 do
  map('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
end
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Close / pin buffers
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- =========================================================
-- LazyGit
-- =========================================================
map('n', '<leader>lg', '<Cmd>LazyGit<CR>', opts)

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
map("n", "<leader>tf", "<cmd>ToggleTerm<CR>", {desc = "Toggle Terminal"})

-- Spawn a brand new floating terminal
map("n", "<leader>tt", new_float_term, {desc='New Floating Terminal'})

-- Terminal buffer selection and naming
map("n", "<leader>ts", "<cmd>TermSelect<CR>", {desc='Terminal Selection'})
map("n", "<leader>tn", "<cmd>ToggleTermSetName<CR>", {desc='Terminal Naming'})

-- Terminal navigation / insert mode
map("t", "jk", [[<C-\><C-n>]], opts)         -- Exit terminal input mode
map("n", "i", "<cmd>startinsert<CR>", opts)     -- Enter insert mode
map("t", "<leader>q", [[<C-\><C-n><cmd>close<CR>]], opts) -- Close terminal window

-- Auto enter insert mode whenever opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Lazy
map("n", "<leader>ll", "<cmd>Lazy<CR>", {desc = "Lazy Package Manager"})

