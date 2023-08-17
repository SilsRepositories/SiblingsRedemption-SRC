if place_meeting(x, y, obj_Phase4_Soul) {
	if image_index == 0
		audio_play_sound(MenuMove, 0, false);
	image_index = 1;
	
	// Triggers a slash when clicked
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		instance_destroy();
		audio_play_sound(Slash, 0, false);
		slice = instance_create_depth(427, 170, -10, obj_Slice);
		obj_Phase4_Soul.alp = 0;
		slice.alarm[0] = 45;
		obj_CharaMonster_A_Finale.alarm[1] = 60;
	}
}
else {
	image_index = 0;
}
x = lerp(x, TrueX, 0.2);
y = lerp(y, TrueY, 0.2);