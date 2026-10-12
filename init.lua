vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.keymap.set("n", "<leader>c", "<cmd>edit ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>botright new | terminal<CR>")

vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", {
  desc = "Toggle file tree",
})

vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {
  desc = "Find files",
})

vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

vim.o.updatetime = 300

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(nil, {
    focusable = true,
    border = "rounded",
    sources = "always",
  })
end, {desc = "Show line diagnostics"})

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- ファイル検索
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- 構文解析
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSPなどのツール管理
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim"
    },
  },


  -- LSP設定
  {
    "neovim/nvim-lspconfig",
  },

  -- コード補完
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },

  -- Git差分表示
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  -- ファイルツリー
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- 自動フォーマット
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },

  -- 括弧の自動補完
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- JSXなどのタグを自動補完・連動変更
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
        },
      })
    end,
  },

  -- インデントガイド・現在の階層を強調
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    },
  },
  -- カラーテーマ
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100,
    opts = {
      flavour = "mocha",
      styles = {
        comments = { "italic" },
      },
    },
  },
  -- Prisma
  {
    "prisma/vim-prisma",
    ft = "prisma"
  }
})

-- TypeScript LSP設定
vim.lsp.config("ts_ls", {
  init_options = {
    preferences = {
      includeCompletionsForModuleExports = true,
      includeCompletionsForImportStatements = true,
    },
  },
})

-- テーマ適用
vim.cmd.colorscheme("catppuccin")
vim.lsp.enable("ts_ls")
vim.lsp.enable("prisma")
