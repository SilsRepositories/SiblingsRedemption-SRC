function FINALE_Claw(_x, _y, _ang, _hs, _vs) {
	stabber = instance_create_depth(_x, _y, -100, FINALE_Stabber4);
	stabber.image_angle = _ang;
	stabber.hspeed = _hs;
	stabber.vspeed = _vs;
}