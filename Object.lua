local function copy(object)
    local result = {}
    for key, value in pairs(object) do
        result[key] = value
    end
    return result
end

local function keys(object)
    local result = {}
    for key, _ in pairs(object) do
        table.insert(result, key)
    end
    return result
end

local function values(object)
    local result = {}
    for _, value in pairs(object) do
        table.insert(result, value)
    end
    return result
end

local function entries(object)
    local list = {}
    for key, value in pairs(object) do
        table.insert(list, {key, value})
    end
    return list
end

Object = {
    copy = copy,
    keys = keys,
    values = values,
    entries = entries
}
