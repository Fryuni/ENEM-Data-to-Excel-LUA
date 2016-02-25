#!/usr/bin/env lua
vars = {}
values = {}
args = {...}
--CSV Read Program
if args == nil or args[1] == nil or args[2] == nil or args[3] == nil then
	print('Insert name of the "data" csv file: ')
	args[1] = io.read()
	print('Insert how many lines do you want to read: ')
	args[2] = io.read()
	print('How many line do you want to skip: ')
	args[3] = io.read()
	print('Save file: ')
	args[4] = io.read()
end
print("Starting program")
local data = assert(io.open(args[1]..".csv","r"))
require "table.save"
require "adapt"

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
		res[tostring(index[i])] = v
	end
	return res
end

top = data:read()

vars = selVars(top)
vars[1] = string.sub(vars[1],4)
print(serialize(vars))
print("Analising data...")
	for x=1,args[3] do
		local line = data:read()
	end
local id = 1
while id <= tonumber(args[2]) do
	local line = data:read()
--for line in data:lines() do
	if line ~= nil then
	local prevValue = readVars(line, vars)
--	if prevValue["IN_STATUS_REDACAO"] ~= 7 or prevValue["IN_PRESENCA_CN"] ~= 1 or prevValue["IN_PRESENCA_CH"] ~= 1 or prevValue["IN_PRESENCA_LC"] ~= 1 or prevValue["IN_PRESENCA_MT"] ~= 1 then
--		id=id-1
--	else
	values[id] = prevValue
--	values[id][vars[1]] = nil
--	values[id][vars[2]] = nil
--	values[id][vars[3]] = nil
--	values[id][vars[4]] = nil
	for ex=5,8 do
		values[id][vars[ex]] = math.floor(values[id][vars[ex]]/100)*100
	end
--	end
	end
	id = id+1
	print("Processing..."..id.."/"..args[2])
end
print("Data sucefully analised")
print("Saving table...")
table.save(values, args[4]..".txt")
print("Table saved!")

