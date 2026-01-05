return {
  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = {
          enabled = true,
          layout = {
            position = 'right',
            ratio = 0.4,
          },
        },
      }
    end,
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      { 'giuxtaposition/blink-cmp-copilot' },
      { 'zbirenbaum/copilot.lua' },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
      },
      completion = {
        documentation = {
          auto_show = true,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"!  Never!
    build = 'make',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional
      'nvim-tree/nvim-web-devicons',
      'zbirenbaum/copilot.lua', -- Required for GitHub Copilot provider
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
    opts = {
      mode = 'legacy', -- Switch from "agentic" to "legacy"
      -- Set GitHub Copilot as the provider
      provider = 'copilot',
      -- Configure Copilot provider settings
      providers = {
        copilot = {
          model = 'claude-sonnet-4.5',
          timeout = 30000,
        },
      },
    },
  },
}
