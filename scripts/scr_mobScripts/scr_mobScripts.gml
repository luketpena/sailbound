function cleanDanger(dangerLevel) {
	global.danger = max(global.danger - dangerLevel, 0);	
}