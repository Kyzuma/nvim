-- alpha-config.lua

local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

----------------------------------------------------------------
-- Header (responsive)
----------------------------------------------------------------
local large_header = {
	[[⠁⠩⢍⢎⣰⣷⣦⣾⣿⣟⡿⠿⠇⠀⠀⠈⠛⠹⠿⠋⠛⣻⣿⣿⣿⣷⣿⠘⣸⡏]],
	[[⢠⠂⢊⣷⣿⡿⠿⠿⣟⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣿⣿⣿⡿⢿⣿⢠⢃⡎]],
	[[⢀⢊⣽⣼⣾⣿⡦⠀⠈⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠠⠁⣿⣿⣵⣿⡷⣥⠶⡼]],
	[[⡌⣠⠚⣿⣿⡿⠂⠀⠀⠀⠀⠀⠀⠀⠅⠀⢒⠀⠀⠀⠀⠀⣾⣿⣿⣿⡿⣫⣡⣷]],
	[[⡚⡌⢿⣾⣻⣿⣅⠀⠀⠀⠢⣤⣴⣴⣶⣶⣿⠳⠀⠀⠀⠀⣠⣽⣿⣟⡿⣡⣿⣿]],
	[[⣹⣞⠾⣿⣿⣿⣮⡀⠀⠀⢸⡿⠿⢿⢿⢟⣛⣧⡥⠀⠀⠰⣿⣿⣿⣟⣾⣿⣿⣿]],
	[[⣅⢻⣷⡽⣿⣿⣿⣿⣦⠀⠀⡩⠅⠍⢈⣮⣐⣘⣱⡀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣖⠀⢫⡻⣿⠟⣨⣿⣍⠋⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⣀⠙⢟⣮⣵⣙⠅⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠶⢠⢪⣩⠅⠂⠾⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⢑⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⡀⠀⠀⠀⠈⠀⠀⢀⣴⣜⣻⢿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⠟⠉⠀⢡⣾⣿⠃⠀⠀⠀⢀⠀⠀⠁⣿⣮⡲⠤⠌⠙⠻⣿⣿⣿⣿]],
}

dashboard.section.header.val = (vim.o.columns < 100) and { "Neovim" } or large_header

dashboard.section.header.opts.hl = "Include"

----------------------------------------------------------------
-- Buttons
----------------------------------------------------------------
local function btn(sc, txt, cmd)
	return dashboard.button(sc, "  " .. txt .. "  ", cmd)
end

dashboard.section.buttons.val = {
	btn("f", "󰈞 Find file", ":Telescope find_files<CR>"),
	btn("p", " Projects", ":lua require'telescope'.extensions.project.project{}<CR>"),
	btn("c", " Config", ":e ~/.config/nvim<CR>"),
	btn("l", "󰒲 Lazy", ":Lazy<CR>"),
	btn("m", " Mason", ":Mason<CR>"),
	btn("q", "󰩈 Quit", ":qa<CR>"),
}

dashboard.section.buttons.opts.hl = "Keyword"

----------------------------------------------------------------
-- Footer (startup stats)
----------------------------------------------------------------
dashboard.section.footer.val = function()
	local ok, lazy = pcall(require, "lazy.stats")
	if not ok then
		return { "Neovim is ready" }
	end

	local stats = lazy.stats()
	if stats.startuptime == 0 then
		return { "Loading plugins…" }
	end

	return {
		string.format("Neovim loaded %d plugins in %.2fms", stats.count, stats.startuptime),
	}
end

dashboard.section.footer.opts.hl = function()
	local t = require("lazy.stats").stats().startuptime
	if t == 0 then
		return "Comment"
	elseif t < 40 then
		return "String"
	elseif t < 80 then
		return "Type"
	else
		return "WarningMsg"
	end
end

----------------------------------------------------------------
-- Footer 2 (centered date + version)
----------------------------------------------------------------
dashboard.section.footer2 = {
	type = "text",
	val = {
		string.format(" %s  |   %s.%s", os.date("%d/%m/%Y"), vim.version().major, vim.version().minor),
	},
	opts = {
		position = "center",
		hl = "Comment",
	},
}

----------------------------------------------------------------
-- Layout
----------------------------------------------------------------
dashboard.config.layout = {
	{ type = "padding", val = 2 },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
	dashboard.section.footer2,
}

----------------------------------------------------------------
-- Redraw Alpha after Lazy finishes
----------------------------------------------------------------
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		pcall(vim.cmd.AlphaRedraw)
	end,
})

----------------------------------------------------------------
-- Setup
----------------------------------------------------------------
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
