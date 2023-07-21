return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  version = "*",
  keys = {
    { "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Open/focus Neotree" },
    -- { "<leader>o", "<cmd>Neotree toggle focus<cr>", desc = "Open/focus Neotree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = {
    renderer = {
      icons = {
        show = {
          git = true,
          file = false,
          folder = false,
          folder_arrow = true,
        },
        glyphs = {
          folder = {
            arrow_closed = "⏵",
            arrow_open = "⏷",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "⌥",
            renamed = "➜",
            untracked = "★",
            deleted = "⊖",
            ignored = "◌",
          },
        },
      },
    },
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
