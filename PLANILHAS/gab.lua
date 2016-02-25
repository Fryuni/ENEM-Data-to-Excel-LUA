#!usr/bin/env lua
require "table.save"
require "adapt"
local filename = {}
filename["ch"] = "ITENS_CHT"
filename["cn"] = "ITENS_CNT"
filename["lc"] = "ITENS_LCT"
filename["mt"] = "ITENS_MTT"
local adjust = {
	["ch"] = 0,
	["cn"] = 45,
	["lc"] = 90,
	["mt"] = 135}
local file = {}
for i,v in pairs(filename) do
	file[i] = assert(io.open(v..".csv", "r"))
end

function selVars(text)
  local a = 0
  local loop = 1
  local v = {}
  while true do
    local b = string.find(text,";",a+1)
    if b == nil then b = 0 end
    local var = string.sub(text,a+1,b-1)
    v[loop] = var
  if b == 0 then break end
    a = b
    loop = loop + 1
  end
  v = formatInteger(v)
  return v
end

function readVars(s, index)
  local t = selVars(s)
  local res = {}
  for i,v in pairs(t) do
    res[index[i]] = v
  end
  return res
end

function formatLC(xip, ind)
	for i,v in pairs(xip) do
		for r=1,9,2 do
			xip[i][ind[r]] = tonumber(string.sub(xip[i][ind[r]], 1, -2))
		end
	end
	return xip
end


local vars = {}
local valuesR = {}
local values = {}
for i,v in pairs(file) do
	local a
	vars[i] = {}
	vars[i] = selVars(v:read())
	valuesR[i] = {}
	values[i] = {}
	a = 1
	if i == "lc" then
		valuesR[i][1] = {}
		valuesR[i][2] = {}
		while a <= 5 do
			valuesR[i][1][a] = readVars(v:read(), vars[i])
--			valuesR[i][1][a][vars[i][#vars]] = string
			a = a + 1
		end
		a = 1
		while a <= 5 do
			valuesR[i][2][a] = readVars(v:read(), vars[i])
			a = a + 1
		end
		valuesR[i][1] = formatLC(valuesR[i][1], vars[i])
		valuesR[i][2] = formatLC(valuesR[i][2], vars[i])
	end
	for line in v:lines() do
--		local line = v:read()
		valuesR[i][a] = readVars(line, vars[i])
		a = a + 1
	end
end

for a,b in pairs(valuesR) do --a identifica a área da prova, b é a tabela das questões
	for c,d in  pairs(b) do --c identifica a questão ou LEM, d é a tabela de ordens e gabaritos OU tabela LEM
		if d[3] ~= nil then --se for tabela de LEM:
			for e,f in pairs(d) do --e identifica a questão LEM, f é a tabela de ordens e gabaritos
				if values[a][e] == nil then values[a][e] = {} end
				values[a][e][c] = {}
				for g,h in pairs(f) do --g identifica o INDEX, h identifica o VALOR
					if string.sub(g, 1, 2) == "O-" then
						values[a][e][c][tonumber(string.sub(g, 3))] = h
					end
				end
			end
		else
			values[a][c] = {} --abre tabela para cada questão
			for g,h in pairs(d) do --g identifica o INDEX, h identifica o VALOR
				if string.sub(g, 1, 2) == "O-" then
					values[a][c][tonumber(string.sub(g, 3))] = h
				end
			end
		end
	end
end

values = formatInteger(values)

local out = assert(io.open("dump.txt", "w+"))
out:write(serialize(values))
out:flush()
table.save(values, "ord.txt")

