shader		= shd_blur_glow;
u_blur_steps			= shader_get_uniform(shader, "blur_steps");
u_sigma			= shader_get_uniform(shader, "sigma");
u_texel_size		= shader_get_uniform(shader, "texel_size");
u_blur_vector = shader_get_uniform(shader, "blur_vector");

gui_w = global.vw;
gui_h = global.vh;

texel_w = 1 / gui_w;
texel_h = 1 / gui_h;

surf_effects = -1;

surf_ping = -1;
surf_pong = -1;

surf_glow = -1;
surf_particles = -1;

glow_alpha = 0;
