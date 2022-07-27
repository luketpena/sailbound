puppet.x = x;
puppet.y = y + 4;

collider.phy_position_x = x;
collider.phy_position_y = y;

maceCollider.phy_position_x = puppet.tail.x;
maceCollider.phy_position_y = puppet.tail.y;

behave_step_bouncer();
floater_step(0);
lighting_flash_step();
