if (global.InvFrames <= 0) {
	audio_play_sound(Hurt, 1, false);
	global.InvFrames = 30;
	global.NoHit = false;
	global.PlayerHP -= (ceil(global.PlayerHP / 10) + 5);
	global.FG_Hits += 1;
	if (global.PlayerHP <= 0) {
		if (obj_CharaMonster_Phase4.Phase4Timer < 17100 || global.nohitmode) || obj_CharaMonster_Phase4.Heals <= 0 {
			global.PlayerHP = 0;
			room_goto(Room_GameOver_Phase4);
		}
		else {
			with obj_CharaMonster_Phase4
				event_user(15);
			global.NoHeal = false;
			obj_CharaMonster_Phase4.WhiteFlash = 1;
			audio_play_sound(Flash, 0, false);
			audio_play_sound(Gigatalk, 0, false, 1, 0, 1);
		}
	}
}