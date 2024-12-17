return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local colors = {
            blue   = '#80a0ff',
            cyan   = '#79dac8',
            black  = '#080808',
            white  = '#c6c6c6',
            red    = '#c42525',
            violet = '#d183e8',
            grey   = 'none', --'#303030',
        }

        local bubbles_theme = {
            normal = {
                a = { fg = colors.white, bg = colors.grey },
                b = { fg = colors.white, bg = colors.grey },
                c = { fg = colors.white },
            },

            insert = { a = { fg = colors.white, bg = colors.grey } },
            visual = { a = { fg = colors.white, bg = colors.grey } },
            replace = { a = { fg = colors.white, bg = colors.grey } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white },
            },
        }

        local mode_map = {
            ['n'] = 'normal',
            ['no'] = 'n·operator pending',
            ['v'] = 'visual',
            ['V'] = 'v·line',
            [''] = 'v·block',
            ['s'] = 'select',
            ['S'] = 's·line',
            [''] = 's·block',
            ['i'] = 'insert',
            ['R'] = 'replace',
            ['Rv'] = 'v·replace',
            ['c'] = 'command',
            ['cv'] = 'vim ex',
            ['ce'] = 'ex',
            ['r'] = 'prompt',
            ['rm'] = 'more',
            ['r?'] = 'confirm',
            ['!'] = 'shell',
            ['t'] = 'terminal'
        }

        local function lowercase_mode()
            local mode_code = vim.fn.mode()
            local mode_name = mode_map[mode_code] or mode_code
            return mode_name:lower()
        end

        local function get_lsp_info()
            local clients = vim.lsp.get_clients()
            if not clients then
                return ''
            end
            local lsp_info = ''
            for _, client in ipairs(clients) do
                lsp_info = lsp_info .. client.name .. ' '
            end
            return lsp_info
        end

        require('lualine').setup {
            options = {
                theme = bubbles_theme,
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { lowercase_mode, separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch', 'diagnostics' },
                lualine_c = {
                    '%=', --[[ add your center components here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype' },
                lualine_z = {
                    { get_lsp_info, separator = { left = '' }, right_paddig = '' },
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },

            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        }
    end
}
