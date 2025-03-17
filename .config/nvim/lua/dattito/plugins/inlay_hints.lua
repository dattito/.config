return {
	"MysticalDevil/inlay-hints.nvim",
	event = "LspAttach",
	dependencies = { "neovim/nvim-lspconfig" },
	config = true,
	cmd = { "InlayHintsToggle", "InlayHintsEnable", "InlayHintsDisable" },
}
