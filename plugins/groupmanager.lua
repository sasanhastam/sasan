local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- super👤User👤 and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '_🔒🚫Dear 👤User👤 you are not admin🚫🔒_'
else
     return '🔒🚫👤کاربر👤 گرامی شما ادمین ربات نمی باشید🚫🔒'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '_🌷🌀The group is on the list🌀🌷_'
else
return '🌷🌀گروه در لیست موجود است🌀🌷'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_👤User👤s ={},
      filterlist ={},
      whitelist ={},
      settings = {
          set_name = msg.to.title,
          🔱setting for bot sasan🔱
🖇lock_link = '↪️yes↩️',
         🔒🌀 lock_tag = '↪️yes↩️',
          🔒📥lock_spam = '↪️yes↩️',
          🔒🌐lock_webpage = '↪️no↩️',
          🔒📎lock_markdown = '↪️no↩️',
          🔒➰flood = '↪️yes↩️',
          🔒🚹lock_bots = '↪️yes↩️',
          🔒🔖lock_pin = '↪️no↩️',
          🔆welcome = '↪️no↩️',
      🔒⬇️lock_join = '↪️no↩️',
      🔒📝lock_edit = '↪️no↩️',
      🔒🅰️lock_arabic = '↪️no↩️',
      🔒➡️lock_mention = '↪️no↩️',
      🔒↕️lock_all = '↪️no↩️',
     🔮num_msg_max = '5',
      ⚖️set_char = '40',
      ⏰time_check = '2',
          },
     🔊mutes🔊 = {
                  ➡️mute_forward = '↪️no↩️',
                  🔊mute_audio = '↪️no↩️',
                  📀mute_video = '↪️no↩️',
                  👥mute_contact = '↪️no↩️',
                  🗒mute_text = '↪️no↩️',
                  🌃mute_photo = '↪️no↩️',
                  🎏mute_gif = '↪️no↩️',
                  Ⓜ️mute_location = '↪️no↩️',
                  🗂mute_document = '↪️no↩️',
                  🎉mute_sticker = '↪️no↩️',
                  🔊mute_voice = '↪️no↩️',
                  ♻️mute_all = '↪️no↩️',
          💢mute_keyboard = '↪️no↩️',
          🎮mute_game = '↪️no↩️',
          ✴️mute_inline = '↪️no↩️',
           ⚛️mute_tgservice = '↪️no↩️',
		   
		 '🔥°°Version of bot 7.1.1°°❄️',
'🔥°°🇮🇷Creat by @sasan8u°°❄️',
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '*⚙️✅The group was successfully added to the existing group list✅⚙️*'..msg_caption
else
  return '⚙️✅گروه با موفقیت در لیست گروه های موجود افزوده شده است✅⚙️'..msg_caption
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- super👤User👤 and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '_🔒🚫Dear 👤User👤 you are not admin🚫🔒_'
   else
        return '🔒🚫👤کاربر👤 گرامی شما ادمین ربات نمی باشید🚫🔒'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '_⚠️Group is not added⚠️_'
else
    return '⚠️ گروه به لیست گروه های مدیریتی ربات اضافه نشده است⚠️'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '*⚙️❎The group was successfully deleted from the list of available groups❎⚙️*'
 else
  return '⚙️❎گروه با موفقیت در لیست گروه های موجود حذف شد❎⚙️'
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return "_Word_ *"..word.."* _🔥is already filtered🔥_"
            else
         return "_کلمه_ *"..word.."* _🔥از قبل فیلتر بود🔥_"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "_Word_ *"..word.."* _🗑💢added to filtered words list💢🗑_"
            else
         return "_کلمه_ *"..word.."* _🗑💢به لیست کلمات فیلتر شده اضافه شد💢🗑_"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "_Word_ *"..word.."* _♻️🗑♻️🗑removed from filtered words list🗑♻️🗑♻️_"
       elseif lang then
         return "_کلمه_ *"..word.."* _♻️🗑از لیست کلمات فیلتر شده حذف شد🗑♻️_"
     end
      else
       if not lang then
         return "_Word_ *"..word.."* _is not filtered_"
       elseif lang then
         return "_کلمه_ *"..word.."* _از قبل فیلتر نبود_"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "_⚠️Group is not added⚠️_"
 else
    return "⚠️ گروه به لیست گروه های مدیریتی ربات اضافه نشده است⚠️"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "👑_No_ *moderator* _in this group_👑"
else
   return "👑در حال حاضر 🚫👤هیچ مدیری برای گروه انتخاب نشده است👤🚫👑"
  end
end
if not lang then
   message = '*👑👥List of moderators👥👑 :*\n'
else
   message = '*👑👥لیست مدیران گروه👥👑 :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "_⚠️Group is not added⚠️_"..msg_caption
else
return "⚠️ گروه به لیست گروه های مدیریتی ربات اضافه نشده است⚠️"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "🚫😇🚫😇_No_ *owner* _in this group_😇🚫😇🚫"
else
    return "🚫😇در حال حاضر هیچ مالکی برای گروه انتخاب نشده است😇🚫"
  end
end
if not lang then
   message = '*👑👥List of moderators👥👑 :*\n'
else
   message = '*👥👑لیست مالکین گروه👥👑 :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_👤User👤_id_) then return false end
    if data.sender_👤User👤_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_⚠️Group is not added⚠️_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_⚠️ گروه به لیست گروه های مدیریتی ربات اضافه نشده است⚠️_", 0, "md")
     end
  end
    if cmd == "setwhitelist" then
local function setwhitelist_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, setwhitelist_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
    if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, remwhitelist_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل صاحب گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به مقام صاحب گروه منتصب شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, owner_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل مدیر گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, promote_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل صاحب گروه نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از مقام صاحب گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل مدیر گروه نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از مقام مدیر گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, demote_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = data.sender_👤User👤_id_
  }, id_cb, {chat_id=data.chat_id_,👤User👤_id=data.sender_👤User👤_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_👤کاربر👤 یافت نشد_", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*👤User👤 Not Found*", 0, "md")
      end
   end
end

