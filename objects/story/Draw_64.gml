draw_set_color(c_red);
draw_set_alpha(1);

draw_line_width(-1, 4, global.vw, 4, 2);

draw_set_color(c_orange);

for (var i=0; i<chapterCount; i++) {
	var _chapter = chapters[i];
	var _pos = _chapter.startTime / totalDuration;
	
	draw_circle(global.vw * _pos, 4, 3, false);
}

draw_set_color(c_yellow);
draw_circle(global.vw * (progress / totalDuration), 4, 3, false);

draw_set_halign(fa_center);
draw_text(global.hvw, 16, "CHAPTER " + string(chapterCurrentIndex+1));
draw_text(global.hvw, 32, chapterProgress);