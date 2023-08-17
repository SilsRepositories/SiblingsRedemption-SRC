depth = 10;
if Death == 0 {
	if (DodgeAnim == 0) {
		if Disarmed || PacifistEnding > 0 {
			Siner = 0;
			Alpha -= 0.007;
		}
		
		draw_sprite_ext(Chara_Torso, 0, x, y, 2, 2, 0, c_white, image_alpha);
		draw_sprite_ext(Chara_Arm, !Disarmed + PacifistEnding, x - 20, y - 82, 2, 2, abs(sin(Siner)) * -7, c_white, image_alpha);
		draw_sprite_ext(Chara_Arm, 0, x + 20, y - 82, -2, 2, abs(sin(Siner)) * 7, c_white, image_alpha);
		draw_sprite_ext(Chara_Head, Emotion, x, y - 86 + abs(sin(Siner)), 2, 2, 0, c_white, image_alpha);
		KnifeSlash = 0;
	}
	else {
		KnifeSlash += 0.1;
		if (DodgeAnim == 2) 
			KnifeSlash += 0.2;
		draw_sprite_ext(KnifeSlash_ANIM, (KnifeSlash > 2 ? 2 : KnifeSlash), x, y, 2, 2, 0, c_white, image_alpha);
	}
}
else {
	depth = -1000000;
	sprite_index = CharaP1_Death0;
	if (Death < 5) {
		image_index = (Death - 1);
		image_xscale = 2;
		image_yscale = 2 - abs(sin(Siner) / 18);
		draw_self();
	}
	else {
		sprite_index = Chara_Phase2;
		image_xscale = 2;
		image_yscale = 2;
		image_speed = 1;
		for (var i = 0; i < sprite_height; i++) {
			var glitchRNG = irandom_range(1, 300);
			var offset = 1;
			if (glitchRNG == 50) {
				offset += random_range(3, 90);
			}
			draw_sprite_part_ext(sprite_index, image_index, 0, i, sprite_width, i + 1, x - sprite_xoffset + random_range(-offset - ShakeEffect, offset + ShakeEffect), y - sprite_yoffset + (i * 2), 2, 2, image_blend, 1);
		}
	}
}
draw_sprite_ext(BGGradient, 0, 320, 480, 1, 1 + (sin(Siner) / 6), 0, c_red, Alpha);