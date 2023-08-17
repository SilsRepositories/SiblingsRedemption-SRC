Timer -= 1;
draw_set_color(c_red);
if (Timer % 4 == 0 && Timer > 0) {
	if global.EnemyGroup != 3
		audio_play_sound(mus_sfx_a_target, 1, false);
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
	obj_BattleEffects.CMAB = lerp(obj_BattleEffects.CMAB, 4, 0.06);;
	if instance_exists(obj_BattleEffects)
		obj_BattleEffects.ShakeEffect = 4;
}
if Timer > 0 {
	draw_line(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir));
}
else {
	if instance_exists(obj_CharaMonster_Phase1)
		obj_CharaMonster_Phase1.DodgeAnim = 2;
	image_yscale = lerp(image_yscale, 0, 0.07);
	image_alpha = lerp(image_alpha, 0, 0.1);
	image_angle = Dir;
	draw_self()
	//draw_set_color(c_white);
	//draw_set_alpha(image_alpha / 2);
	//draw_line_width(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), -Timer * 4);
	//draw_set_color(c_red);
	//draw_set_alpha(image_alpha);
	//draw_line_width(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), -Timer * 2);
	//draw_set_alpha(1);
	
	//else {
	//	if image_alpha > 0.6 {
	//		if collision_line(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), obj_Phase4_Soul, false, true) {
	//			audio_play_sound(Hurt, 1, false);
	//			global.soul7_HP -= 2;
	//			if (global.soul7_HP <= 0) {
	//				global.soul7_HP = 0;
	//				room_goto(Room_GameOver_Phase4);
	//			}
	//		}
	//	}
	//}
	if (image_yscale < 0.1) {	
		if instance_exists(obj_CharaMonster_Phase1)
			obj_CharaMonster_Phase1.DodgeAnim = 0;
		instance_destroy();
	}
}