return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    -- Map filetypes to linters
    lint.linters_by_ft = {
      -- Ansible
      ansible = { "ansible_lint" },
      ["yaml.ansible"] = { "ansible_lint" },

      -- Python
      python = { "flake8" },

      -- JavaScript / TypeScript
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      ["javascriptreact"] = { "eslint_d" },
      ["typescriptreact"] = { "eslint_d" },

      -- Lua
      lua = { "luacheck" },

      -- Shell scripts
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },
    }

    -- Run lint automatically on save or leaving insert mode
    vim.api.nvim_create_autocmd(
      { "BufWritePost", "InsertLeave" },
      {
        callback = function()
          lint.try_lint()
        end,
      }
    )
  end,
}
