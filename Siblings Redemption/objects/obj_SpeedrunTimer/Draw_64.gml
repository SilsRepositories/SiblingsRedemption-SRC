if global.SpeedrunMode > 0 {
	draw_set_font(font_battleui_hp);
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle((room_width / 2) - 70, 0, (room_width / 2) + 70, 24, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	var ha = draw_get_halign();
	draw_set_halign(fa_center);
	if Running
		Time += (delta_time / 1000000);
	else {
		draw_set_color(c_red);
		if room == BattleRoom {
			audio_stop_all();
			room_goto(Room_MainMenu);
		}
	}
	var Minutes = floor(Time / 60);
	var Seconds = Time % 60;
	if Minutes < 10 {
		Minutes = "0" + string(Minutes);
	}
	if Seconds < 10 {
		Seconds = "0" + string(Seconds);
	}
	draw_text(room_width / 2, 3, string(Minutes) + ":" + string(Seconds));
	draw_set_halign(ha);
}