if global.Menu == 4 {
	draw_set_font(font_battleui_hp);
	draw_set_color(c_grey);
	draw_text(4, 4, "PRESS X TO GO BACK");
	draw_self();
	ini_open("file0");
	var tasks = 17;
	var done = 0;

	if keyboard_check_pressed(vk_left) && Page == 2 {
		Page = 1;
		audio_play_sound(PAGE, 0, false);
	}
	if instance_exists(obj_MenuHandler) {
		if obj_MenuHandler.Unlock > 4 {
			draw_sprite_ext(arrow, 0, 320, 0, (Page == 1 ? -1 : 1), 1, 0, c_white, 1);
			if keyboard_check_pressed(vk_right) && Page == 1 {
				Page = 2;
				audio_play_sound(PAGE, 0, false);
			}
			draw_set_color(c_lime);
			if mouse_x > 464 && mouse_y < 80 {
				draw_set_color(c_white);
				if mouse_check_button_pressed(mb_left) {
					audio_stop_all();
					room_goto(Room_Journal);
					audio_play_sound(snd_mysterygo, 0, false);
				}
			}
			draw_text(464, 4, "VIEW JOURNAL");
		}
	}

	switch Page {
		case 1:
			image_index = 0;
			if ini_read_real("achievements", "ach0", 0) == 1 {
				draw_sprite_ext(tick, 0, 500, 124, 1, 1, 0, c_white, 1);
				done += 1;
			}
			if ini_read_real("achievements", "ach1", 0) == 1 {
				draw_sprite_ext(tick, 0, 500, 188, 1, 1, 0, c_white, 1);
				done += 1;
			}
			if ini_read_real("achievements", "ach9", 0) == 1 {
				draw_sprite_ext(tick, 0, 500, 252, 1, 1, 0, c_white, 1);
				done += 1;
			}
	
			for (var j = 1; j < 8; j++) {
				if ini_read_real("phaseprogress", "phase" + string(j), 0) == 1 {
					done += 1;
				}
			}
	
			for (var i = 1; i < 8; i++) {
				if ini_read_real("noheal", "noheal" + string(i), 0) == 1 {
					if i < 5
						draw_sprite_ext(tick, 0, 217, 114 + (64 * i), 1, 1, 0, c_white, 1);
					done += 1;
				}
				if ini_read_real("nohit", "nohit" + string(i), 0) == 1 {
					if i < 5
						draw_sprite_ext(tick, 0, 284, 114 + (64 * i), 1, 1, 0, c_white, 1);
					done += 1;
				}
			}

			if ini_read_real("achievements", "ach2", 0) == 1 {
				draw_sprite_ext(tick, 0, 217, 435, 1, 1, 0, c_white, 1);
				done += 1;
			}
			if ini_read_real("achievements", "ach3", 0) == 1 {
				draw_sprite_ext(tick, 0, 284, 435, 1, 1, 0, c_white, 1);
				done += 1;
			}

			if ini_read_real("achievements", "ach10", 0) == 1 {
				done += 1;
			}
			if ini_read_real("achievements", "ach11", 0) == 1 {
				done += 1;
			}

			if ini_read_real("achievements", "ach12", 0) == 1 {
				done += 1;
			}
			if ini_read_real("achievements", "ach13", 0) == 1 {
				done += 1;
			}

			draw_set_font(font_book);
			draw_set_color(c_black);
			var fa = draw_get_halign();
			draw_set_halign(fa_center);
			draw_text_transformed(445, 383, string(floor((done / tasks) * 100)) + "%", 1.5, 2, 0);
			draw_set_halign(fa);
			break;
		case 2:
			image_index = 1;
			for (var i = 1; i < 4; i++) {
				if ini_read_real("noheal", "noheal" + string(i + 4), 0) == 1 {
					draw_sprite_ext(tick, 0, 217, 118 + (64 * i), 1, 1, 0, c_white, 1);
				}
				if ini_read_real("nohit", "nohit" + string(i + 4), 0) == 1 {
					if i < 5
						draw_sprite_ext(tick, 0, 284, 118 + (64 * i), 1, 1, 0, c_white, 1);
				}
			}

			if ini_read_real("achievements", "ach10", 0) == 1 {
				draw_sprite_ext(tick, 0, 217, 370, 1, 1, 0, c_white, 1);
			}
			if ini_read_real("achievements", "ach11", 0) == 1 {
				draw_sprite_ext(tick, 0, 284, 370, 1, 1, 0, c_white, 1);
			}

			if ini_read_real("achievements", "ach12", 0) == 1 {
				draw_sprite_ext(tick, 0, 217, 435, 1, 1, 0, c_white, 1);
			}
			if ini_read_real("achievements", "ach13", 0) == 1 {
				draw_sprite_ext(tick, 0, 284, 435, 1, 1, 0, c_white, 1);
			}
			break;
	}

	ini_close();
}