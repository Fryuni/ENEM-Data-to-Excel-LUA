#!/usr/bin/env lua5.1
require "table.save"
tip = tonumber(io.read())
local ord = table.load("PLANILHAS/ord.txt")
print("Loading data "..tip)
local data = table.load("dump"..tip..".txt")
--local data = table.load("dump1.txt")
--print(serialize(ord["cn"][1]))
--print(serialize(data[5]))
local quest = {}
if tip > 1 then
print("Loading pre-table...")
quest = table.load("quest.txt")
print("Pre-table loaded!")
io.read()
end
--print(serialize(data[math.random(#data)]))
function opt(vars, char)
	local v = string.sub(vars, char, char)
	return v
end

function CHanl(s, prov, nota)
	--if quest[prov] == nil then quest[prov] = {} end
	for i=1,45 do
		local letter = opt(s, i)
		if letter == "A" or letter == "B" or letter == "C" or letter == "D" or letter == "E" or letter == "." then
--		print(nota)
--		print(i)
--		print(prov)
--		print(ord["ch"][i][prov])
		if type(quest[ord["ch"][i][prov]]) ~= "table" then quest[ord["ch"][i][prov]] = {} end
		--if type(quest[ord["ch"][i][prov]][prov]) ~= "table" then quest[ord["ch"][i][prov]][prov] = {} end
		if type(quest[ord["ch"][i][prov]][nota]) ~= "table" then quest[ord["ch"][i][prov]][nota] = {} end
--		print(letter)
--		print(type(quest[ord["ch"][i][prov]][prov]))
--		print(quest[ord["ch"][i][prov]][nota][letter])
--		io.read()
		if quest[ord["ch"][i][prov]][nota][letter] == nil then quest[ord["ch"][i][prov]][nota][letter] = 1
		else quest[ord["ch"][i][prov]][nota][letter] = quest[ord["ch"][i][prov]][nota][letter] + 1 end
		if quest[ord["ch"][i][prov]][nota][letter] == nil then quest[ord["ch"][i][prov]][nota]["total"] = 1
		else quest[ord["ch"][i][prov]][nota][letter] = quest[ord["ch"][i][prov]][nota]["total"] + 1 end
	end end
end

function CNanl(s, prov, nota)
	for i=1,45 do
		local letter = opt(s, i)
		if letter == "A" or letter == "B" or letter == "C" or letter == "D" or letter == "E" or letter == "." then
		if type(quest[ord["cn"][i][prov]]) ~= "table" then quest[ord["cn"][i][prov]] = {} end
		if type(quest[ord["cn"][i][prov]][prov]) ~= "table" then quest[ord["cn"][i][prov]][prov] = {} end
		if type(quest[ord["cn"][i][prov]][nota]) ~= "table" then quest[ord["cn"][i][prov]][nota] = {} end
		if quest[ord["cn"][i][prov]][nota][letter] == nil then quest[ord["cn"][i][prov]][nota][letter] = 1
		else quest[ord["cn"][i][prov]][nota][letter] = quest[ord["cn"][i][prov]][nota][letter] + 1 end
		if quest[ord["cn"][i][prov]][nota][letter] == nil then quest[ord["cn"][i][prov]][nota]["total"] = 1
		else quest[ord["cn"][i][prov]][nota][letter] = quest[ord["cn"][i][prov]][nota]["total"] + 1 end
	end end
end

function MTanl(s, prov, nota)
	for i=1,45 do
		local letter = opt(s, i)
		if letter == "A" or letter == "B" or letter == "C" or letter == "D" or letter == "E" or letter == "." then
		if type(quest[ord["mt"][i][prov]]) ~= "table" then quest[ord["mt"][i][prov]] = {} end
		--if type(quest[ord["mt"][i][prov]][prov]) ~= "table" then quest[ord["mt"][i][prov]][prov] = {} end
		if type(quest[ord["mt"][i][prov]][nota]) ~= "table" then quest[ord["mt"][i][prov]][nota] = {} end
		if quest[ord["mt"][i][prov]][nota][letter] == nil then quest[ord["mt"][i][prov]][nota][letter] = 1
		else quest[ord["mt"][i][prov]][nota][letter] = quest[ord["mt"][i][prov]][nota][letter] + 1 end
		if quest[ord["mt"][i][prov]][nota][letter] == nil then quest[ord["mt"][i][prov]][nota]["total"] = 1
		else quest[ord["mt"][i][prov]][nota][letter] = quest[ord["mt"][i][prov]][nota]["total"] + 1 end
	end end
end


function LCanl(s, prov, nota, idiom)
	for i=1,5 do
		local letter = opt(s, i)
		if letter == "A" or letter == "B" or letter == "C" or letter == "D" or letter == "E" or letter == "." then
		local lang
		if idiom == 1 then lang = "inglês" else lang = "espanhol" end
		if type(quest[ord["lc"][i][idiom][prov]]) ~= "table" then quest[ord["lc"][i][idiom][prov]] = {} end
		if type(quest[ord["lc"][i][idiom][prov]][lang]) ~= "table" then quest[ord["lc"][i][idiom][prov]][lang] = {} end
		--if type(quest[ord["lc"][i][idiom][prov]][lang][prov]) ~= "table" then quest[ord["lc"][i][idiom][prov]][lang][prov] = {} end
		if type(quest[ord["lc"][i][idiom][prov]][lang][nota]) ~= "table" then quest[ord["lc"][i][idiom][prov]][lang][nota] = {} end
		if quest[ord["lc"][i][idiom][prov]][lang][nota][letter] == nil then quest[ord["lc"][i][idiom][prov]][lang][nota][letter] = 1
		else quest[ord["lc"][i][idiom][prov]][lang][nota][letter] = quest[ord["lc"][i][idiom][prov]][lang][nota][letter] + 1 end
		if quest[ord["lc"][i][idiom][prov]][lang][nota]["total"] == nil then quest[ord["lc"][i][idiom][prov]][lang][nota]["total"] = 1
		else quest[ord["lc"][i][idiom][prov]][lang][nota]["total"] = quest[ord["lc"][i][idiom][prov]][lang][nota]["total"] + 1 end
	end end
	for i=6,45 do
		local letter = opt(s, i)
		if letter == "A" or letter == "B" or letter == "C" or letter == "D" or letter == "E" or letter == "." then
		if type(quest[ord["lc"][i][prov]]) ~= "table" then quest[ord["lc"][i][prov]] = {} end
		--if type(quest[ord["lc"][i][prov]][prov]) ~= "table" then quest[ord["lc"][i][prov]][prov] = {} end
		if type(quest[ord["lc"][i][prov]][nota]) ~= "table" then quest[ord["lc"][i][prov]][nota] = {} end
		if quest[ord["lc"][i][prov]][nota][letter] == nil then quest[ord["lc"][i][prov]][nota][letter] = 1
		else quest[ord["lc"][i][prov]][nota][letter] = quest[ord["lc"][i][prov]][nota][letter] + 1 end
		if quest[ord["lc"][i][prov]][nota][letter] == nil then quest[ord["lc"][i][prov]][nota]["total"] = 1
		else quest[ord["lc"][i][prov]][nota][letter] = quest[ord["lc"][i][prov]][nota]["total"] + 1 end
	end end
end

print("Data loaded sucefull!")
for a,b in pairs(data) do
	CHanl(b["TX_RESPOSTAS_CH"], b["ID_PROVA_CH"], b["NOTA_CH"])
	CNanl(b["TX_RESPOSTAS_CN"], b["ID_PROVA_CN"], b["NOTA_CN"])
	MTanl(b["TX_RESPOSTAS_MT"], b["ID_PROVA_MT"], b["NOTA_MT"])
	LCanl(b["TX_RESPOSTAS_LC"], b["ID_PROVA_LC"], b["NOTA_LC"], b["TP_LINGUA"]+1)
	print("Processing... "..a)
end
print("Saving "..tip.."# part")
table.save(quest, "quest.txt")
print("Save complete!")
