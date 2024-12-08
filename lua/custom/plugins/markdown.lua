return {
  {
    'preservim/vim-markdown',
    config = function()
      -- special map config for markdown
    end,
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
      vim.keymap.set('n', '<C-\\>', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })
    end,
  },
}
