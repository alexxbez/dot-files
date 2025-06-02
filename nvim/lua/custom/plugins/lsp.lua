return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('lspconfig').lua_ls.setup { capabilities = capabilities }
      require 'lspconfig'.clangd.setup { capabilities = capabilities }
      require 'lspconfig'.rust_analyzer.setup {
        cmd = { "/Users/alexx/.rust_a/rust-analyzer" },
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = true,
            }
          }
        }
      }
      require 'lspconfig'.racket_langserver.setup {
        cmd = { 'racket-langserver' },
        capabilities = capabilities
      }
      require('lspconfig')['hls'].setup {
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
        capabilities = capabilities,
      }
      require 'lspconfig'.pyright.setup {
        capabilities = capabilities,
        settings = {
          python = {
            pythonPath = "/Users/alexx/.pyenv/versions/3.13.2/bin/python"
          }
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
