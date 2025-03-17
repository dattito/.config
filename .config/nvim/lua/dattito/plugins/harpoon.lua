return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add file to harpoon",
		},
		{
			"<leader>hu",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle harpoon quick menu",
		},
		{
			"<leader>fh",
			function()
				require("telescope").extensions.harpoon.marks()
			end,
			desc = "Find harpoon marks",
		},
		{
			"<leader>1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Go to harpoon mark 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Go to harpoon mark 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Go to harpoon mark 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Go to harpoon mark 4",
		},
	},
	config = function()
		require("telescope").load_extension("harpoon")
	end,
}
