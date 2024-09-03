return {
  --{
  --"LazyVim/LazyVim",
  --opts = {
  --colorscheme = "catppuccin",
  --transparent_background = true,
  --},
  --},
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
