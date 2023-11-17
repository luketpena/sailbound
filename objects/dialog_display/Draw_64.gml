if (active) {
	if (sphere.active) {
		// Drawn in place of 9-slice when too small
		 draw_sprite_ext(
			s_dialog_bkg_sphere,
			0,
			layout.pos.x,
			layout.pos.y,
			sphere.size,
			sphere.size,
			0, c_white, 1);
	} else {
		// Actual 9-slice 
		// TODO: Check if actually needs to be stretched sprite?
		draw_sprite_stretched(
			s_dialog_bkg,
			0,
			layout.pos.x - layout.margin,
			layout.pos.y - layout.margin,
			layout.width + (layout.margin * 2),
			layout.height + (layout.margin * 2)
		);
	}


	for (var i=0; i<textPos; i++) {
		var char = text_translated[i];
	
		var index = char.index;
		var position = font.width * char.position;
		var color = char.color;
		var xx = layout.pos.x + position;
		var yy = layout.pos.y + font.height * char.line;
	
		if (font.scale.active && char.scale != 1) {
			char.scale += font.scale.rate;
		}
			
		if (char.quake > 0) {
			var dir = random(360);
			var len = random(char.quake);
			xx += lengthdir_x(len, dir);
			yy += lengthdir_y(len, dir);
		}
	
		if (char.wave) {
			var offset = char.position * font.wave.rotOffset;
			yy += lengthdir_y(font.wave.str, font.wave.rot + offset);	
		}
	
		draw_sprite_ext(s_font_textbox, index, xx, yy, char.scale, char.scale, 0, color, 1);
	}

	if (!closing && nextButton.lerpVal > 0) {
		var nextButtonAngle = lengthdir_x(16, nextButton.rot);
		draw_sprite_ext(s_dialog_nextButton, 0, layout.pos.x + layout.width - 8, layout.pos.y + 4 + layout.height, nextButton.size, nextButton.size, nextButtonAngle, c_white, 1);
	}
	
	if (pointer.target != null && pointer.size > 0) {
		draw_sprite_ext(s_dialog_pointer,0, pointer.x, layout.pos.y - 2 + layout.height + layout.margin, 1, pointer.size, 0, c_white, 1);
	}
	
	var _response_count = array_length(dialog_reader.response_text);
	if (_response_count > 0) {
		// Question background
		var _lineHeight = sprite_get_height(s_font_normal_small) + 4;
		var _qHeight = _response_count * _lineHeight + (layout.margin * 2);
		var _qTop = global.vh - _qHeight; 
		
		draw_sprite_stretched(
			s_dialog_bkg,
			0,
			layout.margin,
			_qTop - layout.margin,
			global.vw - screenMargin * 2,
			_qHeight
		);

		// Question text
		draw_set_font(global.font_textbox);
		draw_set_color(c_black);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		
		for (var i=0; i<_response_count; i++) {
			if (dialog_reader.response_select = i) {
				draw_sprite_ext(s_dialog_questionSelect, 0, 16, _qTop + (_lineHeight * i), 1, 1, 0, c_white, 1);
			}
			draw_text(24, _qTop + (_lineHeight * i), dialog_reader.response_text[i]);	
		}
	}
}
