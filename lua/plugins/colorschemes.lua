return {
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          markdown = { colorscheme = "gruvbox" },
          help = { colorscheme = "catppuccin-mocha", background = "dark" },
        },
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
	opts = { style = "storm" },
    config = function(_, opts)
	  require("tokyonight").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 2000,
	opts = { flavour = "frappe" },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup()
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = "#FFFFFF",
        },

        transparent = true,

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
      require("vscode").load()

      local c = require("vscode.colors").get_colors()
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = c.vscGreen })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.vscYellow })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.vscRed })

      vim.api.nvim_set_hl(0, "SnacksPickerGitStatusAdded", { fg = c.vscGitAdded })
      vim.api.nvim_set_hl(0, "SnacksPickerGitStatusModified", { fg = c.vscGitModified })
      vim.api.nvim_set_hl(0, "SnacksPickerGitStatusDeleted", { fg = c.vscGitDeleted })
      vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = c.vscGitUntracked })
    end,
  },
}
