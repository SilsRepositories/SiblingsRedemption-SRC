if image_alpha > 0.6 && global.InvFrames <= 0 && Timer <= 0 {
	if collision_line(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), obj_Soul, false, true) {
		audio_play_sound(Hurt, 1, false);
		global.InvFrames = 30;
		global.NoHit = false;
		global.FG_Hits += 1;
		if instance_exists(obj_CharaMonster_Phase1) {
			if obj_CharaMonster_Phase1.Taunted {
				room_goto(Room_GameOver);
				exit;
			}
		}
		global.PlayerHP -= 20;
		if (global.PlayerHP < 1 && global.Karma > 1) {
			global.PlayerHP = 1;
			global.Karma -= 20;
		}
		if (global.PlayerHP <= 0) {
			global.PlayerHP = 0;
			room_goto(Room_GameOver);
		}
	}
}