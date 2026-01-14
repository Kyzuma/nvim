vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Sets leader key to spacebar
vim.g.mapleader = " "

-- Sets local leader key to \
vim.g.maplocalleader = "\\"

-- Enable line number
vim.opt.relativenumber = true

-- Enable error in line highlight
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.opt.cmdheight = 0


