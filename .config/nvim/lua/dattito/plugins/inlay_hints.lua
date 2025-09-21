return {
	"MysticalDevil/inlay-hints.nvim",
	event = "LspAttach",
	config = true,
	cmd = { "InlayHintsToggle", "InlayHintsEnable", "InlayHintsDisable" },
}
