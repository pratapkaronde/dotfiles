return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"html",
					"clangd",
					"gopls",
					"pyright",
					"ruff",
					"pylyzer",
					"java_language_server",
					"jsonls",
					"lemminx",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			--- Enable Language Servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("html")
			vim.lsp.enable("gopls")
			vim.lsp.enable("java_language_server")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("lemminx")

			-- Configure Key mappings

			-- Confiugre key for hover help
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			--- Configure key for go-to-defination
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

			-- Configure key for code actions
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
