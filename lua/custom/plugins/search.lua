return {
  'lalitmee/browse.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },

  config = function()
    -- default values for the setup
    require('browse').setup {
      -- search provider you want to use
      provider = 'google', -- duckduckgo, bing

      -- either pass it here or just pass the table to the functions
      -- see below for more
      bookmarks = {},
      icons = {
        bookmark_alias = '', -- if you have nerd fonts, you can set this to ""
        bookmarks_prompt = '󰂺', -- if you have nerd fonts, you can set this to "󰂺 "
        grouped_bookmarks = '', -- if you have nerd fonts, you can set this to 
      },
      -- if you want to persist the query for grouped bookmarks
      -- See https://github.com/lalitmee/browse.nvim/pull/23
      persist_grouped_bookmarks_query = false,
    }

    local bookmarks = {
      ['github'] = {
        ['name'] = 'search github from neovim',
        ['code_search'] = 'https://github.com/search?q=%s&type=code',
        ['repo_search'] = 'https://github.com/search?q=%s&type=repositories',
        ['issues_search'] = 'https://github.com/search?q=%s&type=issues',
        ['pulls_search'] = 'https://github.com/search?q=%s&type=pullrequests',
      },
    }

    local browse = require 'browse'

    function Browse_command(name, rhs, opts)
      opts = opts or {}
      vim.api.nvim_create_user_command(name, rhs, opts)
    end

    Browse_command('InputSearch', function()
      browse.input_search()
    end, {})
    vim.keymap.set('n', '<leader>bi', ':InputSearch<CR>', { desc = '[B]rowse Search [I]nput' })

    -- this will open telescope using dropdown theme with all the available options
    -- in which `browse.nvim` can be used
    Browse_command('Browse', function()
      browse.browse { bookmarks = bookmarks }
    end)
    vim.keymap.set('n', '<leader>bs', ':Browse<CR>', { desc = '[B]rowse Search' })

    Browse_command('Bookmarks', function()
      browse.open_bookmarks { bookmarks = bookmarks }
    end)
    vim.keymap.set('n', '<leader>bk', ':Bookmarks<CR>', { desc = '[B]rowse Search bookmar[K]s' })

    Browse_command('DevdocsSearch', function()
      browse.devdocs.search()
    end)
    vim.keymap.set('n', '<leader>bo', ':DevdocsSearch<CR>', { desc = '[B]rowse Search devd[O]cs' })

    Browse_command('DevdocsFiletypeSearch', function()
      browse.devdocs.search_with_filetype()
    end)
    vim.keymap.set('n', '<leader>bf', ':DevdocsFiletypeSearch<CR>', { desc = '[B]rowse Search [F]ile type devdocs search' })

    Browse_command('MdnSearch', function()
      browse.mdn.search()
    end)
    vim.keymap.set('n', '<leader>bm', ':MdnSearch<CR>', { desc = '[B]rowse [M]DN Search' })
  end,
}
