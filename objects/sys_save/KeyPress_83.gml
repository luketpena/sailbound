// generate new vars

// string var
name = choose("Super", "Cool", "Awesome", "Mega", "PewPew", "Rawr") + "Player";
// some real vars
level = irandom_range(1, 10);
hp = irandom_range(1, 100)
mp = irandom_range(1, 100)
ep = irandom_range(1, 100)
// array
for (var i=0; i<10; i++) {
	item[i] = irandom(1);
}

// save vars

savegame_save();