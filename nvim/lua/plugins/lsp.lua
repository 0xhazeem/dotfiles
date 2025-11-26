return {
  -- Mason
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "html", "cssls", "ts_ls", "emmet_ls", "tailwindcss", "pyright" },
        handlers = {
          function(server_name) require("lspconfig")[server_name].setup({}) end,
          ["emmet_ls"] = function()
             require("lspconfig").emmet_ls.setup({ filetypes = { "html", "css", "javascript", "javascriptreact" } })
          end,
          ["pyright"] = function()
             require("lspconfig").pyright.setup({ settings = { python = { analysis = { typeCheckingMode = "off" } } } })
          end,
        },
      })
    end,
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.confirm({ select = true }) else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }),
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "lua", "html", "css", "javascript", "python" },
        highlight = { enable = true },
      })
    end,
  },
  
  -- Formatting
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "jay-babu/mason-null-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({ ensure_installed = { "prettier", "black", "flake8" }, automatic_installation = true })
      require("null-ls").setup({})
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
    end,
  }
}