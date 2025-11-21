return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = { only_current_line = false, },
        underline = true,
        signs = true,
		update_in_insert = false,
      },
      inlay_hints = { enabled = true },
	  servers = {
		basedpyright = {
          settings = {
            python = {
              analysis = {
                inlayHints = {
                  functionReturnTypes = true,
                  callArgumentNames = "partial",
                  variableTypes = false,
                },
              },
            },
          },
		}
	  }
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
    end,
  },
}
