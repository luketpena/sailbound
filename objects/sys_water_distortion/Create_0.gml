distort_surface = noone;

distort_tex_surface = noone;

distort_shader = shd_waterDistortion;
distort_tex = noone;
u_distort_tex = shader_get_sampler_index(distort_shader,"distort_tex");
u_blend_color = shader_get_uniform(distort_shader,"blend_color");

tex_x = 0;