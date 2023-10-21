fx_version 'cerulean'
game 'gta5'

author 'PEUREN DEVELOPMENT - peuren.tebex.io'
version '0.0.1'
lua54 'yes'

client_script 'client/main.lua'
server_script 'server/main.lua'
shared_scripts { '@ox_lib/init.lua', 'utils/**/*.lua', 'shared/**/*.lua' }

files { 'client/**/*.lua' }