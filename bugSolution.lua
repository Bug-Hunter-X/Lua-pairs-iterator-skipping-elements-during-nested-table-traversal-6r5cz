local function foo(t)
  local keys = {}
  for k,_ in pairs(t) do table.insert(keys,k) end
  for _,k in ipairs(keys) do
    if type(t[k]) == "table" then
      foo(t[k])
    end
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo(t)