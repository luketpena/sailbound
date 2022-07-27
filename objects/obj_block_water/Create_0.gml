width = image_xscale * 32;
height = image_yscale * 32;
surf = noone;
waterPos = 0;
right = x + width;

waterRot = 0;

var o = instance_create_layer(x, y, "l_water_back", obj_block_water_back);
o.parent = self;