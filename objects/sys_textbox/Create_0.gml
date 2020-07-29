active = false;
text_alpha = 0;

padding = 8;

left = 8;
right = global.vw-8;
top = 8;
bottom = top+64;

text_pos = 0;
text_complete = false;
textbox_height = 68;
text_width = right-left-(padding*3);

text_queue = [];
text_select = 0;

surf_textbox = -1;



grow = 0;



nextButton_rot = 0;
nextButton_size = 0;
nextButton_lerp = 0;

genie_lerp = 0;

side = "top";

text = "This is a first test of the textbox system.##This should be a line break. And hopefully in the future it will auto-linebreak itself.#This text should continue on and on and on and on until we find out if it collides with the anchor and find out where it stops.";

text = string_fit_width(text,right-left-(padding*3));

text_length = string_length(string_hash_to_newline(text));

scr_textbox_set_position_goals("top");

//All points start and center and lerp to their positions
for (var i=0; i<8; i++)
{
	bkg_point[i] = bkg_c;
}