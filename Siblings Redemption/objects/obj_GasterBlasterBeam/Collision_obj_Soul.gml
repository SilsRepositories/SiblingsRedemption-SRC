if (image_alpha > 0.7 && !NoDamage) {
	if (global.InvFrames <= 0) {
		audio_play_sound(Hurt, 1, false);
		global.NoHit = false;
		global.FG_Hits += 1;
		var damage = 1;
		if (global.EnemyGroup != 3) {
			global.InvFrames = 1;
			global.PlayerHP -= 1;
		}
		else {
			global.InvFrames = 60;
			global.PlayerHP -= 10;
			damage = 20;
		}
		if (global.PlayerHP < 1 && global.Karma > 1) {
			global.PlayerHP = 1;
			global.Karma -= damage;
		}
		if (global.PlayerHP <= 0) {
			global.PlayerHP = 0;
			room_goto(Room_GameOver);
		}
	}
}