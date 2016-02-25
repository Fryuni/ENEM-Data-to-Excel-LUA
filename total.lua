#!/usr/bin lua
local quest = table.load("quest.txt")
require "table.save"

for item, notas in pairs(quest) do
	if item < 91 or item > 95 then
		for f=100,900,100 do if type(notas[f]) == "table" then
			quest[item][f]["total"] = 0
			for i,v in pairs(notas[f]) do
				if i ~= "*" then quest[item][f]["total"] = quest[item][f]["total"] + v end
			end
		end end
	else
		for lang, rnotas in pairs(notas) do
			for f=100,900,100 do if type(rnotas[f]) == "table" then
				quest[item][lang][f]["total"] = 0
				for i,v in pairs(rnotas[f]) do
					if i ~= "*" then quest[item][lang][f]["total"] = quest[item][lang][f]["total"] + v end
				end
			end end
		end
	end
end
table.save(quest, "quest2.txt")
