vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.conoline_auto_enable = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 120
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard:append 'unnamedplus'
vim.opt.splitright = true
vim.opt.breakindent = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
-- vim.opt.list = true
-- vim.opt.listchars = { trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.fileencoding = 'utf-8'

vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete single character without copy into register' })
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close current split' })
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })
vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close the currnet buffer' })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>d', [[_d]])
-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>co', '<cmd>copen<CR>')
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<CR>')
vim.keymap.set('n', '<leader>cx', "<cmd>call setqflist([], 'r')<CR>")
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<leader>d', [["_d]])
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set('n', '<TAB>', '<cmd>bn<CR>')
vim.keymap.set('n', '<S-TAB>', '<cmd>bp<CR>')

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Lazy Git' })
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = 'Diff View Open' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<CR>', { desc = 'Diff View History' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'tpope/vim-sleuth',
  'nvim-lua/plenary.nvim',
  'sindrets/diffview.nvim',
  'tpope/vim-fugitive',
  -- "nvim-pack/nvim-spectre",
  'dyng/ctrlsf.vim',
  'entrez/roku.vim',
  'kevinhwang91/promise-async',
  'miyakogi/conoline.vim',
  'MattesGroeger/vim-bookmarks',

  { 'numToStr/Comment.nvim', opts = {} },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },

  {
    'Bekaboo/dropbar.nvim',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      require('dropbar').setup {}
      vim.ui.select = require('dropbar.utils.menu').select

      vim.keymap.set('n', '<leader>b', "<cmd>lua require('dropbar.api').pick()<cr>", { desc = 'Select breadcrums' })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<CR>', { desc = 'Search Keymaps' })
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope builtin<CR>', { desc = 'Search Select Telescope' })
      vim.keymap.set('n', '<leader>fw', '<cmd>Telescope grep_string<CR>', { desc = 'Search current Word' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>', { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<CR>', { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>f.', '<cmd>Telescope oldfiles<CR>', { desc = 'Search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = 'Show git commits' })
      vim.keymap.set('n', '<leader>gfc', '<cmd>Telescope git_bcommits<cr>', { desc = 'Show git commits for current buffer' })
      vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'Show git branches' })
      vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = 'Show current git changes per file' })

      local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '/ Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search / in Open Files' })

      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files' })
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      require('luasnip.loaders.from_vscode').lazy_load()

      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
          ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
          ['<C-e>'] = cmp.mapping.abort(), -- close completion window
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if require('luasnip').expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
              fallback()
            end
          end, {
            'i',
            's',
          }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if require('luasnip').jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
              fallback()
            end
          end, {
            'i',
            's',
          }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lua' },
          { name = 'codeium' },
        },
        formatting = {
          format = lspkind.cmp_format {
            maxwidth = 50,
            ellipsis_char = '...',
          },
        },
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
          map('gr', require('telescope.builtin').lsp_references, 'Goto References')
          map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
          map('<leader>rn', vim.lsp.buf.rename, 'LSP Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        html = {},
        -- tsserver = {},
        cssls = {},
        htmx = {},
        bright_script = {},
        tailwindcss = {},
        astro = {},
        svelte = {},
        prismals = {},
        graphql = {},
        emmet_ls = {},
        clangd = {},
        rust_analyzer = {},
        clojure_lsp = {},
        bashls = {},
        elixirls = {},
        erlangls = {},
        -- dartls = {},
        dockerls = {},
        docker_compose_language_service = {},
        jsonls = {},
        gopls = {},
        zls = {},
        pyright = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
              },
              completion = {
                callSnippet = 'Replace',
              },
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
        'prettier',
        'eslint_d',
        'black',
        'isort',
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          svelte = { 'prettier' },
          css = { 'prettier' },
          html = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
          graphql = { 'prettier' },
          lua = { 'stylua' },
          python = { 'black' },
          go = { 'goimports', 'gofmt', 'golines' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end, { desc = 'Format file or range (in visual mode)' })
    end,
  },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require 'lualine'
      local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

      local colors = {
        blue = '#65D1FF',
        green = '#3EFFDC',
        violet = '#FF61EF',
        yellow = '#FFDA7B',
        red = '#FF4A4A',
        fg = '#c3ccdc',
        bg = '#112638',
        inactive_bg = '#2c3043',
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }

      ---@diagnostic disable-next-line: undefined-field
      lualine.setup {
        options = {
          theme = my_lualine_theme,
        },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#ff9e64' },
            },
            { 'encoding' },
            { 'fileformat' },
            { 'filetype' },
          },
        },
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'html',
          'lua',
          'markdown',
          'vim',
          'vimdoc',
          'json',
          'json5',
          'jsonc',
          'javascript',
          'typescript',
          'yaml',
          'html',
          'css',
          'prisma',
          'markdown_inline',
          'svelte',
          'graphql',
          'dockerfile',
          'gitignore',
          'elixir',
          'heex',
          'eex',
          'tsx',
          'go',
          'gomod',
          'gowork',
          'gosum',
          'python',
          'rust',
          'terraform',
          'toml',
          'zig',
          'vue',
          'astro',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('treesitter-context').setup {
        enable = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20,
        on_attach = nil,
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,

            lookahead = true,

            keymaps = {
              ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment region' },
              ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment region' },

              ['a:'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/field region' },
              ['i:'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/field region' },

              ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional region' },
              ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional region' },

              ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop region' },
              ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop region' },

              ['ab'] = { query = '@block.outer', desc = 'Select outer part of a block region' },
              ['ib'] = { query = '@block.inner', desc = 'Select inner part of a block region' },

              ['af'] = { query = '@function.outer', desc = 'Select outer part of a function region' },
              ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },

              ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
              ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            },
            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>on'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>op'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set('n', '<leader>hm', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Mark file with harpoon' })
      keymap.set('n', '<leader>hf', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Mark file with harpoon' })
      keymap.set('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = 'Go to next harpoon mark' })
      keymap.set('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = 'Go to previous harpoon mark' })
      keymap.set('n', '<leader>ht', "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", { desc = 'Go to previous harpoon mark' })
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },

  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },

  {
    'elixir-tools/elixir-tools.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local elixir = require 'elixir'
      local elixirls = require 'elixir.elixirls'

      elixir.setup {
        nextls = { enable = true },
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            -- vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            -- vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            -- vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    lazy = false,
    config = function()
      local ftMap = {
        vim = 'indent',
        python = { 'indent' },
        git = '',
      }

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end

      require('ufo').setup {
        enable_get_fold_virt_text = true,
        open_fold_hl_timeout = 150,
        close_fold_kinds = { 'imports', 'comment' },
        fold_virt_text_handler = handler,
        preview = {
          win_config = {
            border = { '', '─', '', '', '', '─', '', '' },
            winhighlight = 'Normal:Folded',
            winblend = 0,
          },
          mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']',
          },
        },
        provider_selector = function(bufnr, filetype, buftype)
          -- if you prefer treesitter provider rather than lsp,
          -- return ftMap[filetype] or { "treesitter", "indent" }
          return ftMap[filetype]

          -- refer to ./doc/example.lua for detail
        end,
      }
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      local autopairs = require 'nvim-autopairs'

      autopairs.setup {
        check_ts = true,
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
          java = false, -- don't check treesitter on java
        },
      }

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

      local cmp = require 'cmp'

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',
    config = true,
  },

  {
    'andymass/vim-matchup',
    event = { 'BufReadPost' },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
  },

  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    config = function(_, opts)
      require('go').setup(opts)
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local nvimtree = require 'nvim-tree'

      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree to light blue
      vim.cmd [[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]]

      -- configure nvim-tree
      nvimtree.setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = false,
          side = 'left',
          width = 30,
          preserve_window_proportions = true,
        },
        filesystem_watchers = {
          enable = true,
        },
        -- change folder arrow icons
        renderer = {
          -- icons = {
          --   glyphs = {
          --     folder = {
          --       arrow_closed = '', -- arrow when folder is closed
          --       arrow_open = '', -- arrow when folder is open
          --     },
          --   },
          -- },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = false,
            },
          },
        },
        filters = {
          custom = { '.DS_Store' },
        },
        git = {
          ignore = false,
        },
      }

      vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
      vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
      vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
      vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
    end,
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function(_, opts)
      require('typescript-tools').setup(opts)

      vim.keymap.set('n', '<leader>tso', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Organize Imports' })
      vim.keymap.set('n', '<leader>tss', '<cmd>TSToolsSortImports<CR>', { desc = 'TS Sort Imports' })
      vim.keymap.set('n', '<leader>tsf', '<cmd>TSToolsFixAll<CR>', { desc = 'TS Fix All' })
      vim.keymap.set('n', '<leader>tsr', '<cmd>TSToolsRename<CR>', { desc = 'TS Rename' })
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
      { '<leader>uo', "<cmd>lua require('undotree').open()<cr>" },
      { '<leader>uc', "<cmd>lua require('undotree').close()<cr>" },
    },
  },

  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup {}
      vim.cmd 'colorscheme github_dark_tritanopia'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

