if global.Menu == 4 {
	// Draws the text in the upper left corner of the screen
	draw_set_font(font_battleui_hp);
	draw_set_color(c_grey);
	draw_text(4, 4, "PRESS X TO GO BACK");
	
	// Draws the book itself
	draw_self();
	
	// Opens the file to check the achievement list and change the Completion Status value
	ini_open("file0");
	var tasks = 17;
	var done = 0;

	// Switch between pages
	if keyboard_check_pressed(vk_left) && Page == 2 {
		Page = 1;
		audio_play_sound(PAGE, 0, false);
	}
	else if keyboard_check_pressed(vk_right) && Page == 1 {
		Page = 2;
		audio_play_sound(PAGE, 0, false);
	}
	
	if instance_exists(obj_MenuHandler) {
		// Has the player beaten Phase 4?
		if obj_MenuHandler.Unlock > 4 {
			// Draws the navigation arrow
			draw_sprite_ext(arrow, 0, 320, 0, (Page == 1 ? -1 : 1), 1, 0, c_white, 1);
			
			// Navigation to the Journal menu
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
	
	// Achievement checking, this is all done on a single page to get the Completion Status value
	switch Page {
		case 1:
			image_index = 0;
			// Mercy ending
			if ini_read_real("achievements", "ach0", 0) == 1 {
				draw_sprite_ext(tick, 0, 500, 124, 1, 1, 0, c_white, 1);
				done += 1;
			}
			// Genocide ending
			if ini_read_real("achievements", "ach1", 0) == 1 {
				draw_sprite_ext(tick, 0, 500, 188, 1, 1, 0, c_white, 1);
				done += 1;
			}
			// True ending
			if ini_read_real("achievements", "ach9", 0) == 1 {
				draw_sprite_ext(tick, 0, 500, 252, 1, 1, 0, c_white, 1);
				done += 1;
			}
	
			// Phase progression also counts to Completion Status
			for (var j = 1; j < 8; j++) {
				if ini_read_real("phaseprogress", "phase" + string(j), 0) == 1 {
					done += 1;
				}
			}
	
			// Phases 1-4 no heal and no hit check marks
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

			// No Heal and No Hit in one run (phase 1-4)
			if ini_read_real("achievements", "ach2", 0) == 1 {
				draw_sprite_ext(tick, 0, 217, 435, 1, 1, 0, c_white, 1);
				done += 1;
			}
			if ini_read_real("achievements", "ach3", 0) == 1 {
				draw_sprite_ext(tick, 0, 284, 435, 1, 1, 0, c_white, 1);
				done += 1;
			}

			// No Heal (phase 5-7)
			if ini_read_real("achievements", "ach10", 0) == 1 {
				done += 1;
			}
			// No Hit (phase 5-7)
			if ini_read_real("achievements", "ach11", 0) == 1 {
				done += 1;
			}

			// No Heal (all 7 phases)
			if ini_read_real("achievements", "ach12", 0) == 1 {
				done += 1;
			}
			// No Hit (all 7 phases)
			if ini_read_real("achievements", "ach13", 0) == 1 {
				done += 1;
			}

			// Draws the Completion Status value in the appropriate font, maximum 176% for completing all achievements
			draw_set_font(font_book);
			draw_set_color(c_black);
			
			// Changing alignment so that it can be central, the variable is temporary so it can be changed back later
			var fa = draw_get_halign();
			draw_set_halign(fa_center);
			draw_text_transformed(445, 383, string(floor((done / tasks) * 100)) + "%", 1.5, 2, 0);
			draw_set_halign(fa);
			break;
		case 2:
			image_index = 1;
			// Phases 5-7 no heal and no hit check marks
			for (var i = 1; i < 4; i++) {
				if ini_read_real("noheal", "noheal" + string(i + 4), 0) == 1 {
					draw_sprite_ext(tick, 0, 217, 118 + (64 * i), 1, 1, 0, c_white, 1);
				}
				if ini_read_real("nohit", "nohit" + string(i + 4), 0) == 1 {
					if i < 5
						draw_sprite_ext(tick, 0, 284, 118 + (64 * i), 1, 1, 0, c_white, 1);
				}
			}

			// No Heal (phases 5-7)
			if ini_read_real("achievements", "ach10", 0) == 1 {
				draw_sprite_ext(tick, 0, 217, 370, 1, 1, 0, c_white, 1);
			}
			// No Hit (phases 5-7)
			if ini_read_real("achievements", "ach11", 0) == 1 {
				draw_sprite_ext(tick, 0, 284, 370, 1, 1, 0, c_white, 1);
			}

			// No Heal (all 7 phases in one run)
			if ini_read_real("achievements", "ach12", 0) == 1 {
				draw_sprite_ext(tick, 0, 217, 435, 1, 1, 0, c_white, 1);
			}
			// No Hit (all 7 phases in one run)
			if ini_read_real("achievements", "ach13", 0) == 1 {
				draw_sprite_ext(tick, 0, 284, 435, 1, 1, 0, c_white, 1);
			}
			break;
	}

	ini_close();
}