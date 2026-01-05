return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    -- keys = {
    --   { '<c-/>', ':ToggleTerm size=50 direction=vertical<CR>', desc = 'New Vertical Term', silent = true },
    --   { '<leader>st', ':TermSelect<CR>', desc = 'Select Term', silent = true },
    -- },
    config = function()
      require('toggleterm').setup {
        size = 40,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
      }
    end,
  },
}
