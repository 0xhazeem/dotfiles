-- 1. زرار الـ Leader
vim.g.mapleader = " " 

-- 2. إعدادات Neovim الأساسية
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8

-- 3. تجهيز Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 4. قائمة الإضافات
require("lazy").setup({
  -- === الثيم (Solarized Osaka) ===
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          -- هنا لغينا الخط المائل لكل حاجة
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

  -- (تم حذف Bufferline من هنا عشان الشريط العلوي يختفي)

  -- === شريط الحالة السفلي (Lualine) ===
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "solarized-osaka",
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
      })
    end,
  },

  -- === البحث السريع (Telescope) ===
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
    end,
  },

  -- === متصفح الملفات (Nvim Tree) ===
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
      })
    end,
  },

  -- === أساسيات البرمجة (LSP & Treesitter) ===
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "lua" },
        highlight = { enable = true },
      })
    end,
  },
})

-- 5. تفعيل C++ Setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  handlers = {
    function(server_name)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig")[server_name].setup({ capabilities = capabilities })
    end,
  },
})

-- 6. تفعيل Autocomplete
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
  }),
  sources = cmp.config.sources({ { name = "nvim_lsp" } }),
})

-- === اختصارات الكيبورد ===
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local filename = vim.fn.expand("%")
  local output_name = vim.fn.expand("%:r") .. ".exe"
  local command = "g++ " .. filename .. " -o " .. output_name .. " && .\\" .. output_name
  vim.cmd("term " .. command)
end)
