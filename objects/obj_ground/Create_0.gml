thickness = 128;

fixture_create_box(id,room_width/2,thickness,0,0,0,0,.2,false,true);
phy_position_x = room_width/2;
phy_position_y = global.vb+thickness*1.5;

wait = 0;
state = "rise";

target_y = global.water_y+64;
sink_speed = 0;

unit_w = 64;

unit_num = global.vw/unit_w;