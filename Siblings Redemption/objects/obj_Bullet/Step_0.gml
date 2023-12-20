siner += 1;
switch behav {
	// Knife that spins before aiming at soul
	case 0:
		if (siner == 1) {
			audio_play_sound(snd_spearappear, 0, false);
			image_alpha = 0;
		}
		if (siner < 50) {
			image_alpha += 0.02;
			image_angle += 9 + (siner / 5);
		}
		if (siner >= 50 && siner < 80) {
			image_angle = point_direction(x, y, obj_Soul.x, obj_Soul.y);
			direction = image_angle;
		}
		if (siner == 80) {
			audio_play_sound(snd_arrow, 0, false);
			friction = -0.12;
			speed = 7;
		}
		if (siner > 300) {
			instance_destroy();
		}
		break;
	// Waving knife
	case 2:
		if (!spawn2) {
			image_alpha = 0;
			spawn2 = true;
		}
		image_alpha += 0.02;
		x = xstart + (sin(siner / 36) * SinMul);
		SinMul += 0.5;
		if SinMul > 70
			SinMul = 70;
		break;
	// Spinning knife circle
	case 3:
		if (siner == 1) {
			global.BorderWidth = 120;
			global.BorderHeight = 120;
			image_alpha = 0;
		}
		image_xscale = 0.75;
		image_yscale = 0.75;
		image_alpha += 0.02;
		image_angle = ang + 180;
		ang += 1.5;
		x = 320 + lengthdir_x(sin(siner / 60) * 130, ang);
		y = (384 - (global.BorderHeight / 2)) + lengthdir_y(sin(siner / 60) * 130, ang);
		break;
	// Knife that spins before aiming at soul, but it rebounds
	case 4:
		if (siner == 1) {
			audio_play_sound(snd_spearappear, 0, false);
			image_alpha = 0;
		}
		if (siner < 50) {
			image_alpha += 0.02;
			image_angle += 9 + (siner / 5);
		}
		if (siner >= 50 && siner < 80) {
			image_angle = point_direction(x, y, obj_Soul.x, obj_Soul.y);
			direction = image_angle;
		}
		if (siner == 80) {
			audio_play_sound(snd_arrow, 0, false);
			friction = -0.12;
			speed = 7;
		}
		if (siner > 300) {
			instance_destroy();
		}
		if (x < -100 || x > 740 || y < -100 || y > 580) {
			direction = point_direction(x, y, obj_Soul.x, obj_Soul.y);
			speed = 16;
			image_angle = direction; //(direction - 90);
			behav = -1;
		}
		break;
	// Knife that quickly shoots
	case 5:
		image_alpha += 0.1;
		if (siner == 1) {
			audio_play_sound(snd_spearappear, 0, false);
		}
		if (siner == 31) {
			audio_play_sound(snd_arrow, 0, false);
			friction = -0.1;
			speed = 9;
		}
		if (x < -100 || x > 740 || y < -100 || y > 580) {
			direction = point_direction(x, y, obj_Soul.x, obj_Soul.y);
			speed = 9;
			image_angle = direction; //(direction - 90);
		}
		break;
	// Knife that aims at soul before quickly shooting
	case 6:
		if (siner == 1) {
			image_alpha = 0;
		}
		if (siner < 80) {
			image_alpha += 0.02;
			x = obj_Soul.x;
			image_angle = point_direction(x, y, obj_Soul.x, obj_Soul.y);
			direction = image_angle;
		}
		if (siner == 80) {
			audio_play_sound(Swipe, 0, false);
			friction = -0.12;
			speed = 7;
		}
		break;
	// Knives that glow red before shooting
	case 7:
		if (siner == 1 && global.EnemyGroup < 6)
			audio_play_sound(snd_spearappear, 0, false);
		if (siner < 80) {
			image_alpha += 0.02;
		}
		if (siner > 240 && siner <= 360) {
			image_blend -= make_color_rgb(0, 2, 2);
		}
		if (siner == 360) {
			direction = image_angle;
			speed = -1;
			if global.EnemyGroup < 6
				audio_play_sound(Swipe, 0, false);
		}
		if siner > 360 {
			speed += 1;
		}
		break;
	// Knives that spin, only used in phase 6
	case 8:
		image_angle += hspeed;
		break;
	// Knives that home in on a central point
	case 9:
		if (siner == 1) {
			image_alpha = 0;
		}
		image_xscale = 0.75;
		image_yscale = 0.75;
		image_alpha += 0.02;
		image_angle = ang + 180;
		ang += CenSpd;
		x = CentX + lengthdir_x(CentLen, ang);
		y = CentY + lengthdir_y(CentLen, ang);
		CentLen -= 1;
		if CentLen < 16 {
			image_alpha -= 0.08;
			if image_alpha <= 0 {
				instance_destroy();
			}
		}
		break;
	// Knives that slowly pull back before shooting
	case 10:
		if (speed =- 3) {
			image_alpha = 0;
			audio_play_sound(snd_spearappear, 20, false);
		}
		
		image_alpha += 0.1;
		speed += 0.3;
		if (speed == 0)
			audio_play_sound(mus_sfx_a_pullback, 20, false);
		break;
}
// If it goes too far out of bounds, destroy the object to prevent lag
if (x < -200 || x > 840 || y < -200 || y > 680) {
	instance_destroy();
}