return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			model = "gpt-4.1",

			-- Best for infra / ansible / config work
			temperature = 0.0,

			auto_insert_mode = true,

			window = {
				layout = "float", -- float is least disruptive
				width = 90, -- wider = better for YAML & playbooks
				height = 25,
				border = "rounded",
				title = " Copilot Chat ",
				-- zindex = 100,
			},

			headers = {
				user = "You",
				assistant = "Copilot",
				tool = "Tool",
			},

			separator = "─",

			-- Folding keeps chat readable over time
			auto_fold = true,

			-- Better for copy/paste into buffers
			show_folds = false,

			-- Keeps context relevant when editing files
			context = {
				enabled = true,
				max_tokens = 2048,
			},
		},
	},
}
