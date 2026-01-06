return {
	"nyoom-engineering/oxocarbon.nvim",
	name = "oxocarbon",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme oxocarbon")

		-- Set border highlights after colorscheme loads
		vim.cmd([[
			highlight FloatBorder guifg=#78a9ff guibg=NONE
			highlight NormalFloat guibg=#161616
			highlight TelescopeBorder guifg=#78a9ff guibg=NONE
			highlight TelescopePromptBorder guifg=#78a9ff guibg=NONE
			highlight TelescopeResultsBorder guifg=#78a9ff guibg=NONE
			highlight TelescopePreviewBorder guifg=#78a9ff guibg=NONE
		]])
	end,
}
