local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

	[[          ▀████▀▄▄              ▄█ ]],
	[[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
	[[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
	[[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
	[[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
	[[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
	[[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
	[[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
	[[   █   █  █      ▄▄           ▄▀   ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
	dashboard.button("p", "  Projects", ":lua require'telescope'.extensions.project.project{}<CR>"),
	dashboard.button("c", "  Neovim Configs", ":e ~/.config/nvim<CR>"),
	dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
	dashboard.button("m", "  Mason", ":Mason <CR>"),
	dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
}

local cow_message = vim.fn.system("fortune -s | cowsay -n"):gsub("\n$", "")

dashboard.section.footer.val = vim.split(cow_message, "\n")

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
