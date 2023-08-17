draw_self();
if image_index >= 7 {
	draw_sprite_ext(Flowey_Face, Emotion, x, y + 10, 2, 2, 0, c_white, 1);
}
SoulDir += 1;
if (con >= 7) {
	SoulDistance -= 4;
	if SoulDistance < 100 {
		SoulDistance = 100;
	}
	draw_sprite(Soul_Orange, 0, x + lengthdir_x(SoulDistance, SoulDir), (y - 15) + lengthdir_y(SoulDistance, SoulDir));
	draw_sprite(Soul_Yellow, 0, x + lengthdir_x(SoulDistance, SoulDir + 60), (y - 15) + lengthdir_y(SoulDistance, SoulDir + 60));
	draw_sprite(Soul_Green, 0, x + lengthdir_x(SoulDistance, SoulDir + 120), (y - 15) + lengthdir_y(SoulDistance, SoulDir + 120));
	draw_sprite(Soul_Blue, 0, x + lengthdir_x(SoulDistance, SoulDir + 180), (y - 15) + lengthdir_y(SoulDistance, SoulDir + 180));
	draw_sprite(Soul_Turquoise, 0, x + lengthdir_x(SoulDistance, SoulDir + 240), (y - 15) + lengthdir_y(SoulDistance, SoulDir + 240));
	draw_sprite(Soul_Purple, 0, x + lengthdir_x(SoulDistance, SoulDir + 300), (y - 15) + lengthdir_y(SoulDistance, SoulDir + 300));
}
if (con == 13) {
	draw_set_color(c_white);
	draw_set_alpha(Whiter);
	draw_rectangle(0, 0, 640, 480, false);
	draw_set_alpha(1);
	Whiter += 0.05;
	if Whiter >= 1
		Whiter = 1;
}