require("vim-options")
require("config.filetype")
require("config.lazy")
require("config.keybinds")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("project")
require("config.alpha-config")
vim.o.foldmethod = "syntax" -- or "indent" for indent-based
vim.o.foldlevelstart = 99 -- open all folds on start
vim.o.foldenable = true -- enable folding
