fx_version 'cerulean'

game 'gta5'

lua54 'yes'

shared_script {
	'config.lua',
	'@qbx_core/modules/playerdata.lua',
	'@ox_lib/init.lua'
} 


server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua',
	'framework/*.lua'
}



ui_page 'ui/dist/index.html'



files {
    'ui/dist/index.html',
	'ui/dist/assets/*.js',
    'ui/dist/assets/*.css',
	'ui/dist/assets/*.png'
}

