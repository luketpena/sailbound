///@description Sets up the light shader
function lighting_shader_init() {
	shader = shd_lighting;
	u_lighting_ambience = shader_get_uniform(shader,"ambience");
	u_lighting_surface = shader_get_sampler_index(shader, "s_lightsurf")
	u_lighting_surface_offset = shader_get_uniform(shader, "surface_offset");
}

function lighting_shader_draw() {
	shader_set(shader);
	texture_set_stage(u_lighting_surface,global.light_texture);
	shader_set_uniform_f(u_lighting_ambience,global.clock_fade);
	shader_set_uniform_f(u_lighting_surface_offset,0,0);
}


function lighting_flash_init() {
	flash = 0;
	u_flash = shader_get_uniform(shd_lighting,"flash");	
}

function lighting_flash_step() {
	if (flash>0) flash = max(flash-.035,0);
}

function lighting_flash_draw() {
	shader_set_uniform_f(u_flash,flash);
}