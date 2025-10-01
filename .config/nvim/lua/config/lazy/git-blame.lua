return {
	"f-person/git-blame.nvim",
	event = "VeryLazy", -- load the plugin at startup
	opts = {
		enabled = false,
		message_template = " <author> • <date> • <summary>",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text_column = 1,
	},
}
