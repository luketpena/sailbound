function zone_create(x1, y1, x2, y2) {
	var z = instance_create_layer(x1, y1, "l_main", zone);
	z.image_xscale = x2-x1;
	z.image_yscale = y2-y1;
	return z;
}