return {
  -- [[ Basic Keymaps ]]
  -- Exit the lazy way
  vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "jk as <ESC> key" }),
  vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" }),

  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }),
  vim.keymap.set({ 'i' }, 'jk', '<Esc>', { silent = true }),

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }),
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }),

  -- Oil for the machine's folders (file browser)
  -- NOTE: `open_float` does not let you open preview with C-p, so now we use `open` and C-c to close Oil.
  vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" }),

  -- open definition in split (horizontal and vertical)
  -- vim.keymap.set("n", "gH", ":split<CR>gd", { noremap = true, silent = true, desc = "Open definition in horizontal split" }),
  -- vim.keymap.set("n", "gV", ":vsplit<CR>gd", { noremap = true, silent = true, desc = "Open definition in vertical split" }),

  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>.', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' }),
  vim.keymap.set('n', '<leader>,', require('telescope.builtin').buffers, { desc = '[,] Find existing buffers' }), -- space space
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' }),
  vim.keymap.set('n', '<leader>sG', require('telescope.builtin').git_files, { desc = 'Search [G]it files' }),
  vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' }),
  vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' }),
  vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' }),
  vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' }),
  vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' }),

  -- Custom plugin to grep and replace
  vim.keymap.set('n', '<leader>sV', function() require('handmade.quicklist').vimgrep_ui() end,
    { desc = '[V]imgrep search' }),
  vim.keymap.set('n', '<leader>sR',
    function() require('handmade.quicklist').replace_in_quickfix_list() end,
    { desc = '[V]imgrep search' }),

  -- Structural search and replace: https://github.com/cshuaimin/ssr.nvim
  vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end,
    { desc = '[S]tructural search and [r]eplace' }),

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' }),
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' }),
  vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' }),
  vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' }),

  -- Git porcelain, kind of
  vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open Neogit' }),

  -- Format the current buffer
  vim.keymap.set('n', '<leader>bf', function() vim.lsp.buf.format({ async = true }) end,
    { desc = '[B]uffer: [F]ormat the current buffer' }),

  -- You can load your handmade plugins in here too!
  vim.keymap.set('n', '<leader>tt', function() require('handmade.todolist').todolist() end,
    { desc = 'Open todolist' }),

  -- Clever jumps. Check for more: https://github.com/phaazon/hop.nvim
  vim.keymap.set('n', '<leader>f', function()
    require('hop').hint_words({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = false })
  end, { remap = true, desc = 'Hop (forwards) to word' }),
  vim.keymap.set('n', '<leader>F', function()
    require('hop').hint_words({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true, desc = 'Hop (backwards) to word' }),

  -- Know what you did
  vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = '(toggle) [U]ndotree' }),

  -- Search across branches
  vim.keymap.set('n', '<leader>sB', function() require('handmade.git').grep_in_vim() end,
    { desc = "[s]earch across all [B]ranches" }),

  -- Show file at commit
  vim.keymap.set('n', '<leader>gs', function() require('handmade.git').git_show_file_at_commit() end,
    { desc = "[s]how commit at revision" }),

  -- Open/Close the quickfix list
  vim.keymap.set('n', '<leader>q', ':copen<CR>', { desc = 'Open the [q]uickfix list' }),
  vim.keymap.set('n', '<leader>Q', ':cclose<CR>', { desc = 'Close the [Q]uickfix list' }),
  vim.keymap.set('n', '<leader>qx', function() require('handmade.quicklist').command_to_execute_in_quickfix_list() end,
    { desc = 'E[x]ecute in quickfix list' }),

  -- Merge tool
  vim.keymap.set('n', '<leader>mt', function() require('handmade.mergetool').select_revision_or_commit() end,
    { desc = '[M]erge [T]ool' }),
}
