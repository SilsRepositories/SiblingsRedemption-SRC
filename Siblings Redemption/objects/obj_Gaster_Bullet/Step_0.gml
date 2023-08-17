siner += 1;
if behav == 0 {
	y += random_range(-1, 1);
}
if (x < -400 || x > 1040 || y < -400 || y > 880) {
	instance_destroy();
}
if behav == 1 {
	x = 320 + lengthdir_x(len, dir);
	y = (global.BoardFloor - (global.BorderHeight / 2)) + lengthdir_y(len, dir);
	len -= 2;
	dir += dirSpd;
	if len < 1
		instance_destroy();
}
if behav == 2 {
	x = 320 + lengthdir_x(len, dir);
	y = (global.BoardFloor - (global.BorderHeight / 2)) + lengthdir_y(len, dir);
	len = 140 * abs(sin(siner / 62.8));
	dir += dirSpd;
	image_alpha += 0.01;
}
if behav == 3 {
	x = 320 + lengthdir_x(len, dir);
	y = 140 + lengthdir_y(len, dir);
	len = siner / 4;
	dir += dirSpd;
	image_alpha += 0.01;
}
if behav == 4 {
	x = CenX + lengthdir_x(len, dir);
	y = CenY + lengthdir_y(len, dir);
	CenX += hspeed;
	CenY += vspeed;
	dir += dirSpd;
}