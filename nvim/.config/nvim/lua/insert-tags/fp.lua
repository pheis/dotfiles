local fp = {}



function fp.reverse(list)
    local reversed = {}
    for i = 1, #list do
        reversed[i] = list[#list - i + 1]
    end
    return reversed
end

function fp.map(fn, list)
    local mapped_list = {}
    for i = 1, #list do
        mapped_list[i] = fn(list[i])
    end
    return mapped_list
end

function fp.each(fn, list)
    for i = 1, #list do
        fn(list[i])
    end
end

function fp.reduce(fn, list, initial_value)
    local acc = initial_value
    local i = 1;
    if acc == nil then
        acc = list[1]
        i = 2
    end

    for i = i, #list do
       acc = fn(acc, list[i])
    end
    return acc
end

function fp.concat(lists)
    local acc = {}
    for i = 1, #lists do
        acc_len = #acc
        list = lists[i]
        for i = 1, #list do
            acc[i + acc_len] = list[i]
        end
    end
    return acc
end

function fp.flat_map(fn, list)
    return fp.concat(fp.map(fn, list))
end

function fp.iter(t)
    local i = 0
    local n = table.getn(t)
    return function()
        i = i + 1
        if i <= n then return t[i] end
    end
end

return fp
