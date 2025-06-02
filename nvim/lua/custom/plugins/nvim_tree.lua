return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("nvim-tree").setup({
      -- Automatically update cwd when navigating
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },

      -- Auto-close tree after opening a file
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = true,
        },
      },

      -- View options
      view = {
        width = 30,
        side = "left",
        relativenumber = true,
      },

      -- Renderer options
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },

      -- Filters (show dotfiles by default)
      filters = {
        dotfiles = false,
        custom = {},
      },

      -- Optional diagnostics icons (requires LSP or linter)
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
    })

    -- Keymap to toggle file explorer
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end
}
