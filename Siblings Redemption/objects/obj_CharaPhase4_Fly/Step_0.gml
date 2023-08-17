if attractX == 0 {
	x = xstart + sin(siner) * 16;
	image_xscale = ((sin(siner) * 16 < 0) ? -1 : 1);
	siner += 0.03;
}
else {
	var _x = obj_CharaPhase4_ThistleTwo.x + attractX;
	var _y = obj_CharaPhase4_ThistleTwo.y + attractY;
	if point_distance(x, y, _x, _y) < 30 {
		friction = 0.01;
	}
	image_xscale = (hspeed <= 0 ? -1 : 1);
	direction = point_direction(x, y, _x, _y);
	speed = 5;
	if friction > 0 {
		image_xscale -= 0.01;
		image_yscale -= 0.01;
		if image_xscale <= 0 {
			instance_destroy();
		}
	}
}