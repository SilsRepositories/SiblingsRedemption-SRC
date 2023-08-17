if (Words > 0) {
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		audio_stop_sound(CurrentDia);
		VoiceLine += 1;
		CurrentDia = asset_get_index("p7v" + string(VoiceLine));
		Words -= 1;
		if Words > 0
			repeat 2
				audio_play_sound(CurrentDia, 0, false, 2);
		WA = 0;
	}
	if !WordConfirm {
		CurrentDia = asset_get_index("p7v" + string(VoiceLine));
		WordConfirm = true;
		repeat 2
			audio_play_sound(CurrentDia, 0, false, 2);
	}
}
global.soulInv -= 0.7;
if global.soulInv < 0 {
	global.soulInv = 0;
}
obj_BattleEffects.CMAB = lerp(obj_BattleEffects.CMAB, 1, 0.06);
if VoiceLine > 3 {
	col += 1;
	if (col > 255) {
		col = 255;
	}
	image_blend = make_color_rgb(col, col, col);
}
if (Words == 0 || global.coward) {	
	if global.coward {
		audio_stop_all();
		VoiceLine = 5;
		if global.P7Checkpoint > 0 {
			global.NoHit = false;
			global.NoHeal = false;
		}
		if global.P7Checkpoint == 1 {
			VoiceLine = 8;
			Stage = 3;
		}
		if global.P7Checkpoint == 2 {
			VoiceLine = 13;
			Stage = 6;
			instance_destroy(obj_Phase4_Soul);
			slas = instance_create_depth(427, 380, 0, obj_CharaSlash_End);
			slas.Dir = 90;
			slas.Timer = 1;
			SoulLeft = instance_create_depth(427, 380, 0, obj_Phase4_Soul);
			SoulLeft.FinaleSoul = 1;
			SoulRight = instance_create_depth(427, 380, 0, obj_Phase4_Soul);
			SoulRight.FinaleSoul = 2;
		}
	}
	global.coward = false;
	WordConfirm = false;
	Words = -1;
	Stage += 1;
	Timer = 0;
	if Stage < 8 {
		audio_stop_sound(CurrentMus);
		switch Stage {
			case 2:
				CurrentMus = p71;
				break;
			case 4:
				CurrentMus = p73;
				break;
			case 7:
				CurrentMus = p75;
				break;
		}
		audio_play_sound(CurrentMus, 1, false, 0.9, 0);
		if !instance_exists(obj_Phase4_Soul)
			instance_create_depth(427, 290, 0, obj_Phase4_Soul);
	}
}

