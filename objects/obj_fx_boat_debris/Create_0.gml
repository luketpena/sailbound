fixture_create_box(id,8,2,.5,.1,.1,.1,.2,true,false);
behave_init(behave.bouncer,.1,3,1,true,.01,.9,1,.5,.05,-3);
phy_speed_x = random_range(-5,3);
phy_speed_y = random_range(-1,-3);

image_speed = 0;
image_index = irandom(sprite_get_number(sprite_index)-1);

wait = random_range(2,4)*room_speed;

u_flash = shader_get_uniform(shd_lighting,"flash");