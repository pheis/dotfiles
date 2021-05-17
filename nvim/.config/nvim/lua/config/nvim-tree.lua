vim.g['nvim_tree_icons'] = {
  ['default'] =  '',
  ['symlink'] =  '',
  ['git'] =  {
    ['unstaged'] =  "✗",
    ['staged'] =  "✓",
    ['unmerged'] =  "",
    ['renamed'] =  "➜",
    ['untracked'] =  "★",
    ['deleted'] =  ""
  },
  ['folder'] =  {
    ['default'] =  "",
    ['open'] =  "",
    ['empty'] =  "",
    ['empty_open'] =  "",
    ['symlink'] =  "",
    ['symlink_open'] = "",
  }
}

vim.cmd[[nnoremap _ :NvimTreeToggle<CR>]]
