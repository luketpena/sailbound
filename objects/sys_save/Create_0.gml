// test variables

// string var
name = "Player";
// some real vars
level = 1;
hp = 100;
mp = 100;
ep = 0;
// array
for (var i=0; i<10; i++) {
  item[i] = 0;
}

// set variables for drawing

text = "Name: " + string(name) + "\r\n";
text += "Level: " + string(level) + "\r\n";
text += "HP: " + string(hp) + "\r\n";
text += "MP: " + string(mp) + "\r\n";
text += "EXP: " + string(ep) + "\r\n";
for (var i=0; i<10; i++) {
	text += "Item " + string(i) + ": " + string(item[i]) + "\r\n";
}

draw_set_font(f_std);