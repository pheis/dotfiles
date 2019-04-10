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

local function tags(line)
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

local function io()
    local current_window = vim.api.nvim_get_current_win()
    local cursor_position = vim.api.nvim_win_get_cursor(current_window)

    local row = cursor_position[1]
    local col = cursor_position[2]



    local current_line = vim.api.nvim_get_current_line()

    local intendation = string.match(current_line, "%s+[^%g]")
    if intendation == nil then
        intendation = ''
    end


    local new_lines = tags(current_line)
    new_lines = fp.map(function(line) return intendation .. line end, new_lines)

    local current_buffer = vim.api.nvim_get_current_buf()


    vim.api.nvim_buf_set_lines(
        current_buffer,
        row - 1,
        row,
        true,
        new_lines
    )

    vim.api.nvim_win_set_cursor(
        current_window,
        {
            row + math.floor(#new_lines / 2) - 1,
            col,
        }
    )
end

io()
