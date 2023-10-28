/*
	Game maker draw_text is NOT performant, and drawing each letter individually is costly.
	It is more efficient to translate that to a map of image indexes we can translate text
	to and then draw them as individual sprites.
	
	This is to facilitate text animation and effects, like blend colors, wiggle, wobble, and shake.
*/
function defineAlphabetMap() {
	alphabetMap = ds_map_create();

	alphabetMap[? " "] = 0;
	alphabetMap[? "a"] = 1;
	alphabetMap[? "b"] = 2;
	alphabetMap[? "c"] = 3;
	alphabetMap[? "d"] = 4;
	alphabetMap[? "e"] = 5;
	alphabetMap[? "f"] = 6;
	alphabetMap[? "g"] = 7;
	alphabetMap[? "h"] = 8;
	alphabetMap[? "i"] = 9;
	alphabetMap[? "j"] = 10;
	alphabetMap[? "k"] = 11;
	alphabetMap[? "l"] = 12;
	alphabetMap[? "m"] = 13;
	alphabetMap[? "n"] = 14;
	alphabetMap[? "ñ"] = 15;
	alphabetMap[? "o"] = 16;
	alphabetMap[? "p"] = 17;
	alphabetMap[? "q"] = 18;
	alphabetMap[? "r"] = 19;
	alphabetMap[? "s"] = 20;
	alphabetMap[? "t"] = 21;
	alphabetMap[? "u"] = 22;
	alphabetMap[? "v"] = 23;
	alphabetMap[? "w"] = 24;
	alphabetMap[? "x"] = 25;
	alphabetMap[? "y"] = 26;
	alphabetMap[? "z"] = 27;

	alphabetMap[? "0"] = 28;
	alphabetMap[? "1"] = 29;
	alphabetMap[? "2"] = 30;
	alphabetMap[? "3"] = 31;
	alphabetMap[? "4"] = 32;
	alphabetMap[? "5"] = 33;
	alphabetMap[? "6"] = 34;
	alphabetMap[? "7"] = 35;
	alphabetMap[? "8"] = 36;
	alphabetMap[? "9"] = 37;

	alphabetMap[? "."] = 38;
	alphabetMap[? ","] = 39;
	alphabetMap[? "!"] = 40;
	alphabetMap[? "?"] = 41;
	alphabetMap[? ":"] = 42;
	alphabetMap[? ";"] = 43;
	alphabetMap[? "'"] = 44;
	alphabetMap[? "$"] = 45;
	alphabetMap[? "%"] = 46;
	alphabetMap[? "("] = 47;
	alphabetMap[? ")"] = 48;
	alphabetMap[? "-"] = 49;
	alphabetMap[? "♫"] = 50;
	alphabetMap[? "+"] = 51;
	alphabetMap[? "/"] = 52;

	alphabetMap[? "A"] = 53;
	alphabetMap[? "B"] = 54;
	alphabetMap[? "X"] = 55;
	alphabetMap[? "Y"] = 56;
	alphabetMap[? "C"] = 57;	
}