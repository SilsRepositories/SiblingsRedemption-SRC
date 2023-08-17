if timer < 30 {
	draw_set_color(c_red);
	if timer % 2 == 0 {
		if !global.antiEpilepsy
			draw_set_color(c_yellow);
	}
	draw_line(x, y, x + lengthdir_x(9999, direction), y + lengthdir_y(9999, direction));
}
if timer == 30 {
	speed = 18;
	audio_play_sound(Swipe, 0, false);
	obj_CharaMonster_Phase4.ShakeEffect = 12;
}
timer += 1;