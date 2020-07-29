distort_surface = noone;
distort_sprite = spr_fx_water_distortion;

distort_shader = shd_waterDistortion;
distort_tex = sprite_get_texture(distort_sprite,0);
u_distort_tex = shader_get_sampler_index(distort_shader,"distort_tex");
u_time = shader_get_uniform(distort_shader,"time");
u_blend_color = shader_get_uniform(distort_shader,"blend_color");

time = 0;


blend_color = color_to_vec3(global.c_water_surface);
alarm[0] = 15; //Alters the color