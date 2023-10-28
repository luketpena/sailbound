targetDoor = noone;
mode = "town";

global.cutout_top_surface = noone;
global.motion = 0;

var partLayer = layer_create(-100, "l_part_above");
global.ps_fx_above = part_system_create_layer(partLayer, true);

setStrength = 0;

shader = shd_blendTileLayers;
u_lighting_ambience = shader_get_uniform(shader, "ambience");
u_lighting_strength = shader_get_uniform(shader, "strength");
u_lighting_surface = shader_get_sampler_index(shader, "s_lightsurf")
u_lighting_surface_offset = shader_get_uniform(shader, "surface_offset");
u_blendColor = shader_get_uniform(shader, "blendColor");

function updateBlendShader(strength) {
	texture_set_stage(u_lighting_surface, global.light_texture);
	shader_set_uniform_f(u_lighting_ambience, clock.nightFade);
	shader_set_uniform_f(u_lighting_strength, strength);
	shader_set_uniform_f(u_lighting_surface_offset, 0, 0);
	shader_set_uniform_f_array(u_blendColor, c_front_vec3);
}

function startTileBlending(layerName, strength) {
	var layerId = layer_get_id(layerName);
	var o = instance_create_depth(0, 0, 0, o_layerBlender);
	o.init(layerId, strength);
}
