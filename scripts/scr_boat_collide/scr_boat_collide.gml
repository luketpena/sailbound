
function boat_collide_basic(x,y){
	var collide_h = (x>obj_boat_back.x && x<obj_boat_front.x);
	var collide_dis = (point_distance(x,y,global.boat_x,global.boat_y)<obj_boat_front.boat_hwidth);
	
	return (collide_h && collide_dis);
}

function boat_collide_precise(x,y,radius) {
	return (collision_circle(x,y,radius,obj_boat_center,false,true)!=noone);
}