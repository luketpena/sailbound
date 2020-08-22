instance_activate_all();
sprite_delete(sprite_index)

for (var i=0; i<array_length(global.ps_list); i++) {
	part_system_automatic_update(global.ps_list[i], true);
}

physics_pause_enable(false);
