return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  version = "*",
  keys = {
    { "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Open/focus Neotree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = {
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      follow_curren_file = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        width = 40,
        position = "right",
      },
    }
  },
}
