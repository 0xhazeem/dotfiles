return {
  -- Theme
  -- === الثيم ===
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          -- هنا التعديل: لغينا الميلان لكل حاجة ورجعناها normal
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd([[colorscheme solarized-osaka]])
    end,
  },
  
  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = { theme = "solarized-osaka", section_separators = { left = '', right = '' } },
      })
    end,
  },
  
  -- Indent Lines
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "NvChad/nvim-colorizer.lua", opts = {} },
}