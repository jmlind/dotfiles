return {
	"akinsho/git-conflict.nvim",
	version = "2",
	config = function()
		require("which-key").add({
			{ "co", desc = "Git Conflict: [C]hoose [O]urs" },
			{ "ct", desc = "Git Conflict: [C]hoose [T]heirs" },
			{ "cb", desc = "Git Conflict: [C]hoose [B]oth" },
			{ "c0", desc = "Git Conflict: [C]hoose n[0]ne" },
		})
	end,
}
