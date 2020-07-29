/// @description Splash

if (phy_speed_y>4) water_splash_create_single(x,1,"large")
else if (phy_speed_y>2.5) water_splash_create_single(x,1,"medium")
else if (phy_speed_y>1) water_splash_create_single(x,1,"small");
