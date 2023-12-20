var _y = camera_get_view_y(view_camera[0]);
var _menuPos = 480;
// Gives a "fadeout" feel as the phases get darker the more you play
draw_set_alpha(_y < 480 ? (PhaseOffset / 4480) : 0);
draw_set_color(c_black);
draw_rectangle(-10, -10, 650, 480, false);
draw_set_alpha(1);

// Changes the volume to give off an eerie vibe that the game aims to achieve
audio_sound_gain(sr_phase4_preview, (PhaseOffset / 4480), 0);

// Plays a garbled voice over the hardest phases
if global.Choice == 3 && global.Menu == 1 {
	if !audio_is_playing(REBMA) {
		audio_play_sound(REBMA, 0, true);
	}
}
else {
	if global.Choice == 6 && global.Menu == 1 {
		if !audio_is_playing(Voice) {
			audio_play_sound(Voice, 0, true);
		}
	}
	else {
		audio_stop_sound(Voice);
	}
	audio_stop_sound(REBMA);
}

// Hides the book and old assets by default unless 
if instance_exists(obj_Book)
	obj_Book.visible = false;
if instance_exists(obj_SR_Old)
	obj_SR_Old.visible = false;

// Version number
draw_set_color(c_dkgray);
draw_text(20, 930, "V1.2.1");

// Makes the glitched colours very violent to add to the "impact" feel that the menu hopes to achieve
if siner == 0
	obj_BattleEffects.CMAB = 20;
siner += 0.02;

// Draws the silhouetted Chara
draw_sprite_ext(silCharaBody, 0, 520, 680 - (sin(siner)), 1, 1, 0, c_white, 1);
draw_sprite_ext(silCharaArmLeft, 0, 550, 682 - (sin(siner)), 1, 1, (sin(siner) * 5), c_white, 1);
draw_sprite_ext(silCharaArmRight, 0, 488, 674 - (sin(siner)), 1, 1, -(sin(siner) * 5), c_white, 1);

