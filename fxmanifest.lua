-- SIMPLE PARACHUTE SCRIPT by noskillarmy
fx_version 'adamant'
games {'gta5'}

author 'noskill'
name 'noskill_parachute'

version '1.0'
lua54 'yes'

escrow_ignore {
    'config.lua',
    
}

client_scripts {
    'client.lua',

}

server_scripts {
    'server.lua'

}

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',


}

dependency '/assetpacks'