local status, tmux = pcall(require, 'tmux')
if not status then
  return
end

-- This is your opts table
tmux.setup {
  copy_sync = {
    -- enables copy sync. by default, all registers are synchronized.
    -- to control which registers are synced, see the `sync_*` options.
    enable = true,

    -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
    -- first buffer or named_buffer_name = true to ignore a named tmux
    -- buffer with name named_buffer_name :)
    ignore_buffers = { empty = false },

    -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
    -- clipboard by tmux
    redirect_to_clipboard = false,

    -- offset controls where register sync starts
    -- e.g. offset 2 lets registers 0 and 1 untouched
    register_offset = 0,

    -- overwrites vim.g.clipboard to redirect * and + to the system
    -- clipboard using tmux. If you sync your system clipboard without tmux,
    -- disable this option!
    sync_clipboard = true,

    -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
    sync_registers = true,

    -- syncs deletes with tmux clipboard as well, it is adviced to
    -- do so. Nvim does not allow syncing registers 0 and 1 without
    -- overwriting the unnamed register. Thus, ddp would not be possible.
    sync_deletes = true,

    -- syncs the unnamed register with the first buffer entry from tmux.
    sync_unnamed = true,
  },
  navigation = {
    -- cycles to opposite pane while navigating into the border
    cycle_navigation = true,

    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = true,

    -- prevents unzoom tmux when navigating beyond vim border
    persist_zoom = false,
  },
  resize = {
    -- enables default keybindings (A-hjkl) for normal mode
    enable_default_keybindings = true,

    -- sets resize steps for x axis
    resize_step_x = 1,

    -- sets resize steps for y axis
    resize_step_y = 1,
  },
}
