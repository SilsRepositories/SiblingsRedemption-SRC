siner += 1;
if ai == 0 {
	alarm[0] = 30;
	ai = -1;
}
if ai == 1 {
	x = cenx + lengthdir_x(siner, di);
	y = ceny + lengthdir_y(siner, di);
	di += speed;
}
if ai == 2 {
	x = cenx + lengthdir_x(200, di);
	y = ceny + lengthdir_y(200, di);
}
if ai == 3 {
	direction = point_direction(x, y, cenx, ceny);
	speed = 1;
	friction = -0.1;
	ai = -1;
}