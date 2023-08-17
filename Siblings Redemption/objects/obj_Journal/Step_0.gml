if pag > 1 && keyboard_check_pressed(vk_left) {
	pag -= 1;
	audio_play_sound(PAGE, 0, false);
	alp = 1;
}
if pag < 7 && keyboard_check_pressed(vk_right) {
	pag += 1;
	audio_play_sound(PAGE, 0, false);
	alp = 1;
}
if keyboard_check_pressed(ord("X")) {
	audio_stop_all();
	room_goto(Room_MainMenu);
}
image_angle = sin(siner) * 3;
y = 240 + (alp * 10);
siner += 0.004;