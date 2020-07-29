if keyboard_check_pressed(vk_f2) waves_set_behavior_preset(waves.normal);
if keyboard_check_pressed(vk_f3) waves_set_behavior_preset(waves.calm);
if keyboard_check_pressed(vk_f4) waves_set_behavior_preset(waves.stagnant);
if keyboard_check_pressed(vk_f5) waves_set_behavior_preset(waves.rolling);

if keyboard_check_pressed(vk_space) spawn_location(spr_loc_lighthouse,0);