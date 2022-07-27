if (active) {
	var dialogHeight = closing ? 0 : calculateDialogHeight();
	layout.height += (dialogHeight - layout.height) * .15;

	if (sphere.active) {
		 draw_sprite_ext(
			spr_dialog_bkg_sphere,
			0,
			layout.pos.x,
			layout.pos.y,
			sphere.size,
			sphere.size,
			0, c_white, 1);
	} else {
		draw_sprite_stretched(
			spr_dialog_bkg,
			0,
			layout.pos.x - layout.margin,
			layout.pos.y - layout.margin,
			layout.width + (layout.margin * 2),
			layout.height + (layout.margin * 2));
	}
	
	var qa = question.active;
	var ia = interview.active
	if (qa || ia) {
		// Question background
		var lineHeight = sprite_get_height(spr_font_normal_small) + 4;
		var q = qa ? config[conversationPos].question : interview.list;
		var qHeight = array_length(q) * lineHeight + (layout.margin * 2);
		var qTop = global.vh - qHeight;
		
		draw_sprite_stretched(
			spr_dialog_bkg,
			0,
			layout.margin,
			qTop - layout.margin,
			global.vw - screenMargin * 2,
			qHeight,
		);

		// Question text
		draw_set_font(global.font_normal_small);
		draw_set_color(c_black);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		
		for (var i=0; i<array_length(q); i++) {
			if (select = i) {
				draw_sprite_ext(spr_dialog_questionSelect, 0, 16, qTop + (lineHeight * i), 1, 1, 0, c_white, 1);
			}
			draw_text(24, qTop + (lineHeight * i), q[i].text);	
		}
	}

	for (var i=0; i<textPos; i++) {
		var char = translated[i];
	
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
	
		draw_sprite_ext(spr_font_normal_small, index, xx, yy, char.scale, char.scale, 0, color, 1);
	}

	if (!closing && !question.active && nextButton.lerpVal > 0) {
		var nextButtonAngle = lengthdir_x(16, nextButton.rot);
		draw_sprite_ext(spr_dialog_nextButton, 0, layout.pos.x + layout.width - 8, layout.pos.y + 4 + layout.height, nextButton.size, nextButton.size, nextButtonAngle, c_white, 1);
	}
	
	if (pointer.target != null && pointer.size > 0) {
		draw_sprite_ext(spr_dialog_pointer,0, pointer.x, layout.pos.y - 2 + layout.height + layout.margin, 1, pointer.size, 0, c_white, 1);
	}
}
