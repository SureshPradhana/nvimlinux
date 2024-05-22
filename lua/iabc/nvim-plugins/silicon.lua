return {
  'krivahtoo/silicon.nvim',
  build = "./install.sh",
  config = function()
    require('silicon').setup({
      font = 'Hack Nerd Font Mono=16',
      theme = 'Monokai Extended',
      output = {
        path = "/home/suresh/linuxshare/snapShots/",
      },
    })
  end,
}
