//>> Controls
position = 0;
mov_speed = 0;
exit_x = 0;
image_speed = 0;

//>> Shader
shader_pwr = 0;
u_horizon_col = shader_get_uniform(shd_island,"horizon_col"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_island,"pwr"); //How far does it fade to that color?