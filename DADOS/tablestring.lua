function serialize (o)
  local s = ""
  if type(o) == "number" then
    return o
  elseif type(o) == "string" then
    return string.format("%q", o)
  elseif type(o) == "table" then
    s = s.."{\n"
    for k,v in pairs(o) do if type(v) ~= nil then
      s = s.."  ["..serialize(k)
      s = s.."] = "..serialize(v)
      s = s..",\n"
    end end
    s = string.sub(s,1,-3).."}\n"
    return s
  else
    error("cannot serialize a " .. type(o))
  end
end
