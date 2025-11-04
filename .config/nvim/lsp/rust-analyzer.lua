return {
cmd = { 'rust-analyzer' },
	filetypes = { "rust" },
	root_markers = { "Cargo.lock" },
	settings = {
		["rust_analyzer"] = {
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
