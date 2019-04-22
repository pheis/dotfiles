local fp = require "insert-tags.fp"

local function split_string(str, matcher)
    local list = {}
    i = 0
    for word in string.gmatch(str, matcher) do
        i = i + 1
        list[i] = word
    end
    return list
end

local function tags(line)
    local line = string.match(line, "[^%s+].*")
    local words = fp.reverse(split_string(line, "[^>]+"))

    local initial_value = {}
    local inner_most = words[1]
    local first_char = string.sub(inner_most, 1, 1)
    local special_characters = {
        ["{"] = true,
        ["'"] = true,
        ['"'] = true
    }
    if special_characters[first_char] then
        initial_value = {inner_most}
        words = {unpack(words, 2, #words)}
    end

    return fp.reduce(
        function (acc, word)
            return fp.concat({
                {'<' .. word .. '>'},
                fp.map(function(x) return '  ' .. x end, acc),
                {'</' .. string.match(word, "%g+") .. '>'}
            })
        end,
        words, initial_value
    )
end

local function parse_equals(line)
    local line = string.match(line, "[^%s+].*")
    local words = split_string(line, "[^|]+")
    return words
end

local function parse_tags(line)
    return fp.flat_map(tags, parse_equals(line))
end

-- local foo = tags(some)
-- for i = 1, #foo do
--     print(foo[i])
-- end

function Insert_tags()
    local current_window = vim.api.nvim_get_current_win()
    local cursor_position = vim.api.nvim_win_get_cursor(current_window)

    local row = cursor_position[1]
    local col = cursor_position[2]



    local current_line = vim.api.nvim_get_current_line()

    local intendation = string.match(current_line, "%s+[^%g]")
    if intendation == nil then
        intendation = ''
    end


    local new_lines = parse_tags(current_line)
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
