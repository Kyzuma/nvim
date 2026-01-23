return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = false,
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout" },
		},
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		exclude_ft = { "alpha", "dashboard", "NvimTree", "neo-tree", "toggleterm" },
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
