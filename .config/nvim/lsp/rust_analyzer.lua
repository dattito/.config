return {
  cmd = true,
	filetypes = { "rust" },
	root_markers = { "Cargo.lock" },
	settings = {
		["rust-analyzer"] = {
			check = {
				features = "all",
				command = "clippy",
			},
			diagnostics = {
				refreshSupport = true,
				experimental = {
					enable = true,
				},
			},
			cachePriming = {
				enable = false,
			},
		},
	},
}
