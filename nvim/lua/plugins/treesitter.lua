return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"vim",
				"javascript",
				"python",
				"c",
				"cpp",
				"go",
				"html",
				"markdown_inline",
				"markdown",
				"rust",
			},
			indent = { enable = true },
			highlight = { enable = true },
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	end,
}
