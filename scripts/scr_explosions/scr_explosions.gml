///@description Creates a poof when a mob is destroyed
///@param x
///@param y
///@param poofRadius
function ex_mobPoof(x, y, radius) {
	var o = instance_create_layer(x, y, "l_fx_above", obj_fx_mobPoof);
	// Limited to a max of 50 to fit in the surface
	o.init(clamp(radius, 0, 50));
}