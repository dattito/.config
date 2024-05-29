return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  dependencies = "zbirenbaum/copilot-cmp",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = false,
        auto_trigger = true,
      },
      panel = {
        enabled = false,
      },
    })
    require("copilot_cmp").setup()
  end,
  keys = {
    { "<leader>co", "<cmd>Copilot toggle<cr>", desc = "toggle copilot suggestion" },
  },
}
