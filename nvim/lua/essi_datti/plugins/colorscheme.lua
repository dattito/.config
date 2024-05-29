return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      flavour = "mocha",
      integrations = {
        harpoon = true,
        indent_blankline = {
          enabled = true,
          scope_color = "overlay2", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = true,
        },
        mason = true,
        cmp = true,
        telescope = {
          enabled = true,
        },
      },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.overlay2 },
          Comment = { fg = colors.overlay2 },
          TelescopeBorder = { fg = colors.overlay2 },
          CmpItemAbbr = { fg = colors.text },
          CmpItemAbbrMatch = { fg = colors.blue, style = { "bold" } },
        }
      end,
    })
  end,
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
