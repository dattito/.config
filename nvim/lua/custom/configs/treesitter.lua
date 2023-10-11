local opt = require "plugins.configs.treesitter"

opt.auto_install = true

opt.ignore_install = { "latex" }

opt.autotag = {
  enable = true,
}

return opt
