return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- 1. Function to show macro recording status
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return ""
      else
        return "󰑋  Recording @" .. recording_register -- Added an icon for style
      end
    end

    require('lualine').setup({
      options = {
        theme = 'codedark',
        globalstatus = true, -- Keeps bar at the absolute bottom
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 
          'branch', 
          'diff', 
          { 'diagnostics', sources = { 'nvim_diagnostic' } } 
        },
        lualine_c = { 
          { 'filename', path = 1 }, -- Shows relative path (important for large projects)
          { show_macro_recording, color = { fg = "#ff9e64" } } -- Our custom macro indicator
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      }
    })

    -- 2. Refresh lualine immediately when starting/stopping a macro
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        require('lualine').refresh({ place = { "statusline" } })
      end,
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        local timer = vim.loop.new_timer()
        timer:start(50, 0, vim.schedule_wrap(function()
          require('lualine').refresh({ place = { "statusline" } })
        end))
      end,
    })
  end
}
