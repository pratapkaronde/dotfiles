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
					-- "java_language_server",
					"jsonls",
					"lemminx",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure borders for LSP floating windows
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = "rounded"
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			vim.diagnostic.config({ float = { border = "rounded" } })

			--- Enable Language Servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("html")
			vim.lsp.enable("gopls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("ruff")
			-- vim.lsp.enable("java_language_server")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("lemminx")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
			})
			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.config("ruff", {
				capabilities = capabilities,
				init_options = {
					settings = {
						lint = {
							enable = true,
							select = { "E", "W", "F", "I" },
						},
					},
				},
			})
			-- vim.lsp.config("java_language_server", {
			-- 	capabilities = capabilities,
			-- })
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
			})
			vim.lsp.config("lemminx", {
				capabilities = capabilities,
			})
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
