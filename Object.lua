local addOnName = 'Object'
local version = '1.0.0'

if (_G.Library and not Library.isRegistered(addOnName, version)) or not _G.Library then
  --- @class Object
  local Object = {}

  function Object.copy(object)
    local result = {}
    for key, value in pairs(object) do
      result[key] = value
    end
    return result
  end

  function Object.keys(object)
    local result = {}
    for key, _ in pairs(object) do
      table.insert(result, key)
    end
    return result
  end

  function Object.values(object)
    local result = {}
    for _, value in pairs(object) do
      table.insert(result, value)
    end
    return result
  end

  function Object.entries(object)
    local list = {}
    for key, value in pairs(object) do
      table.insert(list, { key = key, value = value })
    end
    return list
  end

  function Object.equals(a, b)
    local keysA = Set.create(keys(a))
    local keysB = Set.create(keys(b))
    if not Set.equals(keysA, keysB) then
      return false
    end
    local keys = keysA
    for key in Set.iterator(keys) do
      if a[key] ~= b[key] then
        return false
      end
    end
    return true
  end

  local function assignObject(object, objectB)
    for key, value in pairs(objectB) do
      object[key] = value
    end
  end

  function Object.assign(object, ...)
    local objects = { ... }
    for _, objectB in ipairs(objects) do
      assignObject(object, objectB)
    end
    return object
  end

  function Object.count(object)
    local count = 0
    for _, _ in pairs(object) do
      count = count + 1
    end
    return count
  end

  function Object.every(object, prefix)
    for key, value in pairs(object) do
      if not prefix(value, key) then
        return false
      end
    end

    return true
  end

  function Object.fromEntries(entries)
    local object = {}
    for _, entry in ipairs(entries) do
      object[entry.key] = entry.value
    end
    return object
  end

  function Object.isEmpty(object)
    return not next(object)
  end

  function Object.remove(object, key)
    object[key] = nil
  end

  function Object.hasKeys(object)
    return Boolean.toBoolean(next(object))
  end

  Object.hasEntries = Object.hasKeys

  if _G.Library then
    Library.register(addOnName, version, Object)
  else
    _G.Object = Object
    --- @deprecated
    _G.Object2 = Object
  end
end
