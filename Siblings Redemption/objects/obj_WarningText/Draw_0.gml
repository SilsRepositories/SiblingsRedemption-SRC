draw_set_halign(fa_center);
draw_set_font(font_battle_dialogue_overworld);
if (timer < -160) {
	draw_sprite_ext(MyLogo, 0, 160, 120, 0.4, 0.4, sin(timer / 5) * (timer + 160), c_grey, abs((timer + 300) / 20));
}
if (timer >= -160 && timer < 0) {
	draw_sprite_ext(MyLogo, 0, 160, 120, 0.4, 0.4, 0, c_white, 1 - ((timer + 60) / 20));
	//draw_set_alpha(1 - ((timer + 60) / 20));
	//draw_text(160, 150, "GAMING PRESENTS");
	draw_set_alpha(1);
}
if !acknowledge
	timer += 1;
else
	timer -= 1;
if (timer < 0 && acknowledge) {
	room_goto(Room_Intro);
}
if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) && timer > 0 {
	if !acknowledge {
		acknowledge = true;
		audio_play_sound(Select, 0, false);
		if timer > 100
			timer = 100;
		
	}
}
if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) && timer < 0 {
	timer = 0;
	audio_stop_all();
}
draw_set_alpha((timer / 100));
draw_set_color(c_red);
draw_text_ext_transformed(160, 50, "WARNING", 1, 200, 3, 3, 0);
draw_set_color(c_white);
draw_text_ext_transformed(160, 100, "This game contains flashing images, as well as themes of horror and bloodshed, and as a result, may not be suitable for all audiences.\n\nViewer discretion is advised.", 14, 300, 1, 1, 0);
draw_set_color(c_maroon);
draw_text_ext_transformed(160, 220, "Press Z to confirm", 14, 300, 1, 1, 0);
draw_set_halign(fa_left);
draw_set_alpha(1);