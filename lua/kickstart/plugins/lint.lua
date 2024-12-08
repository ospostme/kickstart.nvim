return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    log_level = vim.log.levels.DEBUG,
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        svelte = { 'eslint_d' },

        --lua = { 'luacheck' },
        markdown = { 'markdownlint' },
        -- Modify your pylintrc to customize which errors or conventions are important to you.
        python = { 'pylint' },
        cpp = { 'cppcheck' },
        c = { 'gcc' },
      }
      -- https://github.com/mfussenegger/nvim-lint/issues/262
      local pattern = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]]
      local groups = { 'file', 'lnum', 'col', 'severity', 'message' }
      local severity_map = {
        ['error'] = vim.diagnostic.severity.ERROR,
        ['warning'] = vim.diagnostic.severity.WARN,
        ['performance'] = vim.diagnostic.severity.WARN,
        ['style'] = vim.diagnostic.severity.INFO,
        ['information'] = vim.diagnostic.severity.INFO,
      }

      lint.linters.gcc = {
        cmd = '/usr/local/bin/gcc',
        stdin = false,
        -- or false if it doesn't support content input via stdin.
        -- In that case the filename is automatically added to
        -- the arguments.
        append_fname = true,
        -- Automatically append the file name to `args` if `stdin = false` (default: true)
        args = { '-Wall', '-std=c99' },
        -- list of arguments. Can contain functions with zero arguments
        -- that will be evaluated once the linter is used.
        stream = 'stderr',
        -- ('stdout' | 'stderr' | 'both') configure the stream to which the
        -- linter outputs the linting result.
        ignore_exitcode = true,
        -- set this to true if the linter exits with a code != 0 and that's considered normal.
        env = nil,
        -- custom environment table to use with the external process.
        -- Note that this replaces the *entire* environment, it is not additive.
        parser = require('lint.parser').from_pattern(pattern, groups, severity_map, { ['source'] = 'gcc' }),
      }

      -- To allow OTHER plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
      vim.keymap.set('n', '<Leader>l', function()
        lint.try_lint()
      end, { desc = 'Trigger [L]inting for current file' })
    end,
  },
}
