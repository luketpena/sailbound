// -- Controls --
position = 0;
mov_speed = 0;
exit_x = 0;
image_speed = 0;

// -- Shader --
shader_pwr = 0;
u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?