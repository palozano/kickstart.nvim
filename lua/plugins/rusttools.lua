return {
  'simrat39/rust-tools.nvim',
  dependencies = 'neovim/nvim-lspconfig',
  config = function()
    require('rust-tools').setup({
      tools = {
        autoSetHints = true,
        -- hover_with_actions = true,
        -- runnables = {
        --   use_telescope = true,
        -- },
        -- debuggables = {
        --   use_telescope = true,
        -- },
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
        },
      },
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set('n', '<C-space>', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
          -- Code action groups
          vim.keymap.set('n', '<leader>cA', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })
        end,
      },
    })
  end
}
