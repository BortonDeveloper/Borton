local OutFile = io.open('Out.lua', 'w+')

OutFile:write("--Obfuscated Via Borton\n\n")

local InFile = io.open('luac.out', 'rb')
local Script = InFile:read('*all')
InFile:close()

os.remove('luac.out')
os.remove('Out1.lua')

local RerFile = io.open('Rerubi.min.lua', 'rb')
local Rerubi = RerFile:read('*all')
RerFile:close()

local bytes = {}

Script:gsub(".", function(bb) table.insert(bytes, string.byte(bb)) end)
Script = table.concat(bytes, ",")

Script = Rerubi .. '({'..Script..'})()'

OutFile:write(Script)
OutFile:close()

print('Finished')