local function action_by_👤User👤name(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_⚠️Group is not added⚠️_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_⚠️ گروه به لیست گروه های مدیریتی ربات اضافه نشده است⚠️_", 0, "md")
     end
  end
if not arg.👤User👤name then return false end
   if data.id_ then
if data.type_.👤User👤_.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.type_.👤User👤_.👤User👤name_)
else
👤User👤_name = check_markdown(data.title_)
end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل صاحب گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به مقام صاحب گروه منتصب شد*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل مدیر گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل صاحب گروه نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از مقام صاحب گروه برکنار شد*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل مدیر گروه نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از مقام مدیر گروه برکنار شد*", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "Result for [ "..check_markdown(data.type_.👤User👤_.👤User👤name_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "اطلاعات برای [ "..check_markdown(data.type_.👤User👤_.👤User👤name_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤 یافت نشد_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👤User👤 Not Found*", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_⚠️Group is not added⚠️_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_⚠️ گروه به لیست گروه های مدیریتی ربات اضافه نشده است⚠️_", 0, "md")
     end
  end
if not tonumber(arg.👤User👤_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.👤User👤name_ then
👤User👤_name = '@'..check_markdown(data.👤User👤name_)
else
👤User👤_name = check_markdown(data.first_name_)
end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل صاحب گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به مقام صاحب گروه منتصب شد*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل مدیر گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = 👤User👤_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل صاحب گروه نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از مقام صاحب گروه برکنار شد*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از قبل مدیر گروه نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤_ "..👤User👤_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤_ "..👤User👤_name.." *"..data.id_.."* *از مقام مدیر گروه برکنار شد*", 0, "md")
   end
end
    if cmd == "whois" then
if data.👤User👤name_ then
👤User👤name = '@'..check_markdown(data.👤User👤name_)
else
if not lang then
👤User👤name = 'not found'
 else
👤User👤name = 'ندارد'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'Info for [ '..data.id_..' ] :\n👤User👤Name : '..👤User👤name..'\nName : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'اطلاعات برای [ '..data.id_..' ] :\nیوزرنیم : '..👤User👤name..'\nنام : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤User👤 not founded_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤 یافت نشد_", 0, "md")
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👤کاربر👤 یافت نشد_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👤User👤 Not Found*", 0, "md")
      end
   end
end


---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "⭕️♻️🔒*Link* _loocked_🔒♻️⭕️"
elseif lang then
 return "🔒♻️⭕️قفل لینک فعال شد⭕️♻️🔒"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "⭕️♻️🔒*Link* _loocked_🔒♻️⭕️"
else
 return "⭕️♻️🔒ارسال لینک در گروه ممنوع شد⭕️♻️🔒"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "🔓⭕️*Link* _Posting Is Not Locked⭕️🔓_" 
elseif lang then
return "⭕️🔓ارسال لینک در گروه ممنوع نمیباشد🔓⭕️"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "✅🔓*Link* _Posting Has Been Unlocked🔓✅_" 
else
return "✅🔓ارسال لینک در گروه آزاد شد🔓✅"
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "⭕️♻️🔒*Tag* _loocked_🔒♻️⭕️"
elseif lang then
 return "🔒♻️⭕️قفل تگ فعال شد⭕️♻️🔒"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔒🚫*Tag* _Posting Has Been Locked_🔒🚫"
else
 return "🔒🚫ارسال تگ ممنوع شد🚫🔒"
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "⭕️♻️🔒*Tag* _is not look_🔒♻️⭕️" 
elseif lang then
return "⭕️♻️🔒ارسال تگ در گروه ممنوع نمیباشد⭕️♻️🔒"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓✅*Tag* _Posting Has Been Unlocked_✅🔓" 
else
return "🔓✅ارسال تگ در گروه آزاد شد✅🔓"
end
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then	
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "🔒♻️⭕️*Mention* _loocked_🔒♻️⭕️"
elseif lang then
 return "🔒♻️⭕️قفل فراخوانی فعال شد⭕️♻️🔒"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "🔒♻️⭕️*Mention* _Posting Has Been Locked_🔒♻️⭕️"
else 
 return "🔒♻️⭕️ارسال فراخوانی افراد در گروه ممنوع شد🔒♻️⭕️"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "🔓💢*Mention* _not loocked_🔓💢" 
elseif lang then
return "🔓💢ارسال فراخوانی افراد در گروه ممنوع نمیباشد🔓💢"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Mention* _Posting Has Been Unlocked_" 
else
return "🔓✅ارسال فراخوانی افراد در گروه آزاد شد✅🔓"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "🔒♻️⭕️*Arabic/Persian* _loocked_️♻️🔒"
elseif lang then
 return "🔒♻️⭕️قفل کلمات عربی/فارسی فعال شد⭕️♻️🔒"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*🔒♻️⭕️*Arabic/Persian* _loocked_️♻️🔒"
else
 return "🔒♻️⭕️قفل کلمات عربی/فارسی فعال شد⭕️♻️🔒"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "⭕️♻️🔓*Arabic/Persian* _ not loocked_🔓♻️⭕️" 
elseif lang then
return "🔓♻️⭕️قفل کلمات عربی/فارسی غیر فعال شد⭕️♻️🔓"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓✅*Arabic/Persian* _Posting Has Been Unlocked_✅🔓" 
else
return "🔓✅ارسال کلمات عربی/فارسی در گروه آزاد شد✅🔓"
end
end
end

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "⭕️♻️🔒*Editing* _Is Already Locked_🔓♻️⭕️"
elseif lang then
 return "🔒♻️⭕️قفل  ویرایش پیام فعال شد⭕️♻️🔒"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔓♻️⭕️*Editing* _Has Been Locked_🔓♻️⭕️"
else
 return "🔓♻️⭕️ویرایش پیام در گروه ممنوع شد🔓♻️⭕️"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "🔓💢*Editing* _Is Not Locked_🔓💢" 
elseif lang then
return "🔓💢ویرایش پیام در گروه ممنوع نمیباشد🔓💢"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓✅*Editing* _Has Been Unlocked_✅🔓" 
else
return "🔓✅ویرایش پیام در گروه آزاد شد✅🔓"
end
end
end

---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "🔒♻️⭕️*Spam* _Is Already Locked_⭕️♻️🔒"
elseif lang then
 return "🔒♻️⭕️قفل اسپم فعال شد⭕️♻️🔒"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔒♻️⭕️*Spam* _Has Been Locked_⭕️♻️🔒"
else
 return "🔒♻️⭕️قفل اسپم فعال شد⭕️♻️🔒"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "🔓💢*Spam* _ not loocked_🔓💢" 
elseif lang then
 return "🔓💢ارسال هرزنامه در گروه ممنوع نمیباشد🔓💢"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "🔓✅*Spam* _Posting Has Been Unlocked_🔓✅" 
else
 return "🔓✅ارسال هرزنامه در گروه آزاد شد🔓✅"
end
end
end

---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "⭕️♻️🔒*Flooding* _Is Already Locked_⭕️♻️🔒"
elseif lang then
 return "🔒♻️⭕️قفل پیام مکررفعال شد⭕️♻️🔒"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "⭕️♻️🔒*Flooding* _Has Been Locked_⭕️♻️🔒"
else
 return "🔒♻️⭕️قفل پیام مکررفعال شد⭕️♻️🔒"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "🔓💢*Flooding* _Is Not Locked_🔓💢" 
elseif lang then
return "🔓💢ارسال پیام مکرر در گروه ممنوع نمیباشد🔓💢"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓✅*Flooding* _Has Been Unlocked_✅🔓" 
else
return "🔓✅ارسال پیام مکرر در گروه آزاد شد✅🔓"
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "🔒♻️⭕️*Bots* _Protection Is Already Enabled_️♻️🔒"
elseif lang then
 return "🔒♻️⭕️قفل تهدیدات ربات قعال شد⭕️♻️🔒"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "✅🔆*Bots* _Protection Has Been Enabled_✅🔆"
else
 return "✅🔆محافظت از گروه در برابر ربات ها فعال شد✅🔆"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "⭕️♻️🔓*Bots* _Protection Is Not Enabled_🔓♻️⭕️" 
elseif lang then
return "🔓♻️⭕️قفل تهدیدات ربات غیر قعال شد⭕️♻️🔓"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓♻️⭕️*Bots* _Protection Has Been Disabled_🔓♻️⭕️" 
else
return "🔓♻️⭕️قفل تهدیدات ربات غیر قعال شد⭕️♻️🔓"
end
end
end

---------------Lock Join-------------------
local function lock_join(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then
if not lang then
 return "⚛️*Lock Join* _Is Already Locked_⚛️"
elseif lang then
 return "⚛️قفل ورود اعضا فعال شد⚛️"
end
else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "⚛️*Lock Join* _Has Been Locked_⚛️"
else
 return "⚛️ورود به گروه ممنوع شد⚛️"
end
end
end

local function unlock_join(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then
if not lang then
return "⚛️*Lock Join* _Is Not Locked_⚛️" 
elseif lang then
return "⚛️ورود به گروه ممنوع نمیباشد⚛️"
end
else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "⚛️*Lock Join* _Has Been Unlocked_⚛️" 
else
return "⚛️ورود به گروه آزاد شد⚛️"
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "*Markdown* _loocked_"
elseif lang then
 return "ارسال پیام های دارای فونت در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Markdown* _Posting Has Been Locked_"
else
 return "ارسال پیام های دارای فونت در گروه ممنوع شد"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "*Markdown* _loocked_"
elseif lang then
return "ارسال پیام های دارای فونت در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Markdown* _Posting Has Been Unlocked_"
else
return "ارسال پیام های دارای فونت در گروه آزاد شد"
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "🚫📝*Webpage* _Is Already Locked_📝🚫"
elseif lang then
 return "🚫📝 قفل ارسال صفحه های وب فعال شد 📝🚫"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🚫📝*Webpage* _Has Been Locked_🚫📝"
else
 return "🚫📝ارسال صفحات وب در گروه ممنوع شد🚫📝"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "🚫📝*Webpage* _Is Not Locked_🚫📝" 
elseif lang then
return "🚫📝ارسال صفحات وب در گروه ممنوع نمیباشد🚫📝"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*Webpage* _Has Been Unlocked_" 
else
return "ارسال صفحات وب در گروه آزاد شد"
end
end
end

---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "*Pinned Message* _Is Already Locked_"
elseif lang then
 return "سنجاق کردن پیام در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Pinned Message* _Has Been Locked_"
else
 return "سنجاق کردن پیام در گروه ممنوع شد"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "*Pinned Message* _Is Not Locked_" 
elseif lang then
return "سنجاق کردن پیام در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*Pinned Message* _Has Been Unlocked_" 
else
return "سنجاق کردن پیام در گروه آزاد شد"
end
end
end

function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "💥🌈_You're Not_ *Moderator💥🌈*"
else
  return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
if data[tostring(target)]["settings"]["set_char"] then 	
SETCHAR = tonumber(data[tostring(target)]['settings']['set_char'])
	print('custom'..SETCHAR) 	
else 	
SETCHAR = 40
end
if data[tostring(target)]["settings"]["time_check"] then 	
TIME_CHECK = tonumber(data[tostring(target)]['settings']['time_check'])
	print('custom'..TIME_CHECK) 	
else 	
TIME_CHECK = 2
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = "no"		
 end
 end
 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_join"] then			
 data[tostring(target)]["settings"]["lock_join"] = "no"		
 end
 end
 local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'نامحدود!'
else
	expire_date = 'Unlimited!'
end
else
	local day = math.floor(expi / 86400) + 1
if lang then
	expire_date = day..' روز'
else
	expire_date = day..' Days'
end
end
if not lang then

local settings = data[tostring(target)]["settings"] 
 text = "*Group Settings:*\n_Lock edit :_ *"..settings.lock_edit.."*\n_Lock links :_ *"..settings.lock_link.."*\n_Lock tags :_ *"..settings.lock_tag.."*\n_Lock Join :_ *"..settings.lock_join.."*\n_Lock flood :_ *"..settings.flood.."*\n_Lock spam :_ *"..settings.lock_spam.."*\n_Lock mention :_ *"..settings.lock_mention.."*\n_Lock arabic :_ *"..settings.lock_arabic.."*\n_Lock webpage :_ *"..settings.lock_webpage.."*\n_Lock markdown :_ *"..settings.lock_markdown.."*\n_Group welcome :_ *"..settings.welcome.."*\n_Lock pin message :_ *"..settings.lock_pin.."*\n_Bots protection :_ *"..settings.lock_bots.."*\n_Flood sensitivity :_ *"..NUM_MSG_MAX.."*\n_Character sensitivity :_ *"..SETCHAR.."*\n_Flood check time :_ *"..TIME_CHECK.."*\n*____________________*\n_Expire Date :_ *"..expire_date.."*\n*Bot channel*: @sasan8u\n*Group Language* : *EN*"
else
local settings = data[tostring(target)]["settings"] 
 text = "*تنظیمات گروه:*\n_قفل ویرایش پیام :_ *"..settings.lock_edit.."*\n_قفل لینک :_ *"..settings.lock_link.."*\n_قفل ورود :_ *"..settings.lock_join.."*\n_قفل تگ :_ *"..settings.lock_tag.."*\n_قفل پیام مکرر :_ *"..settings.flood.."*\n_قفل هرزنامه :_ *"..settings.lock_spam.."*\n_قفل فراخوانی :_ *"..settings.lock_mention.."*\n_قفل عربی :_ *"..settings.lock_arabic.."*\n_قفل صفحات وب :_ *"..settings.lock_webpage.."*\n_قفل فونت :_ *"..settings.lock_markdown.."*\n_پیام خوشآمد گویی :_ *"..settings.welcome.."*\n_قفل سنجاق کردن :_ *"..settings.lock_pin.."*\n_محافظت در برابر ربات ها :_ *"..settings.lock_bots.."*\n_حداکثر پیام مکرر :_ *"..NUM_MSG_MAX.."*\n_حداکثر حروف مجاز :_ *"..SETCHAR.."*\n_زمان بررسی پیام های مکرر :_ *"..TIME_CHECK.."*\n*____________________*\n_تاریخ انقضا :_ *"..expire_date.."*\n*کانال ما*: @sasan8u\n_زبان سوپرگروه_ : *FA*"
end
return text
end
--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*" 
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "🔕⚙️*Mute All* _🔥🌀Is Already Enabled🌀🔥_⚙️🔕" 
elseif lang then
return "⚙️🔕قفل گروه فعال شد🌀🔥گروه با موفیقت قفل شد🔥🌀بیصدای همه فعال شد🔕⚙️"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔕⚙️*Mute All* _🔥🌀Is Already Enabled🌀🔥_⚙️🔕" 
else
return "⚙️🔕قفل گروه فعال شد🌀🔥گروه با موفیقت قفل شد🔥🌀بیصدای همه فعال شد🔕⚙️"
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*" 
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return "🔔⚙️*Mute All* _🔥🌀Is Already Disabled🌀🔥_⚙️🔔" 
elseif lang then
return "⚙️🔔قفل گروه غیر فعال شد🌀🔥قفل گروه با موفیقت باز شد🔥🌀بیصدای همه غیر فعال شد🔔⚙️"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔔⚙️*Mute All* _🔥🌀Is Already Disabled🌀🔥_⚙️🔔" 
else
return "⚙️🔔قفل گروه غیر فعال شد🌀🔥قفل گروه با موفیقت باز شد🔥🌀بیصدای همه غیر فعال شد🔔⚙️"
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "⚙️💿*Mute Gif* _🔥🌀Is Already Enabled🌀🔥_💿⚙️"
elseif lang then
 return "⚙️💿قفل گیف فعال شد🌀🔥ارسال گیف بسته شد🔥🌀بیصدای گیف فعال شد💿⚙️"
end
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "⚙️💿*Mute Gif* _🔥🌀Is Already Enabled🌀🔥_💿⚙️"
else
 return "⚙️💿قفل گیف فعال شد🌀🔥ارسال گیف بسته شد🔥🌀بیصدای گیف فعال شد💿⚙️"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "⚙️💿*Mute Gif* _🔥🌀Is Already Disabled🌀🔥_💿⚙️" 
elseif lang then
return "⚙️💿قفل گیف غیر فعال شد🌀🔥ارسال گیف باز شد🔥🌀بیصدای گیف غیر فعال شد💿⚙️"
end
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "⚙️💿*Mute Gif* _🔥🌀Is Already Disabled🌀🔥_💿⚙️" 
else
return "⚙️💿قفل گیف غیر فعال شد🌀🔥ارسال گیف باز شد🔥🌀بیصدای گیف غیر فعال شد💿⚙️"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "🎮🎯*Mute Game* _Is Already Enabled_🎮🎯"
elseif lang then
 return "🎮🎯بیصدا کردن بازی های تحت وب فعال است🎮🎯"
end
else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🎮🎯*Mute Game* _Has Been Enabled_🎮🎯"
else
 return "🎮🎯بیصدا کردن بازی های تحت وب فعال شد🎮🎯"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "🎮🎯*Mute Game* _Is Already Disabled_🎮🎯" 
elseif lang then
return "🎮🎯بیصدا کردن بازی های تحت وب غیر فعال است🎮🎯"
end
else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🎮🎯*Mute Game* _Has Been Disabled_🎮🎯" 
else
return "🎮🎯بیصدا کردن بازی های تحت وب غیر فعال شد🎮🎯"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "🌀❇*Mute Inline* _Is Already Enabled_❇️🌀"
elseif lang then
 return "🌀❇️بیصدا کردن کیبورد شیشه ای فعال است❇️🌀"
end
else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🌀❇*Mute Inline* _Has Been Enabled_❇️🌀"
else
 return "🌀❇️بیصدا کردن کیبورد شیشه ای فعال است❇️🌀"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "🌀❇️*Mute Inline* _Is Already Disabled_❇️🌀" 
elseif lang then
return "🌀❇️بیصدا کردن کیبورد شیشه ای غیر فعال است❇️🌀"
end
else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🌀❇️*Mute Inline* _Has Been Disabled_❇️🌀" 
else
return "🌀❇️بیصدا کردن کیبورد شیشه ای غیر فعال شد❇️🌀"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "🗒🚫*Mute Text* _Is Already Enabled_🚫🗒"
elseif lang then
 return "🗒🚫بیصدا کردن متن فعال است🚫🗒"
end
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🗒🚫*Mute Text* _Has Been Enabled_🚫🗒"
else
 return "🗒🚫بیصدا کردن متن فعال شد🚫🗒"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "🗒✅*Mute Text* _Is Already Disabled_🗒✅"
elseif lang then
return "🗒✅بیصدا کردن متن غیر فعال است🗒✅" 
end
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🗒✅*Mute Text* _Has Been Disabled_🗒✅" 
else
return "🗒✅بیصدا کردن متن غیر فعال شد🗒✅"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "🌄🚫*Mute Photo* _Is Already Enabled_🌄🚫"
elseif lang then
 return "🌄🚫بیصدا کردن عکس فعال است🌄🚫"
end
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🌄🚫*Mute Photo* _Has Been Enabled_🌄🚫"
else
 return "🌄🚫بیصدا کردن عکس فعال شد🌄🚫"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end
 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "🌄✅*Mute Photo* _Is Already Disabled_🌄✅" 
elseif lang then
return "🌄✅بیصدا کردن عکس غیر فعال است🌄✅"
end
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🌄✅*Mute Photo* _Has Been Disabled_🌄✅" 
else
return "🌄✅بیصدا کردن عکس غیر فعال شد🌄✅"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "🎥✅*Mute Video* _Is Already Enabled_🎥✅"
elseif lang then
 return "🎥✅بیصدا کردن فیلم فعال است🎥✅"
end
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "🎥✅*Mute Video* _Has Been Enabled_🎥✅"
else
 return "🎥✅بیصدا کردن فیلم فعال شد🎥✅"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "🎥🚫*Mute Video* _Is Already Disabled_🎥🚫" 
elseif lang then
return "🎥🚫بیصدا کردن فیلم غیر فعال است🎥🚫"
end
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🎥🚫*Mute Video* _Has Been Disabled_🎥🚫" 
else
return "🎥🚫بیصدا کردن فیلم غیر فعال شد🎥🚫"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "🎵🔆✅*Mute Audio* _Is Already Enabled_🎵🔆✅"
elseif lang then
 return "🎵🔆✅بیصدا کردن آهنگ فعال است🎵🔆✅"
end
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🎵🔆✅*Mute Audio* _Has Been Enabled_🎵🔆✅"
else 
return "🎵🔆✅بیصدا کردن آهنگ فعال شد🎵🔆✅"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "🎵🔆❎*Mute Audio* _Is Already Disabled_🎵🔆❎" 
elseif lang then
return "🎵🔆❎بیصدا کردن آهنک غیر فعال است🎵🔆❎"
end
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🎵🔆❎*Mute Audio* _Has Been Disabled_🎵🔆❎"
else
return "🎵🔆❎بیصدا کردن آهنگ غیر فعال شد🎵🔆❎" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "🔯🔆✅*Mute Voice* _Is Already Enabled_🔯🔆✅"
elseif lang then
 return "🔯🔆✅بیصدا کردن صدا فعال است🔯🔆✅"
end
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔯🔆✅*Mute Voice* _Has Been Enabled_🔯🔆✅"
else
 return "🔯🔆✅بیصدا کردن صدا فعال شد🔯🔆✅"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "🔯🔆❎*Mute Voice* _Is Already Disabled_🔯🔆❎" 
elseif lang then
return "🔯🔆❎بیصدا کردن صدا غیر فعال است🔯🔆❎"
end
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🔯🔆❎*Mute Voice* _Has Been Disabled_🔯🔆❎" 
else
return "🔯🔆❎بیصدا کردن صدا غیر فعال شد🔯🔆❎"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "⭕️🌀💢*Mute Sticker* _Is Already Enabled_💢🌀⭕️"
elseif lang then
 return "⭕️🌀💢بیصدا کردن برچسب فعال است💢🌀⭕️"
end
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "⭕️🌀💢*Mute Sticker* _Has Been Enabled_💢🌀⭕️"
else
 return "⭕️🌀💢بیصدا کردن برچسب فعال شد💢🌀⭕️"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return "⭕️🌀💢*Mute Sticker* _Is Already Disabled_💢🌀⭕️" 
elseif lang then
return "⭕️🌀💢بیصدا کردن برچسب غیر فعال است💢🌀⭕️"
end
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "⭕️🌀💢*Mute Sticker* _Has Been Disabled_💢🌀⭕️"
else
return "⭕️🌀💢بیصدا کردن برچسب غیر فعال شد💢🌀⭕️"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
 return "✅👤*Mute Contact* _Is Already Enabled_👤✅"
elseif lang then
 return "✅👤بیصدا کردن مخاطب فعال است👤✅"
end
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "✅👤*Mute Contact* _Has Been Enabled_👤✅"
else
 return "✅👤بیصدا کردن مخاطب فعال شد👤✅"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return "✅👤*Mute Contact* _Is Already Disabled_👤✅" 
elseif lang then
return "✅👤بیصدا کردن مخاطب غیر فعال است👤✅"
end
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "✅👤*Mute Contact* _Has Been Disabled_👤✅" 
else
return "✅👤بیصدا کردن مخاطب غیر فعال شد👤✅"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
 return "➡️✅*Mute Forward* _Is Already Enabled_➡️✅"
elseif lang then
 return "➡️✅بیصدا کردن نقل قول فعال است➡️✅"
end
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "➡️✅*Mute Forward* _Has Been Enabled_➡️✅"
else
 return "➡️✅بیصدا کردن نقل قول فعال شد➡️✅"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return "➡️🚫*Mute Forward* _Is Already Disabled_➡️🚫"
elseif lang then
return "➡️🚫بیصدا کردن نقل قول غیر فعال است➡️🚫"
end 
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "➡️🚫*Mute Forward* _Has Been Disabled_➡️🚫" 
else
return "➡️🚫بیصدا کردن نقل قول غیر فعال شد➡️🚫"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
if not lang then
 return "*Mute Location* _Is Already Enabled_"
elseif lang then
 return "بیصدا کردن موقعیت فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "*Mute Location* _Has Been Enabled_"
else
 return "بیصدا کردن موقعیت فعال شد"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
if not lang then
return "*Mute Location* _Is Already Disabled_" 
elseif lang then
return "بیصدا کردن موقعیت غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Location* _Has Been Disabled_" 
else
return "بیصدا کردن موقعیت غیر فعال شد"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
if not lang then
 return "🗂✅*Mute Document* _Is Already Enabled_🗂✅"
elseif lang then
 return "🗂✅بیصدا کردن اسناد فعال لست🗂✅"
end
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🗂✅*Mute Document* _Has Been Enabled_🗂✅"
else
 return "🗂✅بیصدا کردن اسناد فعال شد🗂✅"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end 

local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
if not lang then
return "🗂🚫*Mute Document* _Is Already Disabled_🗂🚫" 
elseif lang then
return "🗂🚫بیصدا کردن اسناد غیر فعال است🗂🚫"
end
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🗂🚫*Mute Document* _Has Been Disabled_🗂🚫" 
else
return "🗂🚫بیصدا کردن اسناد غیر فعال شد🗂🚫"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
 return "🌀✳️*Mute TgService* _Is Already Enabled_🌀✳️"
elseif lang then
 return "🌀✳️بیصدا کردن خدمات تلگرام فعال است🌀✳️"
end
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🌀✳️*Mute TgService* _Has Been Enabled_🌀✳️"
else
return "🌀✳️بیصدا کردن خدمات تلگرام فعال شد🌀✳️"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return "🌀✳️*Mute TgService* _Is Already Disabled_🌀✳️"
elseif lang then
return "🌀✳️بیصدا کردن خدمات تلگرام غیر فعال است🌀✳️"
end 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🌀✳️*Mute TgService* _Has Been Disabled_🌀✳️"
else
return "🌀✳️بیصدا کردن خدمات تلگرام غیر فعال شد🌀✳️"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "💥🌈_You're Not_ *Moderator💥🌈*"
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard == "yes" then
if not lang then
 return "🌀✳️*Mute Keyboard* _Is Already Enabled_🌀✳️"
elseif lang then
 return "🌀✳️بیصدا کردن صفحه کلید فعال است🌀✳️"
end
else
 data[tostring(target)]["mutes"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🌀✳️*Mute Keyboard* _Has Been Enabled_🌀✳️"
else
return "🌀✳️بیصدا کردن صفحه کلید فعال شد🌀✳️"
end
end
end

local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "💥🌈_You're Not_ *Moderator💥🌈*"
else
return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end 
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"]
 if mute_keyboard == "no" then
if not lang then
return "🌀✳️*Mute Keyboard* _Is Already Disabled_🌀✳️"
elseif lang then
return "🌀✳️بیصدا کردن صفحه کلید غیرفعال است🌀✳️"
end 
else 
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🌀✳️*Mute Keyboard* _Has Been Disabled_🌀✳️"
else
return "🌀✳️بیصدا کردن صفحه کلید غیرفعال شد🌀✳️"
end 
end
end
----------MuteList---------
local function mutes(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "💥🌈_You're Not_ *Moderator💥🌈*"	
else
 return "🌈💥شما مدیر گروه نمیباشید💥🌈"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_all"] then			
data[tostring(target)]["mutes"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_gif"] then			
data[tostring(target)]["mutes"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_text"] then			
data[tostring(target)]["mutes"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_photo"] then			
data[tostring(target)]["mutes"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_video"] then			
data[tostring(target)]["mutes"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_audio"] then			
data[tostring(target)]["mutes"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_voice"] then			
data[tostring(target)]["mutes"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_sticker"] then			
data[tostring(target)]["mutes"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_contact"] then			
data[tostring(target)]["mutes"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_forward"] then			
data[tostring(target)]["mutes"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_location"] then			
data[tostring(target)]["mutes"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_document"] then			
data[tostring(target)]["mutes"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_tgservice"] then			
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_inline"] then			
data[tostring(target)]["mutes"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_game"] then			
data[tostring(target)]["mutes"]["mute_game"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_keyboard"] then			
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"		
end
end
if not lang then
local mutes = data[tostring(target)]["mutes"] 
 text = " *Group Mute List* : \n_Mute all : _ *"..mutes.mute_all.."*\n_Mute gif :_ *"..mutes.mute_gif.."*\n_Mute text :_ *"..mutes.mute_text.."*\n_Mute inline :_ *"..mutes.mute_inline.."*\n_Mute game :_ *"..mutes.mute_game.."*\n_Mute photo :_ *"..mutes.mute_photo.."*\n_Mute video :_ *"..mutes.mute_video.."*\n_Mute audio :_ *"..mutes.mute_audio.."*\n_Mute voice :_ *"..mutes.mute_voice.."*\n_Mute sticker :_ *"..mutes.mute_sticker.."*\n_Mute contact :_ *"..mutes.mute_contact.."*\n_Mute forward :_ *"..mutes.mute_forward.."*\n_Mute location :_ *"..mutes.mute_location.."*\n_Mute document :_ *"..mutes.mute_document.."*\n_Mute TgService :_ *"..mutes.mute_tgservice.."*\n_Mute Keyboard :_ *"..mutes.mute_keyboard.."*\n*____________________*\n*Bot channel*: @sasan8u\n*Group Language* : *EN*"
else
local mutes = data[tostring(target)]["mutes"] 
 text = " *لیست بیصدا ها* : \n_بیصدا همه : _ *"..mutes.mute_all.."*\n_بیصدا تصاویر متحرک :_ *"..mutes.mute_gif.."*\n_بیصدا متن :_ *"..mutes.mute_text.."*\n_بیصدا کیبورد شیشه ای :_ *"..mutes.mute_inline.."*\n_بیصدا بازی های تحت وب :_ *"..mutes.mute_game.."*\n_بیصدا عکس :_ *"..mutes.mute_photo.."*\n_بیصدا فیلم :_ *"..mutes.mute_video.."*\n_بیصدا آهنگ :_ *"..mutes.mute_audio.."*\n_بیصدا صدا :_ *"..mutes.mute_voice.."*\n_بیصدا برچسب :_ *"..mutes.mute_sticker.."*\n_بیصدا مخاطب :_ *"..mutes.mute_contact.."*\n_بیصدا نقل قول :_ *"..mutes.mute_forward.."*\n_بیصدا موقعیت :_ *"..mutes.mute_location.."*\n_بیصدا اسناد :_ *"..mutes.mute_document.."*\n_بیصدا خدمات تلگرام :_ *"..mutes.mute_tgservice.."*\n_بیصدا صفحه کلید :_ *"..mutes.mute_keyboard.."*\n*____________________*\n*Bot channel*: @sasan8u\n_زبان سوپرگروه_ : *FA*"
end
return text
end

local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local Chash = "cmd_lang:"..msg.to.id
local Clang = redis:get(Chash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local 👤User👤 = msg.from.id
if msg.to.type ~= 'pv' then
if ((matches[1] == "add" and not Clang) or (matches[1] == "افزودن" and Clang)) then
return modadd(msg)
end
if ((matches[1] == "rem" and not Clang) or (matches[1] == "حذف گروه" and Clang)) then
return modrem(msg)
end
if not data[tostring(msg.to.id)] then return end
if (matches[1] == "id" and not Clang) or (matches[1] == "ایدی" and Clang) then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
   if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'Chat ID🆔 : '..msg.to.id..'\n👤User👤 ID🆔 : '..msg.from.id,dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'🔱شناسه گروه : '..msg.to.id..'\n🆔شناسه شما : '..msg.from.id,dl_cb,nil)
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`You Have Not Profile Photo🖼...!`\n\n> *Chat ID🆔 :* `"..msg.to.id.."`\n*👤User👤 ID🆔 :* `"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_🖼شما هیچ عکسی ندارید...!_\n\n> _🔱شناسه گروه :_ `"..msg.to.id.."`\n_🆔شناسه شما :_ `"..msg.from.id.."`", 1, 'md')
            end
        end
   end
   tdcli_function ({
    ID = "Get👤User👤ProfilePhotos",
    👤User👤_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)
end
if msg.reply_id and not matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] and is_mod(msg) then
   tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[2]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[2],cmd="id"})
      end
   end
if ((matches[1] == "pin" and not Clang) or (matches[1] == "سنجاق" and Clang)) and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Message Has Been Pinned*"
elseif lang then
return "✅🔗پیام سجاق شد🔗✅"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Message Has Been Pinned*"
elseif lang then
return "✅🔗پیام سجاق شد🔗✅"
end
end
end
if ((matches[1] == 'unpin' and not Clang) or (matches[1] == "حذف سنجاق" and Clang)) and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pin message has been unpinned*"
elseif lang then
return "🗑🔗پیام سنجاق شده پاک شد🔗🗑"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pin message has been unpinned*"
elseif lang then
return "🗑🔗پیام سنجاق شده پاک شد🔗🗑"
end
end
end
if ((matches[1]:lower() == "whitelist" and not Clang) or (matches[1] == "لیست سفید" and Clang)) and matches[2] == "+" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[3],cmd="setwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[3]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[3],cmd="setwhitelist"})
      end
   end
if ((matches[1]:lower() == "whitelist" and not Clang) or (matches[1] == "لیست سفید" and Clang)) and matches[2] == "-" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[3],cmd="remwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[3]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[3],cmd="remwhitelist"})
      end
   end
if ((matches[1] == "setowner" and not Clang) or (matches[1] == 'مالک' and Clang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[2]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[2],cmd="setowner"})
      end
   end
if ((matches[1] == "remowner" and not Clang) or (matches[1] == "حذف مالک" and Clang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[2]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[2],cmd="remowner"})
      end
   end
if ((matches[1] == "promote" and not Clang) or (matches[1] == "مدیر" and Clang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[2]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[2],cmd="promote"})
      end
   end
if ((matches[1] == "demote" and not Clang) or (matches[1] == "حذف مدیر" and Clang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[2]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[2],cmd="demote"})
      end
   end

if ((matches[1] == "lock" and not Clang) or (matches[1] == "قفل" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "link" and not Clang) or (matches[2] == "لینک" and Clang)) then
return lock_link(msg, data, target)
end
if ((matches[2] == "tag" and not Clang) or (matches[2] == "تگ" and Clang)) then
return lock_tag(msg, data, target)
end
if ((matches[2] == "mention" and not Clang) or (matches[2] == "فراخوانی" and Clang)) then
return lock_mention(msg, data, target)
end
if ((matches[2] == "arabic" and not Clang) or (matches[2] == "عربی" and Clang)) then
return lock_arabic(msg, data, target)
end
if ((matches[2] == "edit" and not Clang) or (matches[2] == "ویرایش" and Clang)) then
return lock_edit(msg, data, target)
end
if ((matches[2] == "spam" and not Clang) or (matches[2] == "هرزنامه" and Clang)) then
return lock_spam(msg, data, target)
end
if ((matches[2] == "flood" and not Clang) or (matches[2] == "پیام مکرر" and Clang)) then
return lock_flood(msg, data, target)
end
if ((matches[2] == "bots" and not Clang) or (matches[2] == "ربات" and Clang)) then
return lock_bots(msg, data, target)
end
if ((matches[2] == "markdown" and not Clang) or (matches[2] == "فونت" and Clang)) then
return lock_markdown(msg, data, target)
end
if ((matches[2] == "webpage" and not Clang) or (matches[2] == "وب" and Clang)) then
return lock_webpage(msg, data, target)
end
if ((matches[2] == "pin" and not Clang) or (matches[2] == "سنجاق" and Clang)) and is_owner(msg) then
return lock_pin(msg, data, target)
end
if ((matches[2] == "join" and not Clang) or (matches[2] == "ورود" and Clang)) then
return lock_join(msg, data, target)
end
end

if ((matches[1] == "unlock" and not Clang) or (matches[1] == "باز کردن" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "link" and not Clang) or (matches[2] == "لینک" and Clang)) then
return unlock_link(msg, data, target)
end
if ((matches[2] == "tag" and not Clang) or (matches[2] == "تگ" and Clang)) then
return unlock_tag(msg, data, target)
end
if ((matches[2] == "mention" and not Clang) or (matches[2] == "فراخوانی" and Clang)) then
return unlock_mention(msg, data, target)
end
if ((matches[2] == "arabic" and not Clang) or (matches[2] == "عربی" and Clang)) then
return unlock_arabic(msg, data, target)
end
if ((matches[2] == "edit" and not Clang) or (matches[2] == "ویرایش" and Clang)) then
return unlock_edit(msg, data, target)
end
if ((matches[2] == "spam" and not Clang) or (matches[2] == "هرزنامه" and Clang)) then
return unlock_spam(msg, data, target)
end
if ((matches[2] == "flood" and not Clang) or (matches[2] == "پیام مکرر" and Clang)) then
return unlock_flood(msg, data, target)
end
if ((matches[2] == "bots" and not Clang) or (matches[2] == "ربات" and Clang)) then
return unlock_bots(msg, data, target)
end
if ((matches[2] == "markdown" and not Clang) or (matches[2] == "فونت" and Clang)) then
return unlock_markdown(msg, data, target)
end
if ((matches[2] == "webpage" and not Clang) or (matches[2] == "وب" and Clang)) then
return unlock_webpage(msg, data, target)
end
if ((matches[2] == "pin" and not Clang) or (matches[2] == "سنجاق" and Clang)) and is_owner(msg) then
return unlock_pin(msg, data, target)
end
if ((matches[2] == "join" and not Clang) or (matches[2] == "ورود" and Clang)) then
return unlock_join(msg, data, target)
end
end
if ((matches[1] == "mute" and not Clang) or (matches[1] == "بیصدا" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "all" and not Clang) or (matches[2] == "همه" and Clang)) then
return mute_all(msg, data, target)
end
if ((matches[2] == "gif" and not Clang) or (matches[2] == "تصاویر متحرک" and Clang)) then
return mute_gif(msg, data, target)
end
if ((matches[2] == "text" and not Clang) or (matches[2] == "متن" and Clang)) then
return mute_text(msg ,data, target)
end
if ((matches[2] == "photo" and not Clang) or (matches[2] == "عکس" and Clang)) then
return mute_photo(msg ,data, target)
end
if ((matches[2] == "video" and not Clang) or (matches[2] == "فیلم" and Clang)) then
return mute_video(msg ,data, target)
end
if ((matches[2] == "audio" and not Clang) or (matches[2] == "اهنگ" and Clang)) then
return mute_audio(msg ,data, target)
end
if ((matches[2] == "voice" and not Clang) or (matches[2] == "صدا" and Clang)) then
return mute_voice(msg ,data, target)
end
if ((matches[2] == "sticker" and not Clang) or (matches[2] == "برچسب" and Clang)) then
return mute_sticker(msg ,data, target)
end
if ((matches[2] == "contact" and not Clang) or (matches[2] == "مخاطب" and Clang)) then
return mute_contact(msg ,data, target)
end
if ((matches[2] == "forward" and not Clang) or (matches[2] == "نقل قول" and Clang)) then
return mute_forward(msg ,data, target)
end
if ((matches[2] == "location" and not Clang) or (matches[2] == "موقعیت" and Clang)) then
return mute_location(msg ,data, target)
end
if ((matches[2] == "document" and not Clang) or (matches[2] == "اسناد" and Clang)) then
return mute_document(msg ,data, target)
end
if ((matches[2] == "tgservice" and not Clang) or (matches[2] == "خدمات تلگرام" and Clang)) then
return mute_tgservice(msg ,data, target)
end
if ((matches[2] == "inline" and not Clang) or (matches[2] == "کیبورد شیشه ای" and Clang)) then
return mute_inline(msg ,data, target)
end
if ((matches[2] == "game" and not Clang) or (matches[2] == "بازی" and Clang)) then
return mute_game(msg ,data, target)
end
if ((matches[2] == "keyboard" and not Clang) or (matches[2] == "صفحه کلید" and Clang)) then
return mute_keyboard(msg ,data, target)
end
end

if ((matches[1] == "unmute" and not Clang) or (matches[1] == "باصدا" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "all" and not Clang) or (matches[2] == "همه" and Clang)) then
return unmute_all(msg, data, target)
end
if ((matches[2] == "gif" and not Clang) or (matches[2] == "تصاویر متحرک" and Clang)) then
return unmute_gif(msg, data, target)
end
if ((matches[2] == "text" and not Clang) or (matches[2] == "متن" and Clang)) then
return unmute_text(msg, data, target)
end
if ((matches[2] == "photo" and not Clang) or (matches[2] == "عکس" and Clang)) then
return unmute_photo(msg ,data, target)
end
if ((matches[2] == "video" and not Clang) or (matches[2] == "فیلم" and Clang)) then
return unmute_video(msg ,data, target)
end
if ((matches[2] == "audio" and not Clang) or (matches[2] == "اهنگ" and Clang)) then
return unmute_audio(msg ,data, target)
end
if ((matches[2] == "voice" and not Clang) or (matches[2] == "صدا" and Clang)) then
return unmute_voice(msg ,data, target)
end
if ((matches[2] == "sticker" and not Clang) or (matches[2] == "برچسب" and Clang)) then
return unmute_sticker(msg ,data, target)
end
if ((matches[2] == "contact" and not Clang) or (matches[2] == "مخاطب" and Clang)) then
return unmute_contact(msg ,data, target)
end
if ((matches[2] == "forward" and not Clang) or (matches[2] == "نقل قول" and Clang)) then
return unmute_forward(msg ,data, target)
end
if ((matches[2] == "location" and not Clang) or (matches[2] == "موقعیت" and Clang)) then
return unmute_location(msg ,data, target)
end
if ((matches[2] == "document" and not Clang) or (matches[2] == "اسناد" and Clang)) then
return unmute_document(msg ,data, target)
end
if ((matches[2] == "tgservice" and not Clang) or (matches[2] == "خدمات تلگرام" and Clang)) then
return unmute_tgservice(msg ,data, target)
end
if ((matches[2] == "inline" and not Clang) or (matches[2] == "کیبورد شیشه ای" and Clang)) then
return unmute_inline(msg ,data, target)
end
if ((matches[2] == "game" and not Clang) or (matches[2] == "بازی" and Clang)) then
return unmute_game(msg ,data, target)
end
if ((matches[2] == "keyboard" and not Clang) or (matches[2] == "صفحه کلید" and Clang)) then
return unmute_keyboard(msg ,data, target)
end
end
if ((matches[1] == "gpinfo" and not Clang) or (matches[1] == "اطلاعات گروه" and Clang)) and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*Group Info :*\n_Admin Count :_ *"..data.administrator_count_.."*\n_Member Count :_ *"..data.member_count_.."*\n_Kicked Count :_ *"..data.kicked_count_.."*\n_Group ID :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
elseif lang then
ginfo = "*اطلاعات گروه :*\n_تعداد مدیران :_ *"..data.administrator_count_.."*\n_تعداد اعضا :_ *"..data.member_count_.."*\n_تعداد اعضای حذف شده :_ *"..data.kicked_count_.."*\n_🔱شناسه گروه :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if ((matches[1] == 'newlink' and not Clang) or (matches[1] == "لینک جدید" and Clang)) and is_mod(msg) then
			local function callback_link (arg, data)
   local hash = "gp_lang:"..msg.to.id
   local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bot is not group creator_\n_set a link for group with using_ /setlink"..msg_caption, 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ربات سازنده گروه نیست_\n_با دستور_ setlink/ _لینک جدیدی برای گروه ثبت کنید_"..msg_caption, 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Newlink Created*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_لینک جدید ساخته شد_", 1, 'md')
            end
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if ((matches[1] == 'setlink' and not Clang) or (matches[1] == "تنظیم لینک" and Clang)) and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
			return '📌⚙️_Please send the new group_ *link* _now_📌⚙️'
    else 
         return '📌⚙️لطفا لینک گروه خود را ارسال کنید📌⚙️'
       end
		end

		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "لینک جدید ذخیره شد"
		 	end
       end
		end
    if ((matches[1] == 'link' and not Clang) or (matches[1] == "لینک" and Clang)) and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First create a link for group with using_ /newlink\n_If bot not group creator set a link with using_ /setlink"
     else
        return "ابتدا با دستور newlink/ لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
       text = "<b>Group Link :</b>\n"..linkgp..msg_caption
     else
      text = "<b>لینک گروه :</b>\n"..linkgp..msg_caption
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
    if ((matches[1] == 'linkpv' and not Clang) or (matches[1] == "لینک خصوصی" and Clang)) and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First create a link for group with using_ /newlink\n_If bot not group creator set a link with using_ /setlink"
     else
        return "ابتدا با دستور newlink/ لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
     tdcli.sendMessage(👤User👤, "", 1, "<b>Group Link "..msg.to.title.." :</b>\n"..linkgp..msg_caption, 1, 'html')
     else
      tdcli.sendMessage(👤User👤, "", 1, "<b>لینک گروه "..msg.to.title.." :</b>\n"..linkgp..msg_caption, 1, 'html')
         end
      if not lang then
        return "*Group Link Was Send In Your Private Message*"
       else
        return "_لینک گروه به چت خصوصی شما ارسال شد_"
        end
     end
  if ((matches[1] == "setrules" and not Clang) or (matches[1] == "تنظیم قوانین" and Clang)) and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*⚜️Group rules⚜️* _has been set_"
   else 
  return "قوانین گروه ثبت شد"
   end
  end
  if ((matches[1] == "rules" and not Clang) or (matches[1] == "قوانین" and Clang)) then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban."..msg_caption
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود."..msg_caption
 end
        else
     rules = "*⚜️Group rules⚜️ :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if ((matches[1] == "res" and not Clang) or (matches[1] == "👤کاربر👤ی" and Clang)) and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      👤User👤name_ = matches[2]
    }, action_by_👤User👤name, {chat_id=msg.to.id,👤User👤name=matches[2],cmd="res"})
  end
if ((matches[1] == "whois" and not Clang) or (matches[1] == "شناسه" and Clang)) and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "Get👤User👤",
    👤User👤_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,👤User👤_id=matches[2],cmd="whois"})
  end
		if ((matches[1]:lower() == 'setchar' and not Clang) or (matches[1] == "حداکثر حروف مجاز" and Clang)) then
			if not is_mod(msg) then
				return
			end
			local chars_max = matches[2]
			data[tostring(msg.to.id)]['settings']['set_char'] = chars_max
			save_data(_config.moderation.data, data)
    if not lang then
     return "*Character sensitivity* _has been set to :_ *[ "..matches[2].." ]*"
   else
     return "_حداکثر حروف مجاز در پیام تنظیم شد به :_ *[ "..matches[2].." ]*"
		end
  end
  if ((matches[1]:lower() == 'setflood' and not Clang) or (matches[1] == "تنظیم پیام مکرر" and Clang)) and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "_Wrong number, range is_ *[2-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _sensitivity has been set to :_ *[ "..matches[2].." ]*"
    else
    return '_محدودیت پیام مکرر به_ *'..tonumber(matches[2])..'* _تنظیم شد._'
    end
       end
  if ((matches[1]:lower() == 'setfloodtime' and not Clang) or (matches[1] == "تنظیم زمان بررسی" and Clang)) and is_mod(msg) then
			if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
				return "_Wrong number, range is_ *[2-10]*"
      end
			local time_max = matches[2]
			data[tostring(chat)]['settings']['time_check'] = time_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _check time has been set to :_ *[ "..matches[2].." ]*"
    else
    return "_حداکثر زمان بررسی پیام های مکرر تنظیم شد به :_ *[ "..matches[2].." ]*"
    end
       end
		if ((matches[1]:lower() == 'clean' and not Clang) or (matches[1] == "پاک کردن" and Clang)) and is_owner(msg) then
			if ((matches[2] == 'mods' and not Clang) or (matches[2] == "مدیران" and Clang)) then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
					return "👤🚫_No_ *moderators* _in this group_🚫👤"
             else
                return "🚫👤هیچ مدیری برای گروه انتخاب نشده است👤🚫"
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "♻️_All_ *moderators* _has been demoted_♻️"
          else
            return "♻️تمام مدیران گروه تنزیل مقام شدند♻️"
			end
         end
			if ((matches[2] == 'filterlist' and not Clang) or (matches[2] == "لیست فیلتر" and Clang)) then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
					return "🗑*Filtered words list* _is empty_🗑"
         else
					return "🗑_لیست کلمات فیلتر شده خالی است_🗑"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
				return "🗑*Filtered words list* _has been cleaned_🗑"
           else
				return "🗑_لیست کلمات فیلتر شده پاک شد_🗑"
           end
			end
			if ((matches[2] == 'rules' and not Clang) or (matches[2] == "قوانین" and Clang)) then
				if not data[tostring(chat)]['rules'] then
            if not lang then
					return "🚫_No_ *rules* _available_🚫"
             else
               return "🚫قوانین برای گروه ثبت نشده است🚫"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "🗑*⚜️Group rules⚜️* _has been cleaned_🗑"
          else
            return "🗑قوانین گروه پاک شد🗑"
			end
       end
			if ((matches[2] == 'welcome' and not Clang) or (matches[2] == "خوشامد" and Clang)) then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
					return "🚫*Welcome Message not set*🚫"
             else
               return "🚫پیام خوشآمد گویی ثبت نشده است🚫"
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "🗑*Welcome message* _has been cleaned_🗑"
          else
            return "🗑پیام خوشآمد گویی پاک شد🗑"
			end
       end
			if ((matches[2] == 'about' and not Clang) or (matches[2] == "درباره" and Clang)) then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
					return "_No_ *description* _available_"
            else
              return "پیامی مبنی بر درباره گروه ثبت نشده است"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
				return "*Group description* _has been cleaned_"
           else
              return "پیام مبنی بر درباره گروه پاک شد"
             end
		   	end
        end
		if ((matches[1]:lower() == 'clean' and not Clang) or (matches[1] == "پاک کردن" and Clang)) and is_admin(msg) then
			if ((matches[2] == 'owners' and not Clang) or (matches[2] == "مالکان" and Clang)) then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
					return "_No_ *owners* _in this group_"
            else
                return "مالکی برای گروه انتخاب نشده است"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *owners* _has been demoted_"
           else
            return "تمامی مالکان گروه تنزیل مقام شدند"
          end
			end
     end
if ((matches[1] == "setname" and not Clang) or (matches[1] == "تنظیم نام" and Clang)) and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if ((matches[1] == "setabout" and not Clang) or (matches[1] == "تنظیم درباره" and Clang)) and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Group description* _has been set_"
    else
     return "پیام مبنی بر درباره گروه ثبت شد"
      end
  end
  if ((matches[1] == "about" and not Clang) or (matches[1] == "درباره" and Clang)) and msg.to.type == "chat" and is_owner(msg) then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_No_ *description* _available_"
      elseif lang then
      about = "پیامی مبنی بر درباره گروه ثبت نشده است"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if ((matches[1] == 'filter' and not Clang) or (matches[1] == "فیلتر" and Clang)) and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if ((matches[1] == 'unfilter' and not Clang) or (matches[1] == "حذف فیلتر" and Clang)) and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if ((matches[1] == 'filterlist' and not Clang) or (matches[1] == "لیست فیلتر" and Clang)) and is_mod(msg) then
    return filter_list(msg)
  end
if ((matches[1] == "settings" and not Clang) or (matches[1] == "تنظیمات" and Clang)) and is_mod(msg) then
return group_settings(msg, target)
end
if ((matches[1] == "mutelist" and not Clang) or (matches[1] == "لیست بیصدا" and Clang)) and is_mod(msg) then
return mutes(msg, target)
end
if ((matches[1] == "modlist" and not Clang) or (matches[1] == "لیست مدیران" and Clang)) and is_mod(msg) then
return modlist(msg)
end
if ((matches[1] == "ownerlist" and not Clang) or (matches[1] == "لیست مالکان" and Clang)) and is_owner(msg) then
return ownerlist(msg)
end
if ((matches[1] == "whitelist" and not Clang) or (matches[1] == "لیست سفید" and Clang)) and not matches[2] and is_mod(msg) then
return whitelist(msg.to.id)
end

if ((matches[1]:lower() == "option" and not Clang) or (matches[1] == "تنظیمات کلی" and Clang)) and is_mod(msg) then
local function found_helper(TM, Beyond)
local function inline_query_cb(TM, BD)
      if BD.results_ and BD.results_[0] then
		tdcli.sendInlineQueryResultMessage(msg.to.id, 0, 0, 1, BD.inline_query_id_, BD.results_[0].id_, dl_cb, nil)
    else
    if not lang then
    text = "*Helper is offline*\n\n"
        elseif lang then
    text = "🚫_ربات هلپر خاموش است_\n\n"
    end
  return tdcli.sendMessage(msg.to.id, msg.id, 0, text, 0, "md")
   end
end
tdcli.getInlineQueryResults(Beyond.id_, msg.to.id, 0, 0, msg.to.id, 0, inline_query_cb, nil)
end
tdcli.searchPublicChat(tostring(helper_👤User👤name), found_helper, nil)
end

if (matches[1]:lower() == "setlang" and not Clang) and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
if matches[2] == "fa" then
redis:set(hash, true)
return "🌀🔆🇮🇷*زبان گروه تنظیم شد به : فارسی*🇮🇷🌀🔆"..msg_caption
  elseif matches[2] == "en" then
 redis:del(hash)
return "🌀🔆🇱🇷_Group Language Set To:_ EN🇱🇷🌀🔆"..msg_caption
end
end
if (matches[1] == 'زبان' and Clang) and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
if matches[2] == "فارسی" then
redis:set(hash, true)
return "🌀🔆🇮🇷*زبان گروه تنظیم شد به : فارسی*🇮🇷🌀🔆"..msg_caption
  elseif matches[2] == "انگلیسی" then
 redis:del(hash)
return "🌀🔆🇱🇷_Group Language Set To:_ EN🇱🇷🌀🔆"..msg_caption
end
end

if (matches[1]:lower() == "setcmd" and not Clang) and is_owner(msg) then
local hash = "cmd_lang:"..msg.to.id
if matches[2] == "fa" then
redis:set(hash, true)
   if lang then
return "🌀🔆*زبان دستورات ربات تنظیم شد به : فارسی*🌀🔆"..msg_caption
else
return "_Bot Commands Language Set To:_ Fa"..msg_caption
end
end
end

if (matches[1]:lower() == "دستورات انگلیسی" and Clang) and is_owner(msg) then
local hash = "cmd_lang:"..msg.to.id
redis:del(hash)
   if lang then
return "*🇱🇷🌀🔆زبان دستورات ربات تنظیم شد به : انگلیسی🌀🔆🇱🇷*"..msg_caption
else
return "🇱🇷🌀🔆_Bot Commands Language Set To:_ EN🌀🔆🇱🇷"..msg_caption
end
end

if (matches[1] == "help" and not Clang) and is_mod(msg) then
if not lang then
text = [[
*⚙️sasan bot setting⚙️:*

🔥🌟👉🏻setowner🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Set Group Owner(Multi Owner) ⭕️💎
									  
									
🔥🌟👉🏻remowner🔥 `[👤User👤name|id|reply]` 
  ⭕️💎Remove 👤User👤 From Owner List ⭕️💎

 
🔥🌟👉🏻promote🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Promote 👤User👤 To Group Admin ⭕️💎


🔥🌟👉🏻demote🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Demote 👤User👤 From Group Admins List ⭕️💎


🔥🌟👉🏻setflood🔥 `[1-50]`
 ⭕️💎Set Flooding Number ⭕️💎


🔥🌟👉🏻setchar🔥 `[Number]`
 ⭕️💎Set Flooding Characters ⭕️💎


🔥🌟👉🏻setfloodtime🔥 `[1-10]`
 ⭕️💎Set Flooding Time ⭕️💎


🔥🌟👉🏻silent🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Silent 👤User👤 From Group ⭕️💎


🔥🌟👉🏻unsilent🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Unsilent 👤User👤 From Group ⭕️💎


🔥🌟👉🏻kick🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Kick 👤User👤 From Group ⭕️💎


🔥🌟👉🏻ban🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Ban 👤User👤 From Group ⭕️💎


🔥🌟👉🏻unban🔥 `[👤User👤name|id|reply]` 
 ⭕️💎UnBan 👤User👤 From Group ⭕️💎


🔥🌟👉🏻whitelist🔥 [+-] `[👤User👤name|id|reply]` 
 ⭕️💎Add Or Remove 👤User👤 From White List ⭕️💎


🔥🌟👉🏻res🔥 `[👤User👤name]`
 ⭕️💎Show 👤User👤 ID🆔 ⭕️💎


🔥🌟👉🏻id🔥 `[reply]`
 ⭕️💎Show 👤User👤 ID🆔 ⭕️💎


🔥🌟👉🏻whois🔥 `[id]`
 ⭕️💎Show 👤User👤's 👤User👤name And Name ⭕️💎


🔥🌟👉🏻lock🔥 `[link | join | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention | pin | cmds]`
 ⭕️💎If This Actions Lock, Bot Check Actions And Delete Them ⭕️💎


🔥🌟👉🏻unlock🔥 `[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention | pin]`
 ⭕️💎If This Actions Unlock, Bot Not Delete Them ⭕️💎


🔥🌟👉🏻mute🔥 `[gif | photo | document | sticker | keyboard | video | text | forward | location | audio | voice | contact | all]`
 ⭕️💎If This Actions Lock, Bot Check Actions And Delete Them ⭕️💎


🔥🌟👉🏻unmute🔥 `[gif | photo | document | sticker | keyboard | video | text | forward | location | audio | voice | contact | all]`
 ⭕️💎If This Actions Unlock, Bot Not Delete Them ⭕️💎


🔥🌟👉🏻set🔥`[rules | name | photo | link | about | welcome]`
 ⭕️💎Bot Set Them ⭕️💎


🔥🌟👉🏻clean🔥 `[bans | mods | bots | rules | about | silentlist | filtelist | welcome]`   
 ⭕️💎Bot Clean Them ⭕️💎


🔥🌟👉🏻filter🔥 `[word]`
 ⭕️💎Word filter ⭕️💎


🔥🌟👉🏻unfilter🔥 `[word]`
 ⭕️💎Word unfilter ⭕️💎


🔥🌟👉🏻pin🔥 `[reply]`
 ⭕️💎Pin Your Message ⭕️💎


🔥🌟👉🏻unpin🔥 
 ⭕️💎Unpin Pinned Message ⭕️💎


🔥🌟👉🏻welcome enable/disable🔥
 ⭕️💎Enable Or Disable Group Welcome ⭕️💎


🔥🌟👉🏻settings🔥
 ⭕️💎Show Group Settings ⭕️💎


🔥🌟👉🏻mutelist🔥
 ⭕️💎Show Mutes List ⭕️💎


🔥🌟👉🏻silentlist🔥
 ⭕️💎Show Silented 👤User👤s List ⭕️💎


🔥🌟👉🏻filterlist🔥
 ⭕️💎Show Filtered Words List ⭕️💎


🔥🌟👉🏻banlist🔥
 ⭕️💎Show Banned 👤User👤s List ⭕️💎


🔥🌟👉🏻ownerlist🔥
 ⭕️💎Show Group Owners List ⭕️💎 


🔥🌟👉🏻modlist🔥 
 ⭕️💎Show Group Moderators List ⭕️💎


🔥🌟👉🏻whitelist🔥 
 ⭕️💎Show Group White List 👤User👤s ⭕️💎


🔥🌟👉🏻rules🔥
 ⭕️💎Show ⚜️Group rules⚜️ ⭕️💎


🔥🌟👉🏻about🔥
 ⭕️💎Show Group Description ⭕️💎


🔥🌟👉🏻id🔥
 ⭕️💎Show Your And Chat ID🆔 ⭕️💎


🔥🌟👉🏻gpinfo🔥
 ⭕️💎Show Group Information ⭕️💎


🔥🌟👉🏻newlink🔥
 ⭕️💎Create A New Link ⭕️💎


🔥🌟👉🏻link🔥
 ⭕️💎Show Group Link ⭕️💎


🔥🌟👉🏻linkpv🔥
 ⭕️💎Send Group Link In Your Private Message ⭕️💎


🔥🌟👉🏻setwelcome [text]🔥
 ⭕️💎set Welcome Message ⭕️💎


🔥🌟👉🏻setlang [fa | en]🔥
 ⭕️💎Set Persian/English Language ⭕️💎


🔥🌟👉🏻setcmd [fa | en]🔥
 ⭕️💎Set CMD Persian/English Language ⭕️💎


🔥🌟👉🏻helptools🔥
 ⭕️💎Show Tools Help ⭕️💎


🔥🌟👉🏻helpfun🔥
 ⭕️💎Show Fun Help ⭕️💎

 🔥°°Version of bot 7.1.1°°❄️
🔥°°🇮🇷Creat by @sasan8u°°❄️

*🌼you can use orders🌼*]]

elseif lang then

text = [[
_🔥🍀دستورات ربات ساسان🍀:🔥_

🔥🌟👉🏻setowner🔥 `[👤User👤name|id|reply]`
 ⭕️💎انتخاب مالک گروه(قابل انتخاب چند مالک) ⭕️💎


🔥🌟👉🏻remowner🔥 `[👤User👤name|id|reply]`
 ⭕️💎حذف کردن فرد از فهرست مالکان گروه ⭕️💎


🔥🌟👉🏻promote🔥 `[👤User👤name|id|reply]`
 ⭕️💎ارتقا مقام 👤کاربر👤 به مدیر گروه ⭕️💎


🔥🌟👉🏻demote🔥 `[👤User👤name|id|reply]`
 ⭕️💎تنزیل مقام مدیر به 👤کاربر👤 ⭕️💎


🔥🌟👉🏻setflood🔥 `[1-50]`
 ⭕️💎تنظیم حداکثر تعداد پیام مکرر ⭕️💎


🔥🌟👉🏻setchar🔥 `[Number]`
 ⭕️💎تنظیم حداکثر کاراکتر پیام مکرر ⭕️💎


🔥🌟👉🏻setfloodtime🔥 `[1-10]`
 ⭕️💎تنظیم زمان ارسال پیام مکرر ⭕️💎


🔥🌟👉🏻silent🔥 `[👤User👤name|id|reply]`
 ⭕️💎بیصدا کردن 👤کاربر👤 در گروه ⭕️💎


🔥🌟👉🏻unsilent🔥 `[👤User👤name|id|reply]`
 ⭕️💎در آوردن 👤کاربر👤 از حالت بیصدا در گروه ⭕️💎


🔥🌟👉🏻kick🔥 `[👤User👤name|id|reply]`
 ⭕️💎حذف 👤کاربر👤 از گروه ⭕️💎


🔥🌟👉🏻ban🔥 `[👤User👤name|id|reply]`
 ⭕️💎مسدود کردن 👤کاربر👤 از گروه ⭕️💎


🔥🌟👉🏻unban🔥 `[👤User👤name|id|reply]`
 ⭕️💎در آوردن از حالت مسدودیت 👤کاربر👤 از گروه ⭕️💎


🔥🌟👉🏻whitelist🔥 `[+|-]` `[یوزرنیم|ایدی|ریپلی]` 
 ⭕️💎افزودن افراد به لیست سفید ⭕️💎


🔥🌟👉🏻res🔥 `[👤User👤name]`
 ⭕️💎نمایش شناسه 👤کاربر👤 ⭕️💎


🔥🌟👉🏻id🔥 `[reply]`
نمایش شناسه 👤کاربر👤


🔥🌟👉🏻whois🔥 `[id]`
 ⭕️💎نمایش نام 👤کاربر👤, نام 👤کاربر👤ی و اطلاعات حساب ⭕️💎


🔥🌟👉🏻lock🔥 `[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention | pin]`
 ⭕️💎در صورت قفل بودن فعالیت ها, ربات آنهارا حذف خواهد کرد ⭕️💎


🔥🌟👉🏻unlock🔥 `[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention | pin]`
 ⭕️💎در صورت قفل نبودن فعالیت ها, ربات آنهارا حذف نخواهد کرد ⭕️💎


🔥🌟👉🏻mute🔥 `[gif | photo | document | sticker | keyboard | video | text | forward | location | audio | voice | contact | all]`
 ⭕️💎در صورت بیصدد بودن فعالیت ها, ربات آنهارا حذف خواهد کرد ⭕️💎


🔥🌟👉🏻unmute🔥 `[gif | photo | document | sticker | keyboard | video | text | forward | location | audio | voice | contact | all]`
 ⭕️💎در صورت بیصدا نبودن فعالیت ها, ربات آنهارا حذف نخواهد کرد ⭕️💎


🔥🌟👉🏻set🔥`[rules | name | photo | link | about | welcome]`
 ⭕️💎ربات آنهارا ثبت خواهد کرد ⭕️💎


🔥🌟👉🏻clean🔥 `[bans | mods | rules | about | silentlist | filterlist | welcome]`
 ⭕️💎ربات آنهارا پاک خواهد کرد ⭕️💎


🔥🌟👉🏻filter🔥 `[word]`
 ⭕️💎فیلتر‌کلمه مورد نظر ⭕️💎


🔥🌟👉🏻unfilter🔥 `[word]`
 ⭕️💎ازاد کردن کلمه مورد نظر ⭕️💎


🔥🌟👉🏻pin🔥 `[reply]`
 ⭕️💎ربات پیام شمارا در گروه سنجاق خواهد کرد ⭕️💎


🔥🌟👉🏻unpin 🔥
ربات پیام سنجاق شده در گروه را حذف خواهد کرد


🔥🌟👉🏻welcome🔥 `enable/disable`
 ⭕️💎فعال یا غیرفعال کردن خوشامد گویی ⭕️💎


🔥🌟👉🏻settings🔥
 ⭕️💎نمایش تنظیمات گروه ⭕️💎


🔥🌟👉🏻mutelist🔥
 ⭕️💎نمایش فهرست بیصدا های گروه ⭕️💎


🔥🌟👉🏻silentlist🔥
 ⭕️💎نمایش فهرست افراد بیصدا ⭕️💎


🔥🌟👉🏻filterlist🔥
 ⭕️💎نمایش لیست کلمات فیلتر شده ⭕️💎


🔥🌟👉🏻banlist🔥
 ⭕️💎نمایش افراد مسدود شده از گروه ⭕️💎


🔥🌟👉🏻ownerlist🔥
 ⭕️💎نمایش فهرست مالکان گروه ⭕️💎


🔥🌟👉🏻modlist🔥
 ⭕️💎نمایش فهرست مدیران گروه ⭕️💎


🔥🌟👉🏻whitelist🔥
 ⭕️💎نمایش افراد سفید شده از گروه ⭕️💎


🔥🌟👉🏻rules🔥
 ⭕️💎نمایش قوانین گروه ⭕️💎


🔥🌟👉🏻about🔥
 ⭕️💎نمایش درباره گروه ⭕️💎


🔥🌟👉🏻id🔥
 ⭕️💎نمایش 🆔شناسه شما و گروه ⭕️💎


🔥🌟👉🏻gpinfo🔥
 ⭕️💎نمایش اطلاعات گروه ⭕️💎


🔥🌟👉🏻newlink🔥
 ⭕️💎ساخت لینک جدید ⭕️💎


🔥🌟👉🏻setlink🔥
 ⭕️💎تنظیم لینک جدید ⭕️💎


🔥🌟👉🏻link🔥
 ⭕️💎نمایش لینک گروه ⭕️💎


🔥🌟👉🏻linkpv🔥
 ⭕️💎ارسال لینک گروه به چت خصوصی شما ⭕️💎


🔥🌟👉🏻setwelcome🔥 `[text]`
 ⭕️💎ثبت پیام خوش آمد گویی ⭕️💎


🔥🌟👉🏻setlang🔥 `[fa | en]`
 ⭕️💎تنظیم زبان ربات به فارسی یا انگلیسی ⭕️💎


🔥🌟👉🏻setcmd🔥 `[fa | en]`
 ⭕️💎تنظیم زبان دستورات ربات به فارسی یا انگلیسی ⭕️💎


🔥🌟👉🏻helptools🔥
 ⭕️💎نمایش راهنمای ابزار ⭕️💎


🔥🌟👉🏻helpfun🔥
 ⭕️💎نمایش راهنمای سرگرمی ⭕️💎

 🔥°° ورژن ربات 7.1.1°°❄️
🔥°°🇮🇷ساخت توسط  @sasan8u °°❄️
_🌼شما میتوانید از دستورات استقاده کنید🌼_ *;)*
]]
end
return text..msg_caption
end

if (matches[1] == "راهنما" and Clang) and is_mod(msg) then
if not lang then
text = [[
*⚙️sasan bot setting⚙️:*

🔥مالک🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Set Group Owner(Multi Owner) ⭕️💎

🔥حذف مالک🔥 `[👤User👤name|id|reply]` 
  ⭕️💎Remove 👤User👤 From Owner List ⭕️💎

🔥مدیر🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Promote 👤User👤 To Group Admin ⭕️💎

🔥حذف مدیر🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Demote 👤User👤 From Group Admins List ⭕️💎

🔥تنظیم پیام مکرر🔥 `[1-50]`
 ⭕️💎Set Flooding Number ⭕️💎

🔥حداکثر حروف مجاز🔥 `[عدد]`
 ⭕️💎Set Flooding Characters ⭕️💎

🔥تنظیم زمان بررسی🔥 `[1-10]`
 ⭕️💎Set Flooding Time ⭕️💎

🔥سکوت🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Silent 👤User👤 From Group ⭕️💎

🔥حذف سکوت🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Unsilent 👤User👤 From Group ⭕️💎

🔥اخراج🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Kick 👤User👤 From Group ⭕️💎

🔥بن🔥 `[👤User👤name|id|reply]` 
 ⭕️💎Ban 👤User👤 From Group ⭕️💎

🔥حذف بن🔥 `[👤User👤name|id|reply]` 
 ⭕️💎UnBan 👤User👤 From Group ⭕️💎

🔥لیست سفید🔥 [+-] `[👤User👤name|id|reply]` 
 ⭕️💎Add Or Remove 👤User👤 From White List ⭕️💎

🔥👤کاربر👤ی🔥 `[👤User👤name]`
 ⭕️💎Show 👤User👤 ID🆔 ⭕️💎

🔥ایدی🔥 `[reply]`
 ⭕️💎Show 👤User👤 ID🆔 ⭕️💎

🔥شناسه🔥 `[id]`
 ⭕️💎Show 👤User👤's 👤User👤name And Name ⭕️💎

🔥قفل🔥 `[لینک | ورود | تگ | ویرایش | عربی | وب | ربات |هرزنامه | پیام مکرر | فونت | فراخوانی | سنجاق]`
 ⭕️💎If This Actions Lock, Bot Check Actions And Delete Them ⭕️💎

🔥باز کردن🔥 `[لینک | ورود | تگ | ویرایش | عربی | وب | ربات |هرزنامه | پیام مکرر | فونت | فراخوانی | سنجاق]`
 ⭕️💎If This Actions Unlock, Bot Not Delete Them ⭕️💎

🔥بیصدا🔥 `[همه | تصاویر متحرک | عکس | اسناد | برچسب | صفحه کلید | فیلم | متن | نقل قول | موقعیت | اهنگ | صدا | مخاطب | کیبورد شیشه ای|بازی|خدمات تلگرام]`
 ⭕️💎If This Actions Lock, Bot Check Actions And Delete Them ⭕️💎

🔥باصدا🔥 `[همه | تصاویر متحرک | عکس | اسناد | برچسب | صفحه کلید | فیلم | متن | نقل قول | موقعیت | اهنگ | صدا | مخاطب | کیبورد شیشه ای|بازی|خدمات تلگرام]`
 ⭕️💎If This Actions Unlock, Bot Not Delete Them ⭕️💎

🔥تنظیم🔥`[قوانین | نام | لینک | درباره | خوشامد]`
 ⭕️💎Bot Set Them ⭕️💎

🔥پاک کردن🔥 `[بن | مدیران | ربات | قوانین | درباره | لیست سکوت | خوشامد]`   
 ⭕️💎Bot Clean Them ⭕️💎

🔥فیلتر🔥 `[word]`
 ⭕️💎Word filter ⭕️💎

🔥حذف فیلتر🔥 `[word]`
 ⭕️💎Word unfilter ⭕️💎

🔥سنجاق🔥 `[reply]`
 ⭕️💎Pin Your Message ⭕️💎

🔥حذف سنجاق🔥 
 ⭕️💎Unpin Pinned Message ⭕️💎

🔥خوشامد فعال/غیرفعال🔥
 ⭕️💎Enable Or Disable Group Welcome ⭕️💎

🔥تنظیمات🔥
 ⭕️💎Show Group Settings ⭕️💎

🔥لیست بیصدا🔥
 ⭕️💎Show Mutes List ⭕️💎

🔥لیست سکوت🔥
 ⭕️💎Show Silented 👤User👤s List ⭕️💎

🔥لیست فیلتر🔥
 ⭕️💎Show Filtered Words List ⭕️💎

🔥لیست بن🔥
 ⭕️💎Show Banned 👤User👤s List ⭕️💎

🔥لیست مالکان🔥
 ⭕️💎Show Group Owners List ⭕️💎 

🔥لیست مدیران🔥 
 ⭕️💎Show Group Moderators List ⭕️💎

🔥لیست سفید🔥 
 ⭕️💎Show Group White List 👤User👤s ⭕️💎

🔥قوانین🔥
 ⭕️💎Show ⚜️Group rules⚜️ ⭕️💎

🔥درباره🔥
 ⭕️💎Show Group Description ⭕️💎

🔥ایدی🔥
 ⭕️💎Show Your And Chat ID🆔 ⭕️💎

🔥اطلاعات گروه🔥
 ⭕️💎Show Group Information ⭕️💎

🔥لینک جدید🔥
 ⭕️💎Create A New Link ⭕️💎

🔥تنظیم لینک🔥
 ⭕️💎Set A New Link ⭕️💎

🔥لینک🔥
 ⭕️💎Show Group Link ⭕️💎

🔥لینک خصوصی🔥
 ⭕️💎Send Group Link In Your Private Message ⭕️💎

🔥تنظیم خوشامد [text]🔥
 ⭕️💎set Welcome Message ⭕️💎

🔥زبان [فارسی | انگلیسی]🔥
 ⭕️💎Set Persian/English Language ⭕️💎

🔥دستورات [فارسی | انگلیسی]🔥
 ⭕️💎Set CMD Persian/English Language ⭕️💎

🔥راهنمای ابزار🔥
 ⭕️💎Show Tools Help ⭕️💎

🔥راهنمای سرگرمی🔥
 ⭕️💎Show Fun Help ⭕️💎

🔥°° ورژن ربات 7.1.1°°❄️
🔥°°🇮🇷ساخت توسط  @sasan8u °°❄️

*🌼شما میتوانید از دستورات استقاده کنید🌼 ;)*]]

elseif lang then

text = [[
🔥🍀دستورات ربات ساسان🍀:🔥


🔥مالک🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎انتخاب مالک گروه(قابل انتخاب چند مالک)  ⭕️💎


🔥حذف مالک🔥 `[یوزرنیم|ایدی|ریپلی]` 
   ⭕️💎حذف کردن فرد از فهرست مالکان گروه  ⭕️💎

 
🔥مدیر🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎ارتقا مقام 👤کاربر👤 به مدیر گروه  ⭕️💎


🔥حذف مدیر🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎تنزیل مقام مدیر به 👤کاربر👤  ⭕️💎


🔥تنظیم پیام مکرر🔥 `[2-50]`
  ⭕️💎تنظیم حداکثر تعداد پیام مکرر  ⭕️💎


🔥حداکثر حروف مجاز🔥 `[عدد]`
  ⭕️💎تنظیم حداکثر کاراکتر پیام مکرر  ⭕️💎


🔥تنظیم زمان بررسی🔥 `[1-10]`
  ⭕️💎تنظیم زمان ارسال پیام مکرر  ⭕️💎


🔥سکوت🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎بیصدا کردن 👤کاربر👤 در گروه  ⭕️💎


🔥حذف سکوت🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎در آوردن 👤کاربر👤 از حالت بیصدا در گروه  ⭕️💎


🔥اخراج🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎حذف 👤کاربر👤 از گروه  ⭕️💎


🔥بن🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎مسدود کردن 👤کاربر👤 از گروه  ⭕️💎


🔥حذف بن🔥 `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎در آوردن از حالت مسدودیت 👤کاربر👤 از گروه  ⭕️💎


🔥👤کاربر👤ی🔥 `[یوزرنیم]`
  ⭕️💎نمایش شناسه 👤کاربر👤  ⭕️💎


🔥ایدی🔥 `[ریپلی]`
  ⭕️💎نمایش شناسه 👤کاربر👤  ⭕️💎


🔥شناسه🔥 `[ایدی]`
  ⭕️💎نمایش نام 👤کاربر👤, نام 👤کاربر👤ی و اطلاعات حساب  ⭕️💎


🔥قفل🔥 `[لینک | ورود | تگ | ویرایش | عربی | وب | ربات |هرزنامه | پیام مکرر | فونت | فراخوانی | سنجاق]`
  ⭕️💎در صورت قفل بودن فعالیت ها, ربات آنهارا حذف خواهد کرد  ⭕️💎


🔥باز کردن🔥 `[لینک | ورود | تگ | ویرایش | عربی | وب | ربات |هرزنامه | پیام مکرر | فونت | فراخوانی | سنجاق]`
  ⭕️💎در صورت قفل نبودن فعالیت ها, ربات آنهارا حذف نخواهد کرد  ⭕️💎


🔥بیصدا🔥 `[همه | تصاویر متحرک | عکس | اسناد | برچسب | صفحه کلید | فیلم | متن | نقل قول | موقعیت | اهنگ | صدا | مخاطب | کیبورد شیشه ای|بازی|خدمات تلگرام]`
  ⭕️💎در صورت بیصدا بودن فعالیت ها, ربات آنهارا حذف خواهد کرد  ⭕️💎


🔥باصدا🔥 `[همه | تصاویر متحرک | عکس | اسناد | برچسب | صفحه کلید | فیلم | متن | نقل قول | موقعیت | اهنگ | صدا | مخاطب | کیبورد شیشه ای|بازی|خدمات تلگرام]`
  ⭕️💎در صورت بیصدا نبودن فعالیت ها, ربات آنهارا حذف نخواهد کرد  ⭕️💎


🔥تنظیم🔥`[قوانین | نام | لینک | درباره | خوشامد]`
  ⭕️💎ربات آنهارا ثبت خواهد کرد  ⭕️💎


🔥پاک کردن🔥 `[بن | مدیران | ربات | قوانین | درباره | لیست سکوت | خوشامد]`   
  ⭕️💎ربات آنهارا پاک خواهد کرد  ⭕️💎


🔥لیست سفید🔥 `[+|-]` `[یوزرنیم|ایدی|ریپلی]` 
  ⭕️💎افزودن افراد به لیست سفید  ⭕️💎


🔥فیلتر🔥 `[کلمه]`
  ⭕️💎فیلتر‌کلمه مورد نظر  ⭕️💎


🔥حذف فیلتر🔥 `[کلمه]`
  ⭕️💎ازاد کردن کلمه مورد نظر  ⭕️💎


🔥سنجاق🔥 `[reply]`
  ⭕️💎ربات پیام شمارا در گروه سنجاق خواهد کرد  ⭕️💎


🔥حذف سنجاق🔥 
  ⭕️💎ربات پیام سنجاق شده در گروه را حذف خواهد کرد  ⭕️💎


🔥!خوشامد فعال/غیرفعال🔥
  ⭕️💎فعال یا غیرفعال کردن خوشامد گویی  ⭕️💎


🔥تنظیمات🔥
  ⭕️💎نمایش تنظیمات گروه  ⭕️💎


🔥لیست بیصدا🔥
  ⭕️💎نمایش فهرست بیصدا های گروه  ⭕️💎


🔥لیست سکوت🔥
  ⭕️💎نمایش فهرست افراد بیصدا  ⭕️💎


🔥لیست فیلتر🔥
  ⭕️💎نمایش لیست کلمات فیلتر شده  ⭕️💎


🔥لیست سفید🔥
  ⭕️💎نمایش افراد سفید شده از گروه  ⭕️💎


🔥لیست بن🔥
  ⭕️💎نمایش افراد مسدود شده از گروه  ⭕️💎


🔥لیست مالکان🔥
  ⭕️💎نمایش فهرست مالکان گروه  ⭕️💎 


🔥لیست مدیران🔥 
  ⭕️💎نمایش فهرست مدیران گروه  ⭕️💎


🔥قوانین🔥
  ⭕️💎نمایش قوانین گروه  ⭕️💎


🔥درباره🔥
  ⭕️💎نمایش درباره گروه  ⭕️💎


🔥ایدی🔥
  ⭕️💎نمایش 🆔شناسه شما و گروه  ⭕️💎


🔥اطلاعات گروه🔥
  ⭕️💎نمایش اطلاعات گروه  ⭕️💎


🔥لینک جدید🔥
  ⭕️💎ساخت لینک جدید  ⭕️💎


🔥لینک🔥
  ⭕️💎نمایش لینک گروه  ⭕️💎


🔥تنظیم لینک🔥
  ⭕️💎تنظیم لینک جدید برای گروه  ⭕️💎


🔥لینک خصوصی🔥
  ⭕️💎ارسال لینک گروه به چت خصوصی شما  ⭕️💎


🔥زبان انگلیسی🔥
  ⭕️💎تنظیم زبان انگلیسی  ⭕️💎


🔥زبان فارسی🔥
  ⭕️💎تنظیم زبان فارسی  ⭕️💎


🔥دستورات انگلیسی🔥
  ⭕️💎تنظیم دستورات انگلیسی  ⭕️💎


🔥دستورات فارسی🔥
  ⭕️💎تنظیم دستورات فارسی  ⭕️💎


🔥تنظیم خوشامد [متن]🔥
  ⭕️💎ثبت پیام خوش آمد گویی  ⭕️💎


🔥راهنمای ابزار🔥
  ⭕️💎نمایش راهنمای ابزار  ⭕️💎


🔥راهنمای سرگرمی🔥
  ⭕️💎نمایش راهنمای سرگرمی  ⭕️💎

🔥°° ورژن ربات 7.1.1°°❄️
🔥°°🇮🇷ساخت توسط  @sasan8u °°❄️
*🌼شما میتوانید از دستورات استقاده کنید🌼;)*]]
end
return text..msg_caption
end
--------------------- Welcome -----------------------
	if ((matches[1] == "welcome" and not Clang) or (matches[1] == "خوشامد" and Clang)) and is_mod(msg) then
		if ((matches[2] == "enable" and not Clang) or (matches[2] == "فعال" and Clang)) then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
       if not lang then
				return "_Group_ *welcome* _is already enabled_"
       elseif lang then
				return "_خوشآمد گویی از قبل فعال بود_"
           end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
       if not lang then
				return "_Group_ *welcome* _has been enabled_"
       elseif lang then
				return "_خوشآمد گویی فعال شد_"
          end
			end
		end
		
		if ((matches[2] == "disable" and not Clang) or (matches[2] == "غیرفعال" and Clang)) then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
      if not lang then
				return "_Group_ *Welcome* _is already disabled_"
      elseif lang then
				return "_خوشآمد گویی از قبل فعال نبود_"
         end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
      if not lang then
				return "_Group_ *welcome* _has been disabled_"
      elseif lang then
				return "_خوشآمد گویی غیرفعال شد_"
          end
			end
		end
	end
	if ((matches[1] == "setwelcome" and not Clang) or (matches[1] == "تنظیم خوشامد" and Clang)) and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "🔰_Welcome Message Has Been Set To🔰 :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} ➣ Show ⚜️Group rules⚜️_\n_{time} ➣ Show time english _\n_{date} ➣ Show date english _\n_{timefa} ➣ Show time persian _\n_{datefa} ➣ show date persian _\n_{name} ➣ New Member First Name_\n_{👤User👤name} ➣ New Member 👤User👤name_"..msg_caption
       else
		return "_پیام خوشآمد گویی تنظیم شد به :_\n*"..matches[2].."*\n\n*شما میتوانید از*\n_{gpname} نام گروه_\n_{rules} ➣ نمایش قوانین گروه_\n_{time} ➣ ساعت به زبان انگلیسی _\n_{date} ➣ تاریخ به زبان انگلیسی _\n_{timefa} ➣ ساعت به زبان فارسی _\n_{datefa} ➣ تاریخ به زبان فارسی _\n_{name} ➣ نام 👤کاربر👤 جدید_\n_{👤User👤name} ➣ نام 👤کاربر👤ی 👤کاربر👤 جدید_\n_استفاده کنید_"..msg_caption
        end
     end
	end
end
-----------------------------------------
local checkmod = true

local function pre_process(msg)
local chat = msg.to.id
local 👤User👤 = msg.from.id
local hash = "gp_lang:"..chat
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
 if checkmod and msg.text and msg.to.type == 'channel' then
 	checkmod = false
	tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, function(a, b)
	local secchk = true
		for k,v in pairs(b.members_) do
			if v.👤User👤_id_ == tonumber(our_id) then
				secchk = false
			end
		end
		if secchk then
			checkmod = false
			if not lang then
				return tdcli.sendMessage(msg.to.id, 0, 1, '_Robot isn\'t Administrator, Please promote to Admin!_', 1, "md")
			else
				return tdcli.sendMessage(msg.to.id, 0, 1, '_لطفا برای کارکرد کامل دستورات، ربات را به مدیر گروه ارتقا دهید._', 1, "md")
			end
		end
	end, nil)
 end
	local function welcome_cb(arg, data)
	local url , res = http.request('http://api.beyond-dev.ir/time/')
          if res ~= 200 then return "No connection" end
      local jdat = json:decode(url)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "*Welcome Dude*"
    elseif lang then
     welcome = "_خوش آمدید_"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@sasan8u"
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود.\n@sasan8u"
 end
end
if data.👤User👤name_ then
👤User👤_name = "@"..check_markdown(data.👤User👤name_)
else
👤User👤_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_..' '..(data.last_name_ or '')))
		local welcome = welcome:gsub("{👤User👤name}", 👤User👤_name)
		local welcome = welcome:gsub("{time}", jdat.ENtime)
		local welcome = welcome:gsub("{date}", jdat.ENdate)
		local welcome = welcome:gsub("{timefa}", jdat.FAtime)
		local welcome = welcome:gsub("{datefa}", jdat.FAdate)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.add👤User👤 then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.get👤User👤(msg.add👤User👤, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.join👤User👤 then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.get👤User👤(msg.sender_👤User👤_id_, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
        end
		end
	end

 end
 
return {
patterns ={
"^[!/#](id)$",
"^[!/#](id) (.*)$",
"^[!/#](pin)$",
"^[!/#](unpin)$",
"^[!/#](gpinfo)$",
"^[!/#](test)$",
"^[!/#](add)$",
"^[!/#](rem)$",
"^[!/#](option)$",
"^[!/#](whitelist) ([+-])$",
"^[!/#](whitelist) ([+-]) (.*)$",
"^[#!/](whitelist)$",
"^[!/#](setowner)$",
"^[!/#](setowner) (.*)$",
"^[!/#](remowner)$",
"^[!/#](remowner) (.*)$",
"^[!/#](promote)$",
"^[!/#](promote) (.*)$",
"^[!/#](demote)$",
"^[!/#](demote) (.*)$",
"^[!/#](modlist)$",
"^[!/#](ownerlist)$",
"^[!/#](lock) (.*)$",
"^[!/#](unlock) (.*)$",
"^[!/#](settings)$",
"^[!/#](mutelist)$",
"^[!/#](mute) (.*)$",
"^[!/#](unmute) (.*)$",
"^[!/#](link)$",
"^[!/#](linkpv)$",
"^[!/#](setlink)$",
"^[!/#](newlink)$",
"^[!/#](rules)$",
"^[!/#](setrules) (.*)$",
"^[!/#](about)$",
"^[!/#](setabout) (.*)$",
"^[!/#](setname) (.*)$",
"^[!/#](clean) (.*)$",
"^[!/#](setflood) (%d+)$",
"^[!/#](setchar) (%d+)$",
"^[!/#](setfloodtime) (%d+)$",
"^[!/#](res) (.*)$",
"^[!/#](whois) (%d+)$",
"^[!/#](help)$",
"^[!/#](setlang) (.*)$",
"^[!/#](setcmd) (.*)$",
"^[#!/](filter) (.*)$",
"^[#!/](unfilter) (.*)$",
"^[#!/](filterlist)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[!/#](setwelcome) (.*)",
"^[!/#](welcome) (.*)$",
"^(زبان) (.*)$",
"^(دستورات انگلیسی)$",
"^(ایدی)$",
"^(ایدی) (.*)$",
'^(تنظیمات)$',
'^(تنظیمات کلی)$',
'^(سنجاق)$',
'^(حذف سنجاق)$',
'^(افزودن)$',
'^(حذف گروه)$',
'^(ادمین گروه)$',
'^(ادمین گروه) (.*)$',
'^(حذف ادمین گروه) (.*)$',
'^(حذف ادمین گروه)$',
'^(لیست سفید) ([+-]) (.*)$',
'^(لیست سفید) ([+-])$',
'^(لیست سفید)$',
'^(مالک)$',
'^(مالک) (.*)$',
'^(حذف مالک) (.*)$',
'^(حذف مالک)$',
'^(مدیر)$',
'^(مدیر) (.*)$',
'^(حذف مدیر)$',
'^(حذف مدیر) (.*)$',
'^(قفل) (.*)$',
'^(باز کردن) (.*)$',
'^(بیصدا) (.*)$',
'^(باصدا) (.*)$',
'^(لینک جدید)$',
'^(لینک جدید) (خصوصی)$',
'^(اطلاعات گروه)$',
'^(دستورات) (.*)$',
'^(قوانین)$',
'^(لینک)$',
'^(تنظیم لینک)$',
'^(تنظیم قوانین) (.*)$',
'^(لینک) (خصوصی)$',
'^(👤کاربر👤ی) (.*)$',
'^(شناسه) (%d+)$',
'^(تنظیم پیام مکرر) (%d+)$',
'^(تنظیم زمان بررسی) (%d+)$',
'^(حداکثر حروف مجاز) (%d+)$',
'^(پاک کردن) (.*)$',
'^(درباره)$',
'^(تنظیم نام) (.*)$',
'^(تنظیم درباره) (.*)$',
'^(لیست فیلتر)$',
'^(لیست بیصدا)$',
'^(لیست مالکان)$',
'^(لیست مدیران)$',
'^(راهنما)$',
'^(فیلتر) (.*)$',
'^(حذف فیلتر) (.*)$',
'^(خوشامد) (.*)$',
'^(تنظیم خوشامد) (.*)$',
🔥°° ورژن ربات 7.1.1°°❄️
🔥°°🇮🇷ساخت توسط  @sasan8u °°❄️

},
run=run,
pre_process = pre_process
}
--end groupmanager.lua #sasan team#
