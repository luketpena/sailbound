var duration_in_minutes = 2;
progress_rate = (duration_in_minutes / 60) / room_speed;
progress_slider = 0; //Tracks the actual movement of progress
progress_unit = floor(progress_slider); //The integer unit progress has reached
global.progress = 0;
progress_paused = false;