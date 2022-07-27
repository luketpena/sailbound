global.vx = 0;
global.vy = 0;
global.vw = 0;
global.vh = 0;
global.vr = 0;
global.vb = 0;
global.hvw = 0;
global.hvh = 0;
global.midx = 0;
global.midy = 0;

camera_init(1);
gamepad_set_axis_deadzone(0, .2);

global.camAngle = 90;

cameraAngleSpeed = 0;
cameraAngleSpeedMax = 3;