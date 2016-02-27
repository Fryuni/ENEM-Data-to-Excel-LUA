#!usr/bin/env lua
require "tablesaver"
require "adapt"
local file = assert(io.open("ITENS_ENEM_2013.csv", "r"))
local out = assert(io.open("dump.txt", "w+"))
local values = {}
for line in file:lines()do
	index = string.sub(line, 1, string.find(line, ";") - 1)
	gab = string.sub(line, string.find(line, ";") + 1)
	values[index] = gab
end

out:write(serialize(values))
out:flush()
table.save(values, "ord.txt")

