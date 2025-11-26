return {
  -- Theme
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- منطق الشفافية
      local transparent_bg = true
      if vim.g.neovide then transparent_bg = false end
      
      require("solarized-osaka").setup({
        transparent = transparent_bg,
        terminal_colors = true,
        styles = {
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