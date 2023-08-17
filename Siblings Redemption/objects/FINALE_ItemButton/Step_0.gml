if place_meeting(x, y, obj_Phase4_Soul) {
	if image_index == 0
		audio_play_sound(MenuMove, 0, false);
	image_index = 1;
	
	// Heals the player when clicked
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		instance_destroy();
		repeat 3
			audio_play_sound(Heal, 0, false);
		global.soul7_HP += 40;
		if global.soul7_HP > global.soul7_MaxHP {
			global.soul7_HP = global.soul7_MaxHP;
		}
	}
}
else {
	image_index = 0;
}
x = lerp(x, TrueX, 0.2);
y = lerp(y, TrueY, 0.2);