return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
    end,
  },
  
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function() require("nvim-tree").setup({ view = { width = 30 }, filters = { dotfiles = false } }) end,
  },
  
  -- Web Tools
  { "windwp/nvim-ts-autotag", opts = {} },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
}