// Which menu are we on?
switch global.Menu {
	case 0:
		// Sets the menu volume back to normal since that changes in the phase selection menu
		audio_sound_gain(sr_menu, 1, 0);
		MenuLength = 5;
		break;
	case 1:
		// By default, the maximum phase that can be selected is phase 7, but if the player hasn't beat phase 4 yet that it doesn't allow access to phases 5-7
		MenuLength = 7;
		if Unlock < 5 {
			MenuLength = 4;
		}
		_menuPos = 0;
		
		// Picture display
		if PhaseOffset != (640 * global.Choice) {
			PhaseOffset += ((640 * global.Choice) - PhaseOffset) / 12;
		}
		audio_sound_gain(sr_menu, 0.5 - (PhaseOffset / 4480), 0);
		obj_BattleEffects.CMAB = global.Choice;
		
		// Changes the glitch effect to be less violent on the hardest phases
		if global.Choice == 3 {
			obj_BattleEffects.CMAB = 0.5;
		}
		if global.Choice == 6 {
			obj_BattleEffects.CMAB = 0;
		}
		
		// Displays the phases based on which one is selected and whether or not it has been unlocked
		for (var i = 1; i < 8; i++) {
			if Unlock >= i
				draw_sprite_ext(sp1, i - 1, ((640 * i) - PhaseOffset) - 320, 260, 0.8, 0.8, 0, (i <= Unlock ? c_white : c_black), (((i >= Unlock) * 0.5) + (global.Choice == (i - 1)) - abs(((640 * (i - 1)) - PhaseOffset) / 720)));
			draw_sprite_ext(star_0, 0, ((640 * i) - PhaseOffset) - 320, 40, 0.5, 0.5, 0, (i <= Unlock ? c_white : c_black), (((i >= Unlock) * 0.5) + (global.Choice == (i - 1)) - abs(((640 * (i - 1)) - PhaseOffset) / 720)));
			fa = draw_get_halign();
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			// The star that displays for when you do a challenge run on a phase
			// Silver is No Heal, Gold is No Hit
			if noheal[i - 1] && !nohit[i - 1] {
				draw_sprite_ext(star_0, 1, ((640 * i) - PhaseOffset) - 320, 40, 0.5, 0.5, 0, (i <= Unlock ? c_white : c_black), (((i >= Unlock) * 0.5) + (global.Choice == (i - 1)) - abs(((640 * (i - 1)) - PhaseOffset) / 720)));
				draw_text(((640 * i) - PhaseOffset) - 320, 70, "NO HEAL");
			}
			if nohit[i - 1] {
				draw_sprite_ext(star_0, 2, ((640 * i) - PhaseOffset) - 320, 40, 0.5, 0.5, 0, (i <= Unlock ? c_white : c_black), (((i >= Unlock) * 0.5) + (global.Choice == (i - 1)) - abs(((640 * (i - 1)) - PhaseOffset) / 720)));
				draw_text(((640 * i) - PhaseOffset) - 320, 70, "NO HIT");
			}
			if Unlock < i {
				draw_sprite_ext(Lock, 0, ((640 * i) - PhaseOffset) - 320, 260, 2, 2, 0, c_white, (0.5 + (global.Choice == (i - 1)) - abs(((640 * (i - 1)) - PhaseOffset) / 720)));
			}
			draw_set_halign(fa);
		}
		draw_set_halign(fa_right);
		draw_set_color(c_white);
		draw_set_font(font_phasemenu);
		fa = draw_get_halign();
		
		// Phase N in the middle
		draw_set_halign(fa_center);
		var text = "phase " + string(round((PhaseOffset / 640) + 1));
		draw_text_transformed(320, 410, text, 1, 1, 0);
		
		// Phase subtitle, I tried to be creative with them
		switch (text) {
			case "phase 1":	
				draw_text_transformed(320, 450, (Unlock >= 1 ? "confrontation" : "locked"), 0.5, 0.5, 0);
				break;
			case "phase 2":
				draw_text_transformed(320, 450, (Unlock >= 2 ? "fusion" : "locked"), 0.5, 0.5, 0);
				break;
			case "phase 3":
				draw_text_transformed(320, 450, (Unlock >= 3 ? "anomaly" : "locked"), 0.5, 0.5, 0);
				break;
			case "phase 4":
				draw_text_transformed(320, 450, (Unlock >= 4 ? "brute force" : "locked"), 0.5, 0.5, 0);
				break;
			case "phase 5":
				draw_text_transformed(320, 450, (Unlock >= 5 ? "void's fuel" : "locked"), 0.5, 0.5, 0);
				break;
			case "phase 6":
				draw_text_transformed(320, 450, (Unlock >= 6 ? "enigmatic emotions" : "locked"), 0.5, 0.5, 0);
				break;
			case "phase 7":
				draw_text_transformed(320, 450, (Unlock >= 7 ? "devil's last gamble" : "locked"), 0.5, 0.5, 0);
				break;
		}
		draw_set_halign(fa);
		draw_set_font(font_battleui_hp);
		if global.Choice == 6 || (MenuLength == 4 && global.Choice == 3)
			draw_set_color(c_black);
		draw_text(620, 450, "NEXT >");
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		if global.Choice == 0
			draw_set_color(c_black);
		draw_text(20, 450, "< PREV");
		break;
	case 2:
		// Options menu
		MenuLength = 4;
		_menuPos = 960;
		draw_set_font(font_battle_dialogue);
		draw_set_color(global.Choice == 0 ? c_white : c_gray);
		draw_text(20, 1130, "Flashing Lights: " + (global.antiEpilepsy ? "OFF" : "ON"));
		draw_set_color(global.Choice == 1 ? c_white : c_gray);
		draw_text(20, 1165, "No Hit: " + (!global.nohitmode ? "OFF" : "ON"));
		draw_set_color(global.Choice == 2 ? c_white : c_gray);
		draw_text(20, 1200, "Erase Sava Data (" + string(sure) + " Strikes)");
		draw_set_color(global.Choice == 3 ? c_white : c_gray);
	
		var SpeedrunCategory = "None";
		var SpeedrunText =  "Want to beat the siblings as fast as possible?\nGotta go fast!";
		switch global.SpeedrunMode {
			case 1:
				SpeedrunCategory = "Single phase";
				SpeedrunText =  "Want to will down a single phase?\nNo problem.";
				break;
			case 2:
				SpeedrunCategory = "Phases 1-4";
				SpeedrunText =  "Complete Normal Mode as fast as possible.\nPacifist ending in Phase 1 aborts the run.";
				break;
			case 3:
				SpeedrunCategory = "Phases 5-7";
				SpeedrunText =  "Complete Afterlife phases as fast as possible.\nGood luck to you!";
				// Prevents players from advancing to phases 5-7 if they haven't yet beaten phase 4
				if Unlock < 5
					global.SpeedrunMode = 4;
				break;
			case 4:
				SpeedrunCategory = "All phases";
				SpeedrunText =  "Complete the game from phase 1 to 7 as fast as possible.\nIt's a long one...";
				break;
		}
	
		draw_text(20, 1235, "Speedrun Mode: " + SpeedrunCategory);
		if global._b >= 4 {
			MenuLength = 5;
			draw_set_color(global.Choice == 4 ? c_white : c_gray);
			draw_text(20, 1270, "Gold Soul: " + (!global.GoldSoul ? "OFF" : "ON"));
		}
		draw_set_color(c_white);
		if (global.Choice == 0)
			draw_text_transformed(20, 1390, "Erratic glitched colours and blinking lights.\nTurn off for a smoother experience.", 0.5, 0.5, 0);
		else if (global.Choice == 1)
			draw_text_transformed(20, 1390, "Sets your HP to 1.\nQuicker resets on death.", 0.5, 0.5, 0);
		else if (global.Choice == 2)
			draw_text_transformed(20, 1390, "Start over from the beginning.\nThere is no going back if you do this.", 0.5, 0.5, 0);
		else if (global.Choice == 3)
			draw_text_transformed(20, 1390, SpeedrunText, 0.5, 0.5, 0);
		else if (global.Choice == 4)
			draw_text_transformed(20, 1390, "Congratulations, you are a master player.\nEnjoy your free reward.", 0.5, 0.5, 0);
		break;
	case 4:
		_menuPos = 0;
		// Displays the book
		if instance_exists(obj_Book)
			obj_Book.visible = true;
		break;
	case 5:
		_menuPos = 0;
		// Displays the old assets
		if instance_exists(obj_SR_Old)
			obj_SR_Old.visible = true;
		break;
}

