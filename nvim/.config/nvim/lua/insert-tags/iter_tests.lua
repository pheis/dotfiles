function into_iterator(t, i, n)
    local i = i or 1
    local n = n or #t
    return function()
        if i <= n then
            return t[i], into_iterator(t, i + 1, n)
        end
        return nil, empty
    end
end

function empty()
    return nil, empty
end

function is_empty(iterator)
    return iterator == empty
end

function map_iterator(fn, iterator)
    local value, next_iterator = iterator()
    if value == nil then return empty end
    return function() return fn(value, next_iterator) end
end

function map(fn, iterator)
    return map_iterator(function(value, next_iterator)
        return fn(value), map(fn, next_iterator)
    end, iterator)
end

function reduce(fn, iterator, acc)
    if acc == nil then
        local val, next_iterator = iterator()
        if val == nil then return end
        return reduce(fn, next_iterator, val)
    end

    local val, next_iterator = iterator()
    if val == nil then return acc end
    return reduce(fn, next_iterator, fn(acc, val))
end

function each(fn, iterator)
    local value, next_iterator = iterator()
    if value == nil then return end
    fn(value)
    return each(fn, next_iterator)
end

function concat(first, second)
    return function()
        local value, next_iterator = first()
        if value == nil then
            return second()
        end
        return value, concat(next_iterator, second)
    end
end

function take_while(fn, iterator)
    return map_iterator(function(value, next_iterator)
        if fn(value) then
            return value, take_while(fn, next_iterator)
        end
        return nil, empty
    end, iterator)
end

function drop_while(fn, iterator)
    return map_iterator(function(value, next_iterator)
        if fn(value) then
            return drop_while(fn, next_iterator)()
        end
        return value, next_iterator
    end, iterator)
end

function take(n, iterator)
    return map_iterator(function(value, next_iterator)
        if 0 < n then
           return value, take(n - 1, next_iterator)
        end
        return nil, empty
    end, iterator)
end

function drop(n, iterator)
    return map_iterator(function(value, next_iterator)
        if n < 1 then
            return value, next_iterator
        end
        return drop(n - 1, next_iterator)()
    end, iterator)
end

function singleton(value)
    return function()
        return value, empty
    end
end

function add(value, iterator)
    return function()
        return value, iterator
    end
end

function reverse(iterator)
    return reduce(
        function(acc, value)
            return add(value, acc)
        end,
        iterator,
        empty
    )
end

local it = into_iterator({1,2,3,4})
-- each(print, it)
-- n = reduce(function(a, b) return a + b end, it, 10)
it = reverse(it)
each(print, it)
