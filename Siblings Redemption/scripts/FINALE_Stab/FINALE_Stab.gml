function FINALE_Stab(_offset, _side) {
	stabber = instance_create_depth(-1999, -1999, -100, FINALE_Stabber);
	switch _side {
		case "DOWN":
			stabber.x = 428 + random_range(-_offset, _offset);
			stabber.y = 480;
			stabber.image_angle = -90;
			break;
		case "UP":
			stabber.x = 426 + random_range(-_offset, _offset);
			stabber.y = 0;
			stabber.image_angle = 90;
			break;
		case "LEFT":
			stabber.x = 0;
			stabber.y = 239 + random_range(-_offset, _offset);
			stabber.image_angle = 180;
			break;
		case "RIGHT":
			stabber.x = 854;
			stabber.y = 241 + random_range(-_offset, _offset);
			stabber.image_angle = 0;
			break;
	}
}