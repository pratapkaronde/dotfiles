return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
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

			vim.diagnostic.config({ float = { border = "rounded" } })

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
							select = { "E", "W", "F", "I", "D" },
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

			vim.lsp.enable({
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"html",
				"gopls",
				"pyright",
				"ruff",
				"jsonls",
				"lemminx",
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.py",
				callback = function()
					vim.lsp.buf.code_action({
						context = {
							only = { "source.organizeImports.ruff", "source.fixAll.ruff" },
						},
						apply = true,
					})
					vim.lsp.buf.format({
						async = false,
						filter = function(client)
							return client.name == "ruff"
						end,
					})
				end,
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
