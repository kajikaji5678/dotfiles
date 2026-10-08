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

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default"
      },
      sources = {
        default = {"lsp", "path", "buffer"}

      }

    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",

    }
  }
})

vim.lsp.enable("ts_ls")
