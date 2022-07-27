// Prop spawning
generateProp();


if keyboard_check_pressed(ord("1")) {
	updatePropChance("Seaweed", 5);
}
if keyboard_check_pressed(ord("2")) updatePropChance("seaweed", 20);
if keyboard_check_pressed(ord("3")) updatePropChance("seaweed", 50);
if keyboard_check_pressed(ord("4")) updatePropChance("seaweed", 80);