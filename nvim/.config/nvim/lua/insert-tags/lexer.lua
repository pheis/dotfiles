local _ = require "insert-tags.fp"

function string_to_list(str)
    t={}
    str:gsub(".",function(c) table.insert(t,c) end)
    return t
end

local atoms = {
    ["("] = 'expression'
    [")"] = 'expression',
    [">"] = 'operator',
    ["+"] = 'operator',
    ["''"] = 'inner_value',
    ['"'] = 'inner_value',
    ['{'] = 'inner_value',
    ['}'] = 'inner_value',
}

function parse_tag(c, iter)
    return c .. _.take_while(iter, function(x) return atom[x] ~= 'operator' end)
end

function lexer(acc, iter)
    local c = iter()
    if c == nil then
        return acc
    end

    kind = atoms[c] or 'tag'

    parsers = {
        'tag' = parse_tag
        'expression' = parse_expression
        'inner_value' = parse_inner_value
    }

    value = actions[kind](c, iter)

    table.insert(acc, {kind, value})
    return
end