switch Stage {
	case 2:
		TargetAlph = 0.8;
		if abs(audio_sound_get_track_position(CurrentMus) - (Timer / 60)) > 0.1 {
			audio_sound_set_track_position(CurrentMus, (Timer / 60));
		}
		if (Timer == 0) {
			obj_BattleEffects.CMAB = 3;
			trueXS = 1;
			trueYS = 1;	
			obj_Phase4_Soul.alp = 1;
		}
		Timer += 1;
		if (Timer == 20) {
			FINALE_Stab(0, "LEFT");
			FINALE_Stab(0, "DOWN");
		}
		if (Timer == 120) {
			FINALE_Stab(0, "RIGHT");
			FINALE_Stab(0, "UP");
		}
		if (Timer == 220) {
			FINALE_Spin1(200, 240, false);
		}
		if (Timer == 330) {
			FINALE_Spin1(654, 240, false);
		}
		if (Timer == 440) {
			FINALE_Spin1(200, 100, false);
			FINALE_Spin1(654, 380, false);
		}
		if (Timer == 450) {
			trueXS = 2;
			trueYS = 2;
		}
		if (Timer >= 550 && Timer < 650) {
			trueX += 8;
		}
		if (Timer == 650) {
			FINALE_Stab(0, "UP");
		}
		if (Timer == 710) {
			FINALE_Stab(0, "DOWN");
		}
		if (Timer == 770) {
			FINALE_Stab(0, "LEFT");
		}
		if (Timer == 830) {
			FINALE_Stab(0, "RIGHT");
		}
		if (Timer >= 890 && Timer < 1130 && Timer % 60 == 0) {
			FINALE_Spin1(0, 0, true);
		}
		if (Timer == 1210) {
			FINALE_Stab(0, "LEFT");
			FINALE_Spin1(754, 240, false);
		}
		if (Timer == 1300) {
			FINALE_Stab(0, "RIGHT");
			FINALE_Spin1(100, 240, false);
		}
		if (Timer == 1400) {
			trueX = 427;
			trueY = 160;
			trueXS = 2;
			trueYS = 2;
		}
		if (Timer >= 1500 && Timer <= 1900) {
			if (Timer % 100 == 0) {
				FINALE_Spin1(random(854), random(480), false);
			}
		}
		if (Timer > 1900 && Timer <= 2300) {
			if Timer % 80 == 0 {
				var heig = random(280);
				FINALE_Claw(880, 580 + heig, -90, -6, 0);
				FINALE_Claw(880, -460 + heig, 90, -6, 0);
			}
		}
		if (Timer == 2400) {
			FINALE_Stab(0, "LEFT");
			FINALE_Stab(0, "RIGHT");
			FINALE_Spin1(100, 100, false);
			FINALE_Spin1(754, 380, false);
		}
		if (Timer == 2626) {
			Words = 3;
			Stage += 1;
			obj_Phase4_Soul.alp = 0;
			audio_stop_sound(CurrentMus);
			CurrentMus = p72;
			audio_play_sound(CurrentMus, 1, true, 1, 0);
			if !NoHeal && !global.nohitmode {
				SetChaText("CHECKPOINT 1 REACHED");
				global.P7Checkpoint = 1;
			}
		}
		break;
	case 4:
		if abs(audio_sound_get_track_position(CurrentMus) - (Timer / 60)) > 0.1 {
			audio_sound_set_track_position(CurrentMus, (Timer / 60));
		}
		if (Timer == 0) {
			obj_BattleEffects.CMAB = 3;
			if !NoHeal {
				global.soul7_HP += 150;
				global.NoHeal = false;
			}
			if global.soul7_HP > global.soul7_MaxHP {
				global.soul7_HP = global.soul7_MaxHP;
			}
			BGCol = c_purple;
			TargetAlph = 0.5;
			audio_play_sound(Heal, 0, false);
			instance_destroy(obj_Phase4_Soul);
			slas = instance_create_depth(427, 380, 0, obj_CharaSlash_End);
			slas.Dir = 90;
			slas.Timer = 1;
			SoulLeft = instance_create_depth(427, 380, 0, obj_Phase4_Soul);
			SoulLeft.FinaleSoul = 1;
			SoulRight = instance_create_depth(427, 380, 0, obj_Phase4_Soul);
			SoulRight.FinaleSoul = 2;
			window_mouse_set(427, 380);
			if window_get_fullscreen() {
				window_mouse_set(window_get_width() / 2, window_get_height() * 0.7916);
			}
			SetNotifText("USE THE MOUSE TO GUIDE THE WHITE HALF           ");
			trueXS = 0.5;
			trueYS = 0.5;	
		}
		Timer += 1;
		if (Timer >= 200 && Timer % 100 == 0 && Timer < 1300) {
			var heig = random(210);
			FINALE_Claw(0 - heig, -80, 180, 0, 5);
			FINALE_Claw(1064 - heig, -80, 0, 0, 5);
		}
		if (Timer >= 200 && Timer % 200 == 0 && Timer < 1400) {
			FINALE_Spin1(choose(50, 804), 240, false);
		}
		if (Timer == 1317) {
			FINALE_Spin2(427, 240);
		}
		if (Timer >= 1400 && Timer % 100 == 0 && Timer < 2400) {
			MakeCSlash(global.SoulX, global.SoulY, random(360));
		}
		if (Timer >= 1900 && Timer % 150 == 0 && Timer < 2400) {
			FINALE_Spin1(choose(50, 804), choose(50, 430), false);
		}
		if (Timer == 2400) {
			FINALE_Spinner2.SendOff = true;	
		}
		if (Timer == 2534) {
			trueXS = 1;
			trueYS = 1;
		}
		if (Timer == 2634) {
			Stage += 1;
		}
		BGSpeed += 0.008;
		break;
	case 5:
		TargetAlph = 1;
		if abs(audio_sound_get_track_position(CurrentMus) - (Timer / 60)) > 0.1 {
			audio_sound_set_track_position(CurrentMus, (Timer / 60));
		}
		Timer += 1;
		if ((Timer > 2600 && Timer < 3951) && Timer % 72 == 0) {
			audio_play_sound(NEOW, 0, false);
			instance_create_depth(x, y, 0, FINALE_Stabber2);
			trueX = obj_Phase4_Soul.x;
		}
		if (Timer == 3951) {
			trueXS = 2;
			trueYS = 2;
			trueX = 427;
			trueY = 160;
		}
		if (Timer > 3951 && Timer < 5500) {
			if Timer % 130 == 0 {
				audio_play_sound(NEOW, 0, false);
				instance_create_depth(x, y, 0, FINALE_Stabber2);
			}
			if Timer % 130 == 65 {
				with obj_Phase4_Soul
					MakeCSlash(x, y, random(360));
			}
		}
		if (Timer == 5597) {
			Stage += 1;
			audio_stop_sound(CurrentMus);
			CurrentMus = p74;
			audio_play_sound(CurrentMus, 1, true, 1, 0);
			TargetAlph = 0.2;
			instance_create_depth(427, 520, -100, FINALE_FightButton);
			if !NoHeal && !global.nohitmode {
				SetChaText("CHECKPOINT 2 REACHED");
				global.P7Checkpoint = 2;
			}
		}
		break;
	case 7:
		if abs(audio_sound_get_track_position(CurrentMus) - (Timer / 60)) > 0.1 {
			audio_sound_set_track_position(CurrentMus, (Timer / 60));
		}
		if (Timer == 0) {
			BGSpeed = 24;
			obj_BattleEffects.CMAB = 3;
			if !NoHeal {
				global.soul7_HP += 150;
				global.NoHeal = false;
			}
			if global.soul7_HP > global.soul7_MaxHP {
				global.soul7_HP = global.soul7_MaxHP;
			}
			audio_play_sound(Heal, 0, false);
			obj_Phase4_Soul.alp = 1;
			TargetAlph = 1;
			BGCol = c_orange;
			trueXS = 0;
			trueYS = 0;
		}
		if (Timer % 10 == 0 && Timer < 100) {
			MakeCSlash(global.SoulX, global.SoulY, random_range(85, 95));
		}
		if (Timer == 160) {
			FINALE_Stab(0, "UP");
			FINALE_Stab(0, "LEFT");
		}
		if (Timer == 210) {
			FINALE_Spin1(100, 100, false);
			FINALE_Spin1(754, 100, false);
			FINALE_Spin1(100, 380, false);
			FINALE_Spin1(754, 380, false);
		}
		if (Timer == 300) {
			FINALE_Spin2(-100, 240);
			FINALE_Spin2(954, 240);
		}
		if (Timer % 60 == 0 && Timer >= 300 && Timer < 600) {
			FINALE_Stab(0, obj_Phase4_Soul.y < 240 ? "UP" : "DOWN");
		}
		if (Timer % 30 == 0 && Timer >= 600 && Timer < 900) {
			MakeCSlash(global.SoulX, global.SoulY, random_range(-5, 5));
		}
		if (Timer == 930) {
			with (FINALE_Spinner2)
				SendOff = true;
		}
		if (Timer == 960) {
			for (var i = 0; i < 10; i++) {
				MakeCSlash((90 * i), 0, 90);
			}
		}
		if (Timer == 990) {
			for (var i = 0; i < 10; i++) {
				MakeCSlash(45 + (90 * i), 0, 90);
			}
		}
		if (Timer == 1120) {
			FINALE_Stab(0, "DOWN");
			FINALE_Stab(0, "RIGHT");
		}
		if (Timer == 1190) {
			trueXS = 1;
			trueYS = 1;
		}
		if (Timer == 1340) {
			audio_play_sound(snd_shakerbreaker, 0, false);
			var RN = random(360);
			for (var i = 0; i < 8; i++) {
				stab3 = instance_create_depth(x, y, 0, FINALE_Stabber3);
				stab3.direction = (45 * i) + RN;
			}
		}
		if Timer == 1420 {
			FINALE_Claw(880, 760, -90, -8, 2);
			FINALE_Claw(880, -280, 90, -8, 2);
		}
		if Timer == 1440 {
			FINALE_Claw(880, 720, -90, -8, 2);
			FINALE_Claw(880, -320, 90, -8, 2);
		}
		if Timer == 1460 {
			FINALE_Claw(880, 680, -90, -8, 2);
			FINALE_Claw(880, -360, 90, -8, 2);
		}
	
		if Timer == 1520 {
			FINALE_Claw(-40, 680, -90, 8, -2);
			FINALE_Claw(-40, -360, 90, 8, -2);
		}
		if Timer == 1540 {
			FINALE_Claw(-40, 720, -90, 8, -2);
			FINALE_Claw(-40, -320, 90, 8, -2);
		}
		if Timer == 1560 {
			FINALE_Claw(-40, 760, -90, 8, -2);
			FINALE_Claw(-40, -280, 90, 8, -2);
		}
	
		if Timer == 1660 {
			audio_play_sound(snd_spearrise, 0, false);
			FINALE_Claw(880, 720, -90, -14, 0);
			FINALE_Claw(-40, -240, 90, 14, 0);
		}
		if Timer == 1720 {
			audio_play_sound(snd_spearrise, 0, false);
			FINALE_Claw(880, -240, 90, -14, 0);
			FINALE_Claw(-40, 720, -90, 14, 0);
		}
		if (Timer == 1820) {
			audio_play_sound(snd_shakerbreaker, 0, false);
			var RN = 45;
			for (var i = 0; i < 8; i++) {
				stab3 = instance_create_depth(x, y, 0, FINALE_Stabber3);
				stab3.direction = (45 * i) + RN;
				stab3.speed = 6;
			}
		}
		if (Timer >= 1900 && Timer <= 2150) {
			if Timer % 8 == 0 {
				var heig = sin(Timer / 40) * 200;
				FINALE_Claw(880, 810 + heig, -90, -10, 0);
				FINALE_Claw(880, -280 + heig, 90, -10, 0);
			}
		}
		if (Timer >= 2250 && Timer <= 2500) {
			if Timer % 8 == 0 {
				var heig = sin(Timer / 40) * 200;
				FINALE_Claw(-40, 810 + heig, -90, 10, 0);
				FINALE_Claw(-40, -280 + heig, 90, 10, 0);
			}
		}
		if (Timer == 2580) {
			trueXS = 2;
			trueYS = 2;
			trueX = 427;
			trueY = 160;
		}
		if (Timer > 2580 && Timer < 3000 && Timer % 60 == 0) {
			MakeCSlash(global.SoulX, global.SoulY, random(360));
			MakeCSlash(global.SoulX, global.SoulY, random(360));
			MakeCSlash(global.SoulX, global.SoulY, random(360));
		}
		if (Timer == 3100) {
			FINALE_Spin2(-50, 240);
			FINALE_Spin2(904, 240);
		}
		if (Timer > 3100 && Timer < 3900 && Timer % 60 == 0) {
			MakeCSlash(global.SoulX, global.SoulY, random(360));
		}
		if (Timer == 3954) {
			with (FINALE_Spinner2) {
				SendOff = true;
			}
			trueXS = 1;
			trueYS = 1;
			trueX = 427;
			trueY = 100;
		}
		if (Timer >= 4110 && Timer < 5100 && Timer % 72 == 0) {
			MakeCSlash(global.SoulX, global.SoulY, random_range(-5, 5));
			FINALE_Claw(880, 720, -90, -5, 0);
			FINALE_Claw(-40, -240, 90, 4, 0);
		}
		Timer += 1;
		if (Timer == 5438) {
			with (FINALE_Spinner2) {
				SendOff = true;
			}
			Stage += 1;
			audio_stop_sound(CurrentMus);
			CurrentMus = p76;
			audio_play_sound(CurrentMus, 1, true, 1, 0);
			TargetAlph = 0;
			instance_create_depth(427, 520, -100, FINALE_FightButton);
		}
		break;
	case 8:
		if (alarm[1] > 0) {
			Stage = 8.1;
			audio_play_sound(NEOW, 0, false);
			trueY = 1000;
		}
		break;
	case 8.1:
		if (Words > 0) {
			instance_create_depth(0, 0, -100, FINALE_ActButton);
			Stage = 8.2;
		}
		break;
	case 8.2:
		trueXS = 2;
		trueYS = 2;
		obj_Phase4_Soul.alp = 1;
		if (Words != -1) {
			obj_Phase4_Soul.x = 427;
			obj_Phase4_Soul.y = 320;
		}
		break;
	case 9.3:
		if (Timer == 1) {
			audio_play_sound(snd_grab, 0, false);
			obj_BattleEffects.CMAB = 2;
			trueX = 80;
		}
		if (Timer == 61) {
			obj_BattleEffects.CMAB = 5;
			audio_play_sound(NEOW, 0, false);
			trueX = 427;
			FINALE_ActButton.TrueX = 2000;
		}
		if (Timer == 91) {
			VoiceLine = 15;
			Words = 5;
			Stage = 8.4;
		}
		Timer += 1;
		break;
	case 9.4:
		Stage = 9;
		Timer = 0;
		audio_stop_sound(CurrentMus);
		CurrentMus = p78;
		audio_play_sound(CurrentMus, 1, true, 1, 0);
		TargetAlph = 1;
		BGCol = c_maroon;
		trueXS = 1;
		trueYS = 1;
		break;
	case 9:
		if (Timer == 0) {
			BGSpeed = 20;
			audio_play_sound(Heal, 0, false);
			obj_BattleEffects.CMAB = 3;
			if !NoHeal {
				global.soul7_HP += 200;
				global.NoHeal = false;
			}
			if global.soul7_HP > global.soul7_MaxHP {
				global.soul7_HP = global.soul7_MaxHP;
			}
			audio_play_sound(snd_jump, 0, false);
			obj_Phase4_Soul.FinaleSoul = 0;
		}
		if (Timer > 0) {
			obj_Phase4_Soul.x = 427;
			obj_Phase4_Soul.y = 380;
			obj_Phase4_Soul.image_angle = lerp(obj_Phase4_Soul.image_angle, 180, 0.2);
		}
		if (Timer == 100) {
			Stage += 1;
			Timer = 0;
			obj_Phase4_Soul.image_angle = 180;
			instance_create_depth(0, 0, -10000, obj_HitFlash);
			audio_play_sound(Ping, 0, false);
			audio_play_sound(mus_sfx_spellcast, 0, false);
		}
		Timer += 1;
		break;
	case 10:
		if Timer % 15 == 0 {
			Shot = instance_create_depth(obj_Phase4_Soul.x, obj_Phase4_Soul.y, 0, obj_Soul_Shot);
			Shot.vspeed = -10;
		}
		if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
			Can = true;
			audio_play_sound(snd_chargeshot_charge, 0, true);
		}
		if keyboard_check(ord("Z")) || keyboard_check(vk_enter) && Can {
			Charge += 0.02;
			if Charge > 1
				Charge = 1;
			if !audio_is_playing(snd_chargeshot_charge)
				audio_play_sound(snd_chargeshot_charge, 0, false);
			audio_sound_pitch(snd_chargeshot_charge, Charge);
		}
		if keyboard_check_released(ord("Z")) || keyboard_check_released(vk_enter) {
			Can = false;
			if Charge < 1 {
				Shot = instance_create_depth(obj_Phase4_Soul.x, obj_Phase4_Soul.y, 0, obj_Soul_Shot);
				Shot.vspeed = -10;
				audio_play_sound(Shoot, 0, false);
			}
			else {
				Shot = instance_create_depth(obj_Phase4_Soul.x, obj_Phase4_Soul.y, 0, obj_Soul_Shot);
				Shot.vspeed = -3;
				Shot.friction = -0.5;
				Shot.big = true;
				Shot.sprite_index = BIGSHOT;
				Shot.image_angle = 90;
				Shot.image_xscale = 0.2;
				Shot.image_yscale = 0.2;
				audio_play_sound(snd_chargeshot_fire, 0, false);
			}
			audio_stop_sound(snd_chargeshot_charge);
			Charge = 0;
		}
		if (Timer == 0) {
			obj_Phase4_Soul.image_blend = c_yellow;
			obj_Phase4_Soul.image_angle = 180;
			audio_play_sound(Heal, 0, false);
			if !NoHeal
				global.soul7_HP += 400;
			if global.soul7_HP > global.soul7_MaxHP {
				global.soul7_HP = global.soul7_MaxHP;
			}
		}
		if (Timer % 300 == 0) {
			audio_play_sound(snd_shakerbreaker, 0, false);
			var RN = random(360);
			for (var i = 0; i < 8; i++) {
				stab3 = instance_create_depth(x, y, 0, FINALE_Stabber3);
				stab3.direction = (45 * i) + RN;
			}
		}
		if (Timer % 300 == 100) {
			trueX = random(854);
			audio_play_sound(NEOW, 0, false);
			instance_create_depth(x, y, 0, FINALE_Stabber2);
		}
		if (Timer % 300 == 70) {
			MakeCSlash(427 + sin(Timer) * 247, 240, random_range(85, 95));
		}
		if (Timer % 300 == 200) {
			FINALE_Spin1(choose(100, 754), choose(100, 540), false);
		}
		if (Timer % 1800 == 1799) {
			if !instance_exists(FINALE_ItemButton) {
				instance_create_depth(427, -100, 0, FINALE_ItemButton);
			}
		}
		Timer += 1;
		break;
	case 12:
		audio_stop_sound(CurrentMus);
		CurrentMus = p79;
		audio_play_sound(CurrentMus, 1, false, 1);
		Stage = 13;
		Timer = 0;
		break;
	case 13:
		trueXS = 0;
		trueYS = 0;
		if (Timer == 0) {
			with (obj_SpeedrunTimer)
				Running = false;
				
			obj_Phase4_Soul.alp = 1;
			obj_Phase4_Soul.image_angle = 0;
		}
		obj_Phase4_Soul.x = 427;
		obj_Phase4_Soul.y = 240;
		if (Timer % 18 == 0 && Timer <= 144) {
			slas = instance_create_depth(427, 240, -10000, obj_CharaSlash_End);
			slas.Dir = random(360);
		}
		Timer += 1;
		if (Timer % 36 == 0 && Timer <= 180) {
			obj_BattleEffects.CMAB = 6;
			instance_create_depth(0, 0, -10000, obj_HitFlash);
			repeat 15 {
				shard = instance_create_depth(427, 240, -100, obj_GameOver_SoulBit);
				shard.hspeed = random_range(-5, 5);
				shard.vspeed = random_range(-7, 1);
				shard.gravity = 0.2;
				shard.sprite_index = Soul_Bit;
			}
		}
		if (Timer == 180) {
			repeat 80 {
				shard = instance_create_depth(427, 240, -100, obj_GameOver_SoulBit);
				shard.hspeed = random_range(-12, 12);
				shard.vspeed = random_range(-9, 7);
				shard.image_xscale = 2;
				shard.image_yscale = 2;
				shard.gravity = random(0.3);
				shard.sprite_index = Soul_Bit;
			}
			obj_Phase4_Soul.alp = 0;
			Stage = 14;
			Timer = 0;
		}
		break;
	case 14:
		Timer += 1;
		if (Timer == 300) {
			if global.NoHit
				SetChaText("WELL YOU GOT HIT ANYWAY\nSO I'M TAKING IT AWAY FROM YOU");
		}
		if (Timer == 600) {
			if global.NoHit
				SetChaText("JUST KIDDING");
		}
		if (Timer == 720) {
			if global.NoHit
				SetChaText("YOU'RE FUCKING INSANE BUT WELL DONE");
		}
		if (Timer > 1200) {
			UnlockAchievement(9);
			UpdateSF(7, global.NoHeal, global.NoHit)
			room_goto(Room_Credits);
		}
		break;
}
if (Stage < 4) {
	if keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_rcontrol) {
		NoHeal = !NoHeal;
		if NoHeal {
			SetChaText("\nCHECKPOINTS DISABLED");
			SetNotifText("AUTO HEALS: OFF                                            ");
		}
		else {
			SetChaText("\nCHECKPOINTS ENABLED");
			SetNotifText("AUTO HEALS: ON                                             ");
		}
	}
}