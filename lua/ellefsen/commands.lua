
local api = vim.api

function _G.run_c_program()
    local bufnr = api.nvim_get_current_buf()
    local bufname = api.nvim_buf_get_name(bufnr)
    local filename = bufname:match("^.+/(.+)$")
    local basename = filename:match("(.+)%..+$")
    vim.cmd('!clang ' .. filename .. ' -o ' .. basename)
    vim.cmd('vnew')  -- Open a new vertical split
    local newbufnr = api.nvim_get_current_buf()
    local jobid = vim.fn.termopen('./' .. basename)
    api.nvim_buf_set_option(newbufnr, 'bufhidden', 'wipe')
    vim.api.nvim_feedkeys('h', 'n', false) -- Simulate pressing "h" key in normal mode
end

api.nvim_set_keymap('n', '<leader>r', ':lua run_c_program()<cr>', {noremap = true, silent = true})
api.nvim_command('command! Run lua run_c_program()')
