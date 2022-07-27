grab_subPosition = grab_position mod rope_length;
grab_index = clamp(floor(grab_position / rope_length), 0, grab_length-1);

findGrabCoordinates();