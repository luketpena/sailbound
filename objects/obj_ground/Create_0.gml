//----< Physical Size and Position >----\\
hlength = room_width*.8; //Half the width
length = hlength*2; //Full width
thickness = 0; //The height

edge_buffer = abs(hlength-room_hwidth);

//----< Drawing >----\\
//>> Size
top = 0;
top_h = 64;
top_h_upper = top_h*.6; //Center to top
top_h_lower = top_h-top_h_upper; //Center to bottom

center_y = top_h_upper;
left = x-hlength;
right = x+hlength;

ground_sprite = spr_sand;

view_right = global.vr+96;
view_left = global.vx-96;

//>> Texture
q = 32; //Divisions of the surface
unit_w = (length)/q; //How wide each division is
tex_w = 1/q; //Width of a texture unit
tex_offset = 0; //Animates the base texture moving

draw_top = 0; //y coordinate of top
draw_low = 0; //y coodrinate of bottom

//>> Surfaces
surf = -1; //Main surface for entire texture
surf_detail = -1;
surf_detail_transfer = -1;
detail_move = 0; //Moves the detail textures on the surface texture

//----< Behavior >----\\
active = false; //Triggered by init
state = "enter";
move_speed = 1;
distanceToCenter = 0;

//----< Items >----\\
//>> Item Setup
item_num = 200;
item_array = [];
item_left = -64;
item_right = room_width+64;

//>> Item Front
itemF_num = 0;
itemF_array = [];

//>> Item Colors
u_horizon_col = shader_get_uniform(shd_fadeColor,"horizon_col"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

//>> Item Constructor
Item = function(_x, _y, _depth, _dis, _sprite) constructor {
	x = _x;
	y = _y-_dis+lerp(0,_dis,_depth);
	scale = lerp(.5,1,_depth);
	shd_power = lerp(1,.1,_depth);
	depth = _depth;
	wait = 0;
	flip = choose(-1,1);
	sprite = _sprite;
	image = irandom(sprite_get_number(_sprite)-1);
}

function createItem(_depth, _sprite) {
	var newItem = new Item(
		random_range(item_left,item_right),
		top,
		_depth,
		top_h_upper,
		_sprite
	);
	return newItem;
}


ItemF = function(_x, _y, _sprite) constructor {
	x = _x;
	y = _y;
	flip = choose(-1,1);
	sprite = _sprite;
	image = irandom(sprite_get_number(_sprite)-1);
	wait = 0;
	rate = random_range(1.5,2);
}


//-----< Functions >-----\\
function init(target_y, _ground_sprite, item_types) {
	//Fills up all space from target y downward
	thickness = (room_height-target_y)/2;
	top = target_y;
	draw_top = top-top_h_upper;
	draw_low = top+top_h_lower;
	//Generates the physics structure
	fixture_create_box(id,hlength,thickness,0,0,0,0,.2,false,true);
	//Sets the position based on the goal position
	phy_position_y = target_y+thickness;
	distanceToCenter = phy_position_x-room_hwidth;
	ground_sprite = _ground_sprite;
	
	//--< Items >--\\
	// Find the full size of the dice for choose the island sprite
	var diceSize = 0;
	var type_num = array_length(item_types);
	for (var i=0; i<type_num; i++) {
		diceSize += item_types[i].chance;
	}
	
	//>> Generate all Items
	for (var i=0; i<item_num; i++) {
		var newDepth = lerp(0,1,i/item_num);
		var roll = irandom(diceSize); // Roll the dice...
		
		var diceCount = 0; // ...track where on the dice we are looking...
		for (var j=0; j<type_num; j++) {
			var type = item_types[j];
			
			// ...increment where we look...
			diceCount += type.chance;
			/// ...and if we are in range of the current item...
			if (roll <= diceCount) {
				// ...generate that item!
				var newItem = createItem(newDepth, type.sprite);
				item_array[i] = newItem;
				break;
			}
		}
	}
	
	for (var i=0; i<itemF_num; i++) {
		var newItemF = new ItemF(
			random_range(item_left,item_right),
			draw_low,
			spr_coral
		);
		
		itemF_array[i] = newItemF;
	}
	
	active = true;
}

function findItemX(_x,_depth) {
	var xx = _x+distanceToCenter;
	var topX = xx-get_perspective(xx);
	return lerp(topX,xx,_depth);
}

function draw_edge(_y,_sprite,_depth, _blend, _index) {
	if (state!="static") {
		var edge_x, edge_face;
		if (state="enter") {
			edge_x = findItemX(-edge_buffer,_depth);
			edge_face = 1;
		} else {
			edge_x = findItemX(hlength+edge_buffer*1.75,_depth);
			edge_face = -1;
		}
		var img = _index*2;
		draw_sprite_ext(_sprite,img,edge_x,_y,edge_face,1,0,_blend,1);
		draw_sprite_ext(_sprite,img+1,edge_x,_y,edge_face,1,0,global.c_water_depth,1);
	}
}

function draw_shadow(_x,_y,offset,rad) {
	var xx = _x-offset;
	var scale = max( 1-((top-_y)/128) , 0) * (rad/128);
	draw_sprite_ext(spr_env_water_displace,0,xx,center_y,scale,scale,0,global.c_water_depth,.5);
}

function leaveStage() {
	state = "leave";
	detail_move = 0;	
}

