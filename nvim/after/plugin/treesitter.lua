local configs = require("nvim-treesitter.configs");

configs.setup({
	ensure_installed = { "lua", "javascript", "typescript", "rust", "html", "ruby", "elixir" },
	highlight = { 
		enable = true, 
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	sync_install = false,
});
