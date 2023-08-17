Timer -= 1;
draw_set_color(c_red);
if (Timer % 8 == 0 && Timer > 0) {
	if global.EnemyGroup != 3
		audio_play_sound(snd_test, 1, false);
	if !global.antiEpilepsy
		draw_set_color(c_yellow);
}
if (Timer == 0) {
	if global.EnemyGroup != 3 {
		audio_play_sound(Slash, 0, false);
		audio_sound_gain(Gigatalk, 0.75, 0);
		audio_sound_pitch(Gigatalk, 1.1);
		audio_play_sound(Gigatalk, 0, false);
		audio_play_sound(Swipe, 0, false);
	}
	if instance_exists(obj_BattleEffects)
		obj_BattleEffects.ShakeEffect = 4;
}
if Timer > 0 {
	draw_line(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir));
}
else {
	image_alpha -= 0.06;
	draw_set_color(c_white);
	draw_set_alpha(image_alpha / 2);
	draw_line_width(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), -Timer * 4);
	draw_set_color(c_red);
	draw_set_alpha(image_alpha);
	draw_line_width(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), -Timer * 2);
	draw_set_alpha(1);
	if (image_alpha < -0.7) {	
		instance_destroy();
	}
}