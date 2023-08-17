if (global.InvFrames <= 0) {
	if (image_blend == c_aqua && !keyboard_check(vk_left) && !keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_right)) {
		exit;
	}
	if (image_blend == c_orange && (keyboard_check(vk_left) || keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_right))) {
		exit;
	}
	audio_play_sound(Hurt, 1, false);
	global.InvFrames = 30;
	global.NoHit = false;
	global.FG_Hits += 1;
	var damage = 4;
	if (damage < 1)
		damage = 1;
	if (image_blend == c_red && global.EnemyGroup == 1) {
		if obj_CharaMonster_Phase1.Taunted {
			room_goto(Room_GameOver);
			exit;
		}
	}
	global.PlayerHP -= damage;
	if (global.PlayerHP < 1 && global.Karma > 1) {
		global.PlayerHP = 1;
		global.Karma -= damage;
	}
	if (global.PlayerHP <= 0) {
		global.PlayerHP = 0;
		room_goto(Room_GameOver);
	}
}
if (disocon) {
	instance_destroy();
}