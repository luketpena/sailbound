/// @description draw_text_outline(x, y, str, outwidth, outcol, outfidelity)
function draw_text_outline(_x, _y, _text, _textCol, _outWidth, _outCol, _outFidelity, _alpha = 1) {
	//Created by Andrew McCluskey http://nalgames.com/
	//x, y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)

	var _textToDraw = string_hash_to_newline(_text);
	for(var dto_i=45; dto_i<405; dto_i+=360/_outFidelity) {
		var _outX = _x + lengthdir_x(_outWidth, dto_i);
		var _outY = _y+lengthdir_y(_outWidth, dto_i);
	    draw_text_color1(_outX, _outY, _textToDraw, _outCol, _alpha);
	}

	draw_text_color1(_x, _y, _textToDraw, _textCol, _alpha);
}
