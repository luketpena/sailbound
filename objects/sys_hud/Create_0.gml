//>> Settings
display_set_gui_size(global.vw,global.vh);
hud_active = true;
hud_alpha = 1;

//>> Surface
surf_gui = -1;

//>> Coins
coin_active = false;
coin_alpha = 0;
coin_count = 0;
coin_anim = 0;
coin_wait = -1;
coin_size = 1;

//>> Health
u_alpha = shader_get_uniform(shd_set_alpha,"alpha");
hp_alpha = 1;
hp_shudder = 0;
hp_shudder_rot = 0;
hp_glow = 0;
hp_wait = -1;

//>> Items
item_alpha = 0;
item_hud_icons = [];
item_hud_icons[Items.cannon] = spr_hud_item_cannon;
item_singleUse = false;
inventory_alpha = 0;