obj_BattleEffects.CMAB *= 0.95;
obj_BattleEffects.dontRestrict = true;
_y += (_menuPos - camera_get_view_y(view_camera[0])) / 16;
camera_set_view_pos(view_camera[0], 0, _y);
if global.Choice != -1 {
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
		if global.Menu < 4 {
			audio_play_sound(Select, 0, false);
			obj_BattleEffects.CMAB = 10;
		}
		
		// Default HP, has to be defined or an HP of 0 or 100 will be displayed instead when doing a speedrun
		global.PlayerHP = 99;
		
		switch global.Menu {
			case 0:
				if (global.Choice == 0) {
					var IsSpeedrunning = false;
					var PhaseStart = 1;
					if global.SpeedrunMode == 2 || global.SpeedrunMode == 4 {
						PhaseStart = 1;
						IsSpeedrunning = true;
					}
					if global.SpeedrunMode == 3 {
						PhaseStart = 5;
						IsSpeedrunning = true;
					}
					if IsSpeedrunning {
						with (obj_SpeedrunTimer) {
							Running = true;
							Time = 0;
						}
						global.FG_Start = PhaseStart;
						global.EnemyGroup = PhaseStart;
						audio_stop_all();
						room_goto(BattleRoom);
					}
					global.Menu = 1;
				}
				if (global.Choice == 1)
					global.Menu = 2;
				if (global.Choice == 2) {
					audio_stop_all();
					room_goto(Room_Credits);
					global.FG_Start = -1;
					if Unlock > 4
						global.FG_Start = -2;
				}
				if (global.Choice == 3)
					global.Menu = 4;
				if (global.Choice == 4) {
					global.Menu = 5;
					obj_SR_Old.image_index = 0;
				}
				global.Choice = 0;
				break;
			case 1:
				// If this is set to anything other than 0 then the game will not display the right HP per phase
				global.PlayerHP = 0;
				if global.Choice <= (Unlock - 1) {
					with (obj_SpeedrunTimer) {
						Running = true;
						Time = 0;
					}
					global.FG_Start = 1 + global.Choice;
					global.EnemyGroup = 1 + (global.Choice * 0.5);
					if global.Choice == 2
						global.EnemyGroup = 3;
					if global.Choice == 3
						global.EnemyGroup = 4;
					if global.Choice == 4
						global.EnemyGroup = 5;
					if global.Choice == 5
						global.EnemyGroup = 6;
					if global.Choice != 6 {
						audio_stop_all();
						room_goto(BattleRoom);
					}
					else {
						audio_stop_all();
						room_goto(Room_Finale);
						global.EnemyGroup = 7;
					}
				}
				else {
					SetNotifText("FINISH PHASE " + string(global.Choice) + " TO UNLOCK!");
					audio_play_sound(snd_test, 0, false);
				}
				break;
			case 2:
				if global.Choice == 0 {
					ini_open("file0");
					global.antiEpilepsy = !global.antiEpilepsy;
					ini_write_real("settings", "antiepilepsy", global.antiEpilepsy);
					ini_close();
				}
				if global.Choice == 1 {
					ini_open("file0");
					global.nohitmode = !global.nohitmode;
					ini_write_real("settings", "nohitmode", global.nohitmode);
					ini_close();
				}
				// Deletes the save file
				if global.Choice == 2 {
					sure += 1;
					audio_play_sound(Gigatalk, 0, false);
					obj_BattleEffects.CMAB = 20;
					if (sure == 3) {
						file_delete("sdt");
						file_delete("file0");
						game_end();
					}
				}
				if global.Choice == 3 {
					global.SpeedrunMode += 1;
					if global.SpeedrunMode > 4 {
						global.SpeedrunMode = 0;
					}
				}
				// Gold Soul, only playable if the player has done a no-hit on phases 1-4 (doesn't have to be in one run)
				if global.Choice == 4
					global.GoldSoul = !global.GoldSoul;
				break;
			case 3:
				global.Menu = 0;
				global.Choice = 2;
				break;
		}
	}
	if keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_rshift) {
		if (global.Menu >= 1) {
			global.Choice = 0;
			global.Menu = 0;
			obj_SR_Old.image_index = 0;
			audio_resume_sound(sr_menu);
		}
	}
	if global.Menu == 0 || global.Menu == 2 {
		if keyboard_check_pressed(vk_up) {
			audio_play_sound(MenuMove, 0, false);
			global.Choice -= 1;
			if global.Choice < 0 {
				global.Choice = (MenuLength - 1);
			}
		}
		else if keyboard_check_pressed(vk_down) {
			audio_play_sound(MenuMove, 0, false);
			global.Choice += 1;
			if global.Choice >= MenuLength {
				global.Choice = 0;
			}
		}
	}
	else if global.Menu == 1 {
		if keyboard_check_pressed(vk_left) {
			audio_play_sound(MenuMove, 0, false);
			global.Choice -= 1;
			if global.Choice < 0 {
				global.Choice = (MenuLength - 1);
			}
		}
		if keyboard_check_pressed(vk_right) {
			audio_play_sound(MenuMove, 0, false);
			global.Choice += 1;
			if global.Choice >= MenuLength {
				global.Choice = 0;
			}
		}
	}
}
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(-100, -100, 740, 1060, false);
draw_set_alpha(1 - siner);
draw_set_color(c_white);
draw_rectangle(-100, -100, 740, 1060, false);
sprite_index = SRLogo;
x = lerp(x, 120, 0.05);
y = lerp(y, 518, 0.05);

