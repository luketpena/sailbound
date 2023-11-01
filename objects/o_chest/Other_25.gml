/// @description Splash

if (phy_speed_y>3) water_splash_create_double(x,12,"medium")
else if (phy_speed_y>1) water_splash_create_double(x,12,"small");