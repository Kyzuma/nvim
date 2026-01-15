return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			close_if_last_window = false, -- don't auto-close when last window
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "left", -- position the tree
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
		},
	},
}
