function timeout(duration, endFunction) {
	var o = instance_create_layer(0, 0, l_system, obj_timeout);
	o.init(duration, endFunction);
}
