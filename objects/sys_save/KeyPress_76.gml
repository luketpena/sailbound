// load

savegame_load();

// update variables after load

text = "Name: " + string(name) + "\r\n";
text += "Level: " + string(level) + "\r\n";
text += "HP: " + string(hp) + "\r\n";
text += "MP: " + string(mp) + "\r\n";
text += "EXP: " + string(ep) + "\r\n";
for (var i = 0; i < 10; i++) {
	text += "Item " + string(i) + ": " + string(item[i]) + "\r\n";
}