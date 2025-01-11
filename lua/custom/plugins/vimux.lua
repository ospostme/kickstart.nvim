return {
  -- https://www.bugsnag.com/blog/tmux-and-vim
  'preservim/vimux',
  config = function()
    vim.cmd [[ nnoremap <leader>tp :VimuxPromptCommand<CR> ]]
    vim.cmd [[ nnoremap <Leader>tl :VimuxRunLastCommand<CR> ]]
    vim.cmd [[ nnoremap <Leader>ti :VimuxInspectRunner<CR> ]]
    vim.cmd [[ nnoremap <leader>tz :VimuxZoomRunner<CR> ]]
    vim.cmd [[ let g:VimuxCommandShell = 1 ]]
  end,
}
