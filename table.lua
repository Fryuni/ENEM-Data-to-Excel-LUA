#!/usr/bin lua
require "tablesaver"
local quest = table.load("quest2.txt")
local gab = table.load("PLANILHAS/ord.txt")
local dump = assert(io.open("dump.txt","w+"))
os.execute("mkdir \"GRAPHS")
os.execute("mkdir \"GRAPHS/data")



function plotRelative() for item, notas in pairs(quest) do
	if item < 91 or item > 95 then
		local out = assert(io.open("GRAPHS/data/RelativeData"..item..".csv", "w+"))
		local fCell = tostring(item).." - Gab: "..gab[tostring(item)]
		local fline = fCell..";A;B;C;D;E;BRANCO\n"
		out:write(fline)
		local vline = ""
		for f=100,900,100 do if type(notas[f]) == "table" then
			vline = tostring(f)..";"
			if type(notas[f]["A"]) == "number" then vline = vline..string.gsub(tostring(math.floor(notas[f]["A"]*1000/notas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
			if type(notas[f]["B"]) == "number" then vline = vline..string.gsub(tostring(math.floor(notas[f]["B"]*1000/notas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
			if type(notas[f]["C"]) == "number" then vline = vline..string.gsub(tostring(math.floor(notas[f]["C"]*1000/notas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
			if type(notas[f]["D"]) == "number" then vline = vline..string.gsub(tostring(math.floor(notas[f]["D"]*1000/notas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
			if type(notas[f]["E"]) == "number" then vline = vline..string.gsub(tostring(math.floor(notas[f]["E"]*1000/notas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
			if type(notas[f]["."]) == "number" then vline = vline..string.gsub(tostring(math.floor(notas[f]["."]*1000/notas[f]["total"])/10), "%.", ",").."\n" else vline = vline.."0\n" end
			--vline = string.sub(vline, 1, -2).."\n"
			out:write(vline)
		end end
		out:flush()
	else
		for lang, rnotas in pairs(notas) do
			local let
			if lang == "inglÃªs" then lang = "inglês" let = "i" else let = "e" end
			--os.execute("mkdir \"GRAPHS/data/RelativeData"..lang)
			local out = assert(io.open("GRAPHS/data/RelativeData"..item..let..".csv", "w+"))
			local fCell = tostring(item).." "..lang.." - Gab: "..gab[tostring(item)..let]
			local fline = fCell..";A;B;C;D;E;BRANCO\n"
			out:write(fline)
			local vline = ""
			for f=100,900,100 do if type(rnotas[f]) == "table" then
				vline = tostring(f)..";"
				if type(rnotas[f]["A"]) == "number" then vline = vline..string.gsub(tostring(math.floor(rnotas[f]["A"]*1000/rnotas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
				if type(rnotas[f]["B"]) == "number" then vline = vline..string.gsub(tostring(math.floor(rnotas[f]["B"]*1000/rnotas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
				if type(rnotas[f]["C"]) == "number" then vline = vline..string.gsub(tostring(math.floor(rnotas[f]["C"]*1000/rnotas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
				if type(rnotas[f]["D"]) == "number" then vline = vline..string.gsub(tostring(math.floor(rnotas[f]["D"]*1000/rnotas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
				if type(rnotas[f]["E"]) == "number" then vline = vline..string.gsub(tostring(math.floor(rnotas[f]["E"]*1000/rnotas[f]["total"])/10), "%.", ",")..";" else vline = vline.."0;" end
				if type(rnotas[f]["."]) == "number" then vline = vline..string.gsub(tostring(math.floor(rnotas[f]["."]*1000/rnotas[f]["total"])/10), "%.", ",").."\n" else vline = vline.."0\n" end
				--vline = string.sub(vline, 1, -2).."\n"
				out:write(vline)
			end end
			out:flush()
		end
	end
end end

function plotAbsolute() for item, notas in pairs(quest) do
	if item < 91 or item > 95 then
		local out = assert(io.open("GRAPHS/data/AbsoluteData"..item..".csv", "w+"))
		local fCell = tostring(item).." - Gab: "..gab[tostring(item)]
		local fline = fCell..";A;B;C;D;E;BRANCO\n"
		out:write(fline)
		local vline = ""
		for f=100,900,100 do if type(notas[f]) == "table" then
			vline = tostring(f)..";"
			if type(notas[f]["A"]) == "number" then vline = vline..notas[f]["A"]..";" else vline = vline.."0;" end
			if type(notas[f]["B"]) == "number" then vline = vline..notas[f]["B"]..";" else vline = vline.."0;" end
			if type(notas[f]["C"]) == "number" then vline = vline..notas[f]["C"]..";" else vline = vline.."0;" end
			if type(notas[f]["D"]) == "number" then vline = vline..notas[f]["D"]..";" else vline = vline.."0;" end
			if type(notas[f]["E"]) == "number" then vline = vline..notas[f]["E"]..";" else vline = vline.."0;" end
			if type(notas[f]["."]) == "number" then vline = vline..notas[f]["."].."\n" else vline = vline.."0\n" end
			--vline = string.sub(vline, 1, -2).."\n"
			out:write(vline)
		end end
		out:flush()
	else
		for lang, rnotas in pairs(notas) do
			local let
			if lang == "inglÃªs" then lang = "inglês" let = "i" else let = "e" end
			--os.execute("mkdir \"GRAPHS/data/RelativeData"..lang)
			local out = assert(io.open("GRAPHS/data/AbsoluteData"..item..let..".csv", "w+"))
			local fCell = tostring(item).." "..lang.." - Gab: "..gab[tostring(item)..let]
			local fline = fCell..";A;B;C;D;E;BRANCO\n"
			out:write(fline)
			local vline = ""
			for f=100,900,100 do if type(rnotas[f]) == "table" then
				vline = tostring(f)..";"
				if type(rnotas[f]["A"]) == "number" then vline = vline..rnotas[f]["A"]..";" else vline = vline.."0;" end
				if type(rnotas[f]["B"]) == "number" then vline = vline..rnotas[f]["B"]..";" else vline = vline.."0;" end
				if type(rnotas[f]["C"]) == "number" then vline = vline..rnotas[f]["C"]..";" else vline = vline.."0;" end
				if type(rnotas[f]["D"]) == "number" then vline = vline..rnotas[f]["D"]..";" else vline = vline.."0;" end
				if type(rnotas[f]["E"]) == "number" then vline = vline..rnotas[f]["E"]..";" else vline = vline.."0;" end
				if type(rnotas[f]["."]) == "number" then vline = vline..rnotas[f]["."].."\n" else vline = vline.."0\n" end
				--vline = string.sub(vline, 1, -2).."\n"
				out:write(vline)
			end end
			out:flush()
		end
	end
end end

plotAbsolute()
plotRelative()
