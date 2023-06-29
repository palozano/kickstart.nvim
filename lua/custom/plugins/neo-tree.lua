return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  version = "*",
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  -- config = function ()
  --   vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  --   require('neo-tree').setup({
  --     enable_git_status = true,
  --     enable_diagnostics = true,
  --     filesystem = {
  --       filtered_items = {
  --         visible = false,
  --         hide_dotfiles = false,
  --         hide_gitignored = false,
  --       }
  --     }
  --   })
  -- end,
  config = {
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      follow_curren_file = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      }
    }
  },
}
