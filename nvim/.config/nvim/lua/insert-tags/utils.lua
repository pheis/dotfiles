-- local current_window = vim.api.nvim_get_current_win()
-- local cursor_position = vim.api.nvim_win_get_cursor(current_window)
-- current_line = vim.api.nvim_get_current_line()
--
--
--
local fp = require "insert-tags.fp"

local function words(line)
    local words = {}
    i = 0
    for word in string.gmatch(line, "%g+") do
        i = i + 1
        words[i] = word
    end
    return words
end

function tags(line)
    return fp.reduce(
        function (acc, word)
            return fp.concat({
                {'<' .. word .. '>'},
                fp.map(function(x) return '  ' .. x end, acc),
                {'</' .. word .. '>'}
            })
        end,
        fp.reverse(words(line)), {}
    )
end

fofo = tags("asdf fii foo")

-- for i = 1, #fofo do
--     print(fofo[i])
-- end


function io()
    local current_window = vim.api.nvim_get_current_win()
    local cursor_position = vim.api.nvim_win_get_cursor(current_window)

    local row = cursor_position[1]
    local col = cursor_position[2]



    local current_line = vim.api.nvim_get_current_line()

    local new_lines = tags(current_line)

    local current_buffer = vim.api.nvim_get_current_buf()

    -- print(row)
    -- print(col)

    vim.api.nvim_buf_set_lines(
        current_buffer,
        row,
        row,
        true,
        new_lines
    )

    vim.api.nvim_win_set_cursor(
        current_window,
        {
            row + math.floor(#new_lines / 2),
            col,
        }
    )
end

io()
