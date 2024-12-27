return {
  'jalvesaq/dict.nvim',
  -- 'soywod/vim-phonetics',
  config = function()
    require('dict').setup {
      dict = 'wn',
      dict_dir = '/usr/local/Cellar/dict/1.13.3/share',
    }
    vim.keymap.set('n', '<leader>ld', '<Cmd>lua require("dict").lookup()<CR>', { desc = '[L]ook [D]dictionary' })
    --vim.cmd [[ nmap '<leader>lv' :!python ~/wester_api_v3.py %s/\(<c-r>=expand("<cword>")<cr><cr>\)/ ]]
    vim.cmd [[ nnoremap <leader>lv :execute ':!python ~/.config/nvim/wester_api_v3.py ' . shellescape(expand('<cword>'))<Cr>]]
  end,
}
