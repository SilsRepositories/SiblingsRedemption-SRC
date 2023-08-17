var SoulSpeed = global.SoulSpeed;
if keyboard_check(ord("X")) || keyboard_check(vk_rshift) {
	global.SoulSpeed /= 2;
}
if !instance_exists(obj_SpeechBubble) {
	if Mode == SoulModes.Red || Mode == SoulModes.Yellow {
		if Mode == SoulModes.Red {
			sprite_index = Soul;
		}
		image_angle = 0;
		if keyboard_check(vk_left) || keyboard_check(ord("A")) {
			x -= global.SoulSpeed;
		}
		if keyboard_check(vk_right) || keyboard_check(ord("D")) {
			x += global.SoulSpeed;
		}
		if keyboard_check(vk_up) || keyboard_check(ord("W")) {
			y -= global.SoulSpeed;
		}
		if keyboard_check(vk_down) || keyboard_check(ord("S")) {
			y += global.SoulSpeed;
		}
	}

	if Mode == SoulModes.Blue {
		sprite_index = Soul_Blue;
		if image_angle % 180 == 0 {
			if keyboard_check(vk_left) || keyboard_check(ord("A"))
				x -= global.SoulSpeed;
			if keyboard_check(vk_right) || keyboard_check(ord("D"))
				x += global.SoulSpeed;
		}
		else {
			if keyboard_check(vk_up) || keyboard_check(ord("W"))
				y -= global.SoulSpeed;
			if keyboard_check(vk_down) || keyboard_check(ord("S"))
				y += global.SoulSpeed;
		}
	
		if image_angle == 0 {
			if keyboard_check(vk_up) || keyboard_check(ord("W")) {
				if BLUE_Jumped == 0 {
					BLUE_Gravity = -4;
				}
			}
			if keyboard_check_released(vk_up) || keyboard_check_released(ord("W")) {
				if BLUE_Gravity < 0 {
					BLUE_Gravity = 0;
				}
			}
			y += BLUE_Gravity;
			if (y >= (global.BoardFloor - 8)) {
				y = (global.BoardFloor - 8);
				if BLUE_Gravity >= 8 audio_play_sound(Impact, 20, false);
				BLUE_Jumped = 0;
				BLUE_Gravity = 0;
			}
			else {
				BLUE_Jumped = 1;
			}
		}
	
		if image_angle == 90 {
			if keyboard_check(vk_left) || keyboard_check(ord("A")) {
				if BLUE_Jumped == 0 {
					BLUE_Gravity = -4;
				}
			}
			if keyboard_check_released(vk_left) || keyboard_check_released(ord("A")) {
				if BLUE_Gravity < 0 {
					BLUE_Gravity = 0;
				}
			}
			x += BLUE_Gravity;
			if (x >= (global.BoardFloor - 8)) {
				x = (global.BoardFloor - 8);
				if BLUE_Gravity >= 8 audio_play_sound(Impact, 20, false);
				BLUE_Jumped = 0;
				BLUE_Gravity = 0;
			}
			else {
				BLUE_Jumped = 1;
			}
		}
	
		if image_angle == 180 {
			if keyboard_check(vk_down) || keyboard_check(ord("S")) {
				if BLUE_Jumped == 0 {
					BLUE_Gravity = -4;
				}
			}
			if keyboard_check_released(vk_down) || keyboard_check_released(ord("S")) {
				if BLUE_Gravity < 0 {
					BLUE_Gravity = 0;
				}
			}
			y -= BLUE_Gravity;
			if (y <= (global.BoardFloor + 8)) {
				y = (global.BoardFloor + 8);
				if BLUE_Gravity >= 8 audio_play_sound(Impact, 20, false);
				BLUE_Jumped = 0;
				BLUE_Gravity = 0;
			}
			else {
				BLUE_Jumped = 1;
			}
		}
	
		if image_angle == -90 {
			if keyboard_check(vk_right) || keyboard_check(ord("D")) {
				if BLUE_Jumped == 0 {
					BLUE_Gravity = -4;
				}
			}
			if keyboard_check_released(vk_right) || keyboard_check_released(ord("D")) {
				if BLUE_Gravity < 0 {
					BLUE_Gravity = 0;
				}
			}
			x -= BLUE_Gravity;
			if (x <= (global.BoardFloor + 8)) {
				x = (global.BoardFloor + 8);
				if BLUE_Gravity >= 8 audio_play_sound(Impact, 20, false);
				BLUE_Jumped = 0;
				BLUE_Gravity = 0;
			}
			else {
				BLUE_Jumped = 1;
			}
		}
	
		if BLUE_Gravity >= -6 && BLUE_Gravity < -0.8
			BLUE_Gravity += 0.14;
		if BLUE_Gravity >= -0.8 && BLUE_Gravity < 0.8
			BLUE_Gravity += 0.09;
		if BLUE_Gravity >= 0.8 && BLUE_Gravity < 2.5
			BLUE_Gravity += 0.07;
		if BLUE_Gravity >= 2.5 && BLUE_Gravity < 6
			BLUE_Gravity += 0.13;
	}

	if Mode == SoulModes.Green {
		image_angle = 0;
		sprite_index = Soul_Green;
		if instance_exists(obj_BulletGenerator) {
			global.BorderHeight = 80;
			global.BorderWidth = 80;
			obj_BulletBoard.current_offsety = -100;
			sprite_index = Soul_Green;
			x = 320;
			y = global.BoardFloor - (global.BorderHeight / 2);
			if !instance_exists(obj_Soul_Shield) {
				instance_create_depth(0, 0, 0, obj_Soul_Shield);
			}
		}
		else {
			if instance_exists(obj_Soul_Shield) {
				instance_destroy(obj_Soul_Shield);
			}
		}
	}

	if Mode == SoulModes.Yellow {
		sprite_index = Soul_Yellow;
		image_angle = 180;
		if instance_exists(obj_BulletGenerator) {
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
					Shot = instance_create_depth(x, y, 0, obj_Soul_Shot);
					Shot.vspeed = -10;
					audio_play_sound(Shoot, 0, false);
				}
				else {
					Shot = instance_create_depth(x, y, 0, obj_Soul_Shot);
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
		}
		else {
			if audio_is_playing(snd_chargeshot_charge)
				audio_stop_sound(snd_chargeshot_charge);
			Charge = 0;
		}
	}

	if Mode == SoulModes.Purple {
		image_angle = 0;
		sprite_index = Soul_Purple;
		if keyboard_check(vk_left) || keyboard_check(ord("A")) {
			x -= global.SoulSpeed * 2;
		}
		if keyboard_check(vk_right) || keyboard_check(ord("D")) {
			x += global.SoulSpeed * 2;
		}
		if keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) {
			PURPLE_SpiderLine -= 1;
		}
		if keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) {
			PURPLE_SpiderLine += 1;
		}
		PURPLE_SpiderLine = clamp(PURPLE_SpiderLine, 1, 3);
		x = clamp(x, (320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12));
		if !instance_exists(obj_BulletGenerator)
			PURPLE_SpiderLine = 2;
		else {
			global.BorderWidth = 200;
			global.BorderHeight = 100;
		}
	}
}

global.SoulX = x;
global.SoulY = y;
global.SoulSpeed = SoulSpeed;

if (global.InvFrames > 0) {
	global.InvFrames -= 1;
	image_speed = 1;
}
else {
	image_speed = 0;
	image_index = 0;
}