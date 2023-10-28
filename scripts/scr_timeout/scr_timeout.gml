function timeout(duration, endFunction) {
	var o = instance_create_layer(0, 0, l_system, o_timeout);
	o.init(duration, endFunction);
}
