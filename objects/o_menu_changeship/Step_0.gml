if input_check_pressed("up") changeSelectY(-1);
if input_check_pressed("down") changeSelectY(1);
if input_check_pressed("left") changeSelectX(-1);
if input_check_pressed("right") changeSelectX(1);

if input_check_pressed("accept") {
	if (mode = "select") {
		selectHull();
	}
}

if  input_check_pressed("cancel") {
	instance_destroy();
}

previewRot = (previewRot + 5) mod 360;
previewAngle = lengthdir_y(5, previewRot);

if (previewInstance != null && instance_exists(previewInstance)) {
	previewInstance.hull_angle = previewAngle	
}