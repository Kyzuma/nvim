-- Ansible filetype detection
vim.filetype.add({
	pattern = {
		-- Detect ansible files by path patterns
		[".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
		[".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
		[".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
		[".*ansible.*%.ya?ml"] = "yaml.ansible",
		[".*/inventory/.*%.ya?ml"] = "yaml.ansible",
	},
	filename = {
		-- Common ansible filenames
		["playbook.yml"] = "yaml.ansible",
		["playbook.yaml"] = "yaml.ansible",
		["site.yml"] = "yaml.ansible",
		["site.yaml"] = "yaml.ansible",
		["main.yml"] = function(path, bufnr)
			-- Only set yaml.ansible if in an ansible-like directory
			if path:match("roles/") or path:match("tasks/") or path:match("handlers/") then
				return "yaml.ansible"
			end
		end,
		["main.yaml"] = function(path, bufnr)
			if path:match("roles/") or path:match("tasks/") or path:match("handlers/") then
				return "yaml.ansible"
			end
		end,
	},
})

-- Also check file content for ansible indicators
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.yml", "*.yaml" },
	callback = function()
		local lines = vim.api.nvim_buf_get_lines(0, 0, 50, false)
		for _, line in ipairs(lines) do
			-- Check for common ansible keywords
			if
				line:match("^%s*-%s*hosts:")
				or line:match("^%s*-%s*name:")
				or line:match("^%s*tasks:")
				or line:match("^%s*handlers:")
				or line:match("^%s*roles:")
				or line:match("^%s*vars:")
				or line:match("ansible")
			then
				vim.bo.filetype = "yaml.ansible"
				return
			end
		end
	end,
})
