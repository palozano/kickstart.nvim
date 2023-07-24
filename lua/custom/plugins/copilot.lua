return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-space>",
          next = "<right>",
          prev = "<left>",
        },
      },
    })
  end,
}
