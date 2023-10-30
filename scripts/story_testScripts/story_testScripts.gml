function story_drawDebug() {
	draw_set_color(c_red);
	draw_set_alpha(1);
	
	var _yPos = 32;

	draw_line_width(-1, _yPos, global.vw, _yPos, 2);
	draw_set_color(c_orange);

	for (var i=0; i<chapterCount; i++) {
		var _chapter = config.chapters[i];
		var _pos = _chapter.startTime / totalDuration;
	
		draw_circle(global.vw * _pos, _yPos, 3, false);
	}

	draw_set_color(c_yellow);
	draw_circle(global.vw * (progress / totalDuration), _yPos, 3, false);
}