// Changes the pitch of the music and the saturation factor down on the menu if the player is on phase 5, 6 or 7
if Unlock > 4 && Unlock < 8 {
	ai = 1;
	audio_sound_pitch(sr_menu, 0.25);
	var fx = layer_get_fx("Greyscaler");
	fx_set_parameter(fx, "g_Intensity", 1 - (abs(480 - camera_get_view_y(view_camera[0])) / 400));
	layer_set_fx("Greyscaler", fx);
}

// Logo
for (var i = 0; i < sprite_height; i++) {
	var glitchRNG = irandom_range(1, 300);
	var offset = 0.2;
	if (glitchRNG == 50) {
		offset += random_range(3, 90);
	}
	var cr = make_color_rgb(255 - (127 * alpha), 255 - (127 * alpha), 255 - (127 * alpha));
	draw_sprite_part_ext(sprite_index, ai, 0, i, sprite_width, 1, x - sprite_xoffset + random_range(-offset, offset), y - sprite_yoffset + (i * 2), 2, 2, cr, 1);
}

// Patch notes
if pa > 0 {
	draw_sprite_ext(_12_1, (pa - 1), 320, 720, 1, 1, 0, c_white, 1);
	if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))
		pa += 1;
	if pa == 3 {
		obj_BattleEffects.CMAB = 20;
		audio_play_sound(snd_mysterygo, 0, false);
		pa = 0;
		global.Choice = 0;
	}
}
alpha -= 0.01;
draw_set_alpha(1);
if alpha == 0.01 {
	if showNotes {
		obj_BattleEffects.CMAB = 20;
		audio_play_sound(snd_mysterygo, 0, false);
		pa = 1;
	}
	else
		global.Choice = 0;
}
if alpha <= 0
	alpha = 0;