sprite_index = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);

for (var i=0; i<array_length(global.ps_list); i++) {
	part_system_automatic_update(global.ps_list[i], false);
}

instance_deactivate_all(true);
physics_pause_enable(true);