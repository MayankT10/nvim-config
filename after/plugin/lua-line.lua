local status_line = require("lualine.themes.nightfly")

require("lualine").setup({
	options = {
		theme = status_line,
	},
	...,
})
