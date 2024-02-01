fx_version 'cerulean'
game 'gta5'

author 'PEUREN DEVELOPMENT - peuren.tebex.io'
version '0.0.1'
lua54 'yes'

client_scripts { 'client/groups/**', "client/inventory/carryItems.lua", 'client/main.lua', "client/menu/skillMenu.lua" }
server_scripts { 'server/groups/**', 'server/main.lua' }
shared_scripts { 
  -- '@PolyZone/client.lua', --Remove the two -- if you're using polyzone in your server
  -- '@PolyZone/BoxZone.lua', --Remove the two -- if you're using polyzone in your server
  -- '@PolyZone/EntityZone.lua', --Remove the two -- if you're using polyzone in your server
  -- '@PolyZone/CircleZone.lua', --Remove the two -- if you're using polyzone in your server
  -- '@PolyZone/ComboZone.lua', --Remove the two -- if you're using polyzone in your server

  --'@ox_lib/init.lua', --Remove the two -- if you're using ox_lib in your server
  
  'utils/**/*.lua', 
  'shared/**/*.lua' 
}

files { 'client/**/*.lua', 'locales/*.json' }
