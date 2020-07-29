
if (clock_active) clock_elapsed += clock_speed;
global.clock_time = clock_elapsed mod 360;
clock_day = ((clock_elapsed+90) div 360)-1;

if keyboard_check(vk_right) clock_elapsed -= 2;
if keyboard_check(vk_left) clock_elapsed += 2;
