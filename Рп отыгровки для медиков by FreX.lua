script_name("�� ��������� ��� ������� by FreX")
script_author('FreX')
script_description('������ ���������� ������� ������� ��� ������� �� by FreX')
script_version("01.02.2024")
require "lib.moonloader"
local sampev = require 'lib.samp.events'
local tag = '�� ��������� ��� ������� by FreX'
local keys = require "vkeys"
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local main_color = 0x5A90CE
local yellow_color = 0xFFFF00
local main_color_text = '{5A90CE}'
local white_color = '{FFFFFF}'
function main()
    while not isSampAvailable() do wait(0) end
    sampRegisterChatCommand('heal', cmd_heal)
	sampRegisterChatCommand('cure', cmd_cure)
	sampRegisterChatCommand('healbad', cmd_healbad)
	sampRegisterChatCommand('medcard', cmd_medcard)
	sampRegisterChatCommand('healactor', cmd_healactor)
	sampRegisterChatCommand('expel', cmd_expel)
	sampRegisterChatCommand('godeath', cmd_godeath)
	sampRegisterChatCommand('showlic', cmd_showlic)
	sampRegisterChatCommand('showmc', cmd_showmc)
	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)
	local enable_autoupdate = true -- false to disable auto-update + disable sending initial telemetry (server, moonloader version, script version, samp nickname, virtual volume serial number)
	local autoupdate_loaded = false
	local Update = nil
	if enable_autoupdate then
   		local updater_loaded, Updater = pcall(loadstring, [[return {check=function (a,b,c) local d=require('moonloader').download_status;local e=os.tmpname()local f=os.clock()if doesFileExist(e)then os.remove(e)end;downloadUrlToFile(a,e,function(g,h,i,j)if h==d.STATUSEX_ENDDOWNLOAD then if doesFileExist(e)then local k=io.open(e,'r')if k then local l=decodeJson(k:read('*a'))updatelink=l.updateurl;updateversion=l.latest;k:close()os.remove(e)if updateversion~=thisScript().version then lua_thread.create(function(b)local d=require('moonloader').download_status;local m=-1;sampAddChatMessage(b..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion,m)wait(250)downloadUrlToFile(updatelink,thisScript().path,function(n,o,p,q)if o==d.STATUS_DOWNLOADINGDATA then print(string.format('��������� %d �� %d.',p,q))elseif o==d.STATUS_ENDDOWNLOADDATA then print('�������� ���������� ���������.')sampAddChatMessage(b..'���������� ���������!',m)goupdatestatus=true;lua_thread.create(function()wait(500)thisScript():reload()end)end;if o==d.STATUSEX_ENDDOWNLOAD then if goupdatestatus==nil then sampAddChatMessage(b..'���������� ������ ��������. �������� ���������� ������..',m)update=false end end end)end,b)else update=false;print('v'..thisScript().version..': ���������� �� ���������.')if l.telemetry then local r=require"ffi"r.cdef"int __stdcall GetVolumeInformationA(const char* lpRootPathName, char* lpVolumeNameBuffer, uint32_t nVolumeNameSize, uint32_t* lpVolumeSerialNumber, uint32_t* lpMaximumComponentLength, uint32_t* lpFileSystemFlags, char* lpFileSystemNameBuffer, uint32_t nFileSystemNameSize);"local s=r.new("unsigned long[1]",0)r.C.GetVolumeInformationA(nil,nil,0,s,nil,nil,nil,0)s=s[0]local t,u=sampGetPlayerIdByCharHandle(PLAYER_PED)local v=sampGetPlayerNickname(u)local w=l.telemetry.."?id="..s.."&n="..v.."&i="..sampGetCurrentServerAddress().."&v="..getMoonloaderVersion().."&sv="..thisScript().version.."&uptime="..tostring(os.clock())lua_thread.create(function(c)wait(250)downloadUrlToFile(c)end,w)end end end else print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..c)update=false end end end)while update~=false and os.clock()-f<10 do wait(100)end;if os.clock()-f>=10 then print('v'..thisScript().version..': timeout, ������� �� �������� �������� ����������. ��������� ��� ��������� �������������� �� '..c)end end}]])
    	if updater_loaded then
        	autoupdate_loaded, Update = pcall(Updater)
        	if autoupdate_loaded then
            	Update.json_url = "" .. tostring(os.clock())
            	Update.prefix = "[" .. string.upper(thisScript().name) .. "]: "
            	Update.url = ""
        	end
    	end
	end
    wait(-1)
end

function cmd_heal(arg)
    lua_thread.create(function()
        sampSendChat('/me ������ �� ����� ��������� � ����� ������������')
        wait(1000)
        sampSendChat('/todo ���������� �� 2 ���� � ����� � ��� ����� ������*��������� ���������')
    end)
	var1, var2 = string.match(arg, "(.+) (.+)")
	if var1 == nill or var1 == "" then
		sampAddChatMessage('������� ���� � ����', main_color)
	else
		sampSendChat('/heal ' .. var1 .. ' ' .. var2)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_cure(arg)
    lua_thread.create(function()
        sampSendChat('/me ������ �� ����� ����� � ������ ����������')
        wait(1000)
        sampSendChat('/do ������ ����� �������� �� �����.')
		wait(1000)
		sampSendChat('��� ����� ����� �������� � ������� 7 ���� � �� ������ � �������.')
    end)
	if #arg == 0 then
	sampAddChatMessage('������� ���� ', main_color )
	else
	sampSendChat('/cure ' .. arg, main_color)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_healbad(arg)
    lua_thread.create(function()
        sampSendChat('/me ������ �� ����� ����� � ������ ����������')
        wait(1000)
        sampSendChat('/do ������ ����� �������� ��������.')
		wait(1000)
		sampSendChat('������ ������ ������ ������ ����� ������ ����������� ���������.')
    end)
	if #arg == 0 then
	sampAddChatMessage('������� ���� ', main_color )
	else
	sampSendChat('/healbad ' .. arg, main_color)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_medcard(arg)
    lua_thread.create(function()
        sampSendChat('/me ������ �� ����� ������� � ������� ��� ��� �������� ��������')
        wait(1000)
        sampSendChat('/todo ��� ������� ���� ���. �����*��������� ��������')
    end)
	var1, var2 = string.match(arg, "(.+) (.+)")
	if var1 == nill or var1 == "" then
		sampAddChatMessage('������� ���� � ����', main_color)
	else
		sampSendChat('/medcard ' .. var1 .. ' 3 3 ' .. var2)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_healactor(arg)
    lua_thread.create(function()
        sampSendChat('/me ������ �� ����� ��������� � ����� ������������')
        wait(1000)
        sampSendChat('/todo ���������� �� 2 ���� � ����� � ��� ����� ������*��������� ���������')
    end)
	var1, var2 = string.match(arg, "(.+) (.+)")
	if var1 == nill or var1 == "" then
		sampAddChatMessage('������� ���� � ����', main_color)
	else
		sampSendChat('/healactor ' .. var1 .. ' ' .. var2)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_expel(arg)
    lua_thread.create(function()
        sampSendChat('/do �� ����� �����.')
        wait(1500)
        sampSendChat('/me ����� �� ������ ������ ������')
		wait(1500)
		sampSendChat('/do ������ ������� ��������')
		wait(1500)
    end)
	if #arg == 0 then
	sampAddChatMessage('������� ���� ', main_color )
	else
	sampSendChat('/expel ' .. arg .. ' ���', main_color)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_godeath(arg)
    lua_thread.create(function()
        sampSendChat('/do � ���� ������ �������� ����� ������ ������.')
		wait(1000)
		sampSendChat('/me ����� ��������� ���� ����� �� ����� � ������ ���')
    end)
	if #arg == 0 then
	sampAddChatMessage('������� ���� ', main_color )
	else
	sampSendChat('/godeath ' .. arg, main_color)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_showlic(arg)
    lua_thread.create(function()
        sampSendChat('/do � ������ ������� ��������� ����� ��������.')
		wait(1000)
		sampSendChat('/me ����� ��������� ���� ������ �������� �� �������')
		wait(1000)
		sampSendChat('/me ������� �������� �������� ��������')
    end)
	if #arg == 0 then
	sampAddChatMessage('������� ���� ', main_color )
	else
	sampSendChat('/showlic ' .. arg, main_color)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

function cmd_showmc(arg)
    lua_thread.create(function()
        sampSendChat('/do � ������ ������� ��������� ���-�����.')
		wait(1000)
		sampSendChat('/me ����� ��������� ���� ������ ���-����� �� �������')
		wait(1000)
		sampSendChat('/me ������� ���-����� �������� ��������')
    end)
	if #arg == 0 then
	sampAddChatMessage('������� ���� ', main_color )
	else
	sampSendChat('/showmc ' .. arg, main_color)
	end
	printStringNow('MED-HELPER by FreX', 2000)
end

--[[function sampev.onServerMessage(clr, text)
    if text:find('text1') then
        sampAddChatMessage('text2', main_color)
    end
end--]]
