/// @description Explode

instance_create_layer(x,y,l_main,obj_fx_explosion_damage);
if (waterBurst) water_splash_create_double(x,32,"medium");
instance_destroy();
