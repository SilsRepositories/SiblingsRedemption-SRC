image_index = 0;
if place_meeting(x, y, obj_Phase4_Soul) {
	image_index = 1;
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
		audio_play_sound(Slash, 0, false);
		slice = instance_create_depth(320, 80, -1000000, obj_Slice);
		slice.alarm[0] = 45;
		obj_CharaMonster_Phase4.alarm[3] = 60;
		instance_destroy();
	}
}