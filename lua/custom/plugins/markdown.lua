return {
  {
    'godlygeek/tabular',
    'preservim/vim-markdown',
    config = function()
      -- special map config for markdown
    end,
  },
  {
    'ellisonleao/glow.nvim',
    config = true,
    cmd = 'Glow',
  },
  {
    'junegunn/goyo.vim',
    config = function()
      vim.keymap.set('n', '<Leader>z', ':Goyo<CR>', { desc = 'Zoom for foucs' })
    end,
  },
  {
    'junegunn/limelight.vim',
    config = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'GoyoEnter',
        callback = function()
          vim.cmd 'Limelight'
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'GoyoLeave',
        callback = function()
          vim.cmd 'Limelight!'
        end,
      })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    -- install with yarn or npm
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,

    ft = { 'markdown' },

    config = function()
      -- special map config for markdown
      --vim.keymap.set('n', '<C-\\>', ':MarkdownPreview<CR>', { desc = 'Markdown Preview' })
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_browser = 'firefox'
      vim.g.mkdp_page_title = '[${name}]'
      vim.g.mkdp_combine_preview = 1
      vim.g.mkdp_combine_preview_auto_refresh = 1
      vim.keymap.set('n', '<C-\\>', ':Glow<CR>', { desc = 'Markdown Preview within Nvim' })
      vim.keymap.set('n', '\\b', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview with Browser' })
    end,
  },
}
