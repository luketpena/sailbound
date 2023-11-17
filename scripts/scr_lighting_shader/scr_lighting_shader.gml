///@description Sets up the light shader
function lighting_shader_init() {
	shader = shd_lighting;
	u_lighting_ambience = shader_get_uniform(shader, "ambience");
	u_lighting_surface = shader_get_sampler_index(shader, "s_lightsurf")
	u_lighting_surface_offset = shader_get_uniform(shader, "surface_offset");
}

function lighting_shader_draw() {
	shader_set(shader);
	texture_set_stage(u_lighting_surface, lighting.texture);
	shader_set_uniform_f(u_lighting_ambience, max(clock.nightFade, lighting.value));
	shader_set_uniform_f(u_lighting_surface_offset, 0, 0);
}


function lighting_flash_init() {
	flash = 0;
	u_flash = shader_get_uniform(shd_lighting, "flash");	
}

function lighting_flash_set(value = 1) {
	flash = value;	
}

enum LightFlashSpeed {
	Slow = 0,
	Default = 1,
	Fast = 2
}

function lighting_flash_step(lightFlashSpeedOption = LightFlashSpeed.Default) {
	var speedOptions = [.01, .035, .1];
	if (flash > 0) {
		flash = max(flash - speedOptions[lightFlashSpeedOption], 0);
	}
}

function lighting_flash_draw() {
	shader_set_uniform_f(u_flash, flash);
}

function lighting_flash_clear() {
	shader_set_uniform_f(u_flash, 0);	
}