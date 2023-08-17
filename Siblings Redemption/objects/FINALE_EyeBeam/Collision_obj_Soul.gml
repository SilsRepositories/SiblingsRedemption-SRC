if (image_alpha > 0.7) {
	if (global.soulInv <= 0) {
		if (image_blend == c_aqua && !keyboard_check(vk_left) && !keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_right)) {
			exit;
		}
		if (image_blend == c_orange && (keyboard_check(vk_left) || keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_right))) {
			exit;
		}
		global.soulInv = 10;
		audio_play_sound(Hurt, 1, false);
		global.soul7_HP -= 15;
		if (global.soul7_HP <= 0) {
			global.soul7_HP = 0;
			room_goto(Room_GameOver_Finale);
		}
	}
}