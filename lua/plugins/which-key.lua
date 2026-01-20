return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>f", group = "Telescope" },
			{ "<leader>t", group = "Terminal" },
			{ "<leader>e", group = "Neotree", icon = "" },
			{ "<leader>l", group = "Lazy", icon = "󰒲" },
			{ "<leader>c", group = "Copilot", icon = "" },
			{ "<leader>cc", desc = "Copilot Chat", icon = "" },
			{ "<leader>cm", desc = "Copilot Chat Models", icon = "" },
			{ "<leader>cg", desc = "Copilot Git Message", icon = "" },
			{ "<leader>lg", desc = "LazyGit", icon = "" },
			{ "<leader>ll", desc = "Lazy Package Manager", icon = "" },
			{ "<leader>p", desc = "Paste from System Clipboard", icon = "󰆒" },
			{ "<leader>y", desc = "Copy to System Clipboard", icon = "" },
		},
	},
}
