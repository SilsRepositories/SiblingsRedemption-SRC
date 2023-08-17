function FINALE_Spin1(_x, _y, _rng) {
	if _rng {
		_x = random(854);
		_y = random(480);
	}
	instance_create_depth(_x, _y, -1000, FINALE_Spinner1);
}