return {
  "OlegGulevskyy/better-ts-errors.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = { "<leader>dd", desc = "Better TS errors" },
  config = {
    keymaps = {
      toggle = '<leader>dd',          -- default '<leader>dd'
      go_to_definition = '<leader>dx' -- default '<leader>dx'
    }
  }
}
