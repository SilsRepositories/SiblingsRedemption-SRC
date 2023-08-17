if !died {
	draw_sprite_ext(Phase6_BG, 0, 320, 240, 2, 2, Siner * 6, c_white, 0.25);
	if image_alpha > 0 {
		HandSiner += 0.001;
		draw_sprite_ext(Phase6_Hands, 0, 320, 1260 - abs(sin(HandSiner) * 600), 1, 1, sin(HandSiner * 50) * 12, c_white, Alpha / 2);
		draw_sprite_ext(Phase6_Hand, 0, 320, 0 - abs(sin(HandSiner) * 300), 1, -1, sin(HandSiner * 40) * 12, c_white, Alpha / 2);
		sprite_index = Chara_Phase6_Glow;
		image_xscale = 2;
		image_yscale = 2;
		image_speed = 1;
		y = ystart - sin(Siner / 5) * 10;
		draw_sprite_part_ext(sprite_index, 0, 1, 0, sprite_width, sprite_height, x - sprite_xoffset, y - sprite_yoffset, 2, 2, c_red, sin(Siner * 3));
		for (var i = 0; i < sprite_height; i++) {
			var glitchRNG = irandom_range(1, 300);
			var offset = 1;
			if (glitchRNG == 50) {
				offset += random_range(10, 17);
			}
			draw_sprite_part_ext(sprite_index, (Siner % 0.7 < 0.35 ? 2 : 1), 1, i, sprite_width, 1, x - sprite_xoffset + random_range(-offset - ShakeEffect, offset + ShakeEffect), y - sprite_yoffset + (i * 2), 2, 2, image_blend, image_alpha);
		}
		draw_sprite_ext(Shadow, 0, 320, 360, 2, 2.5, 0, c_white, abs(sin(Siner)));
	}
}
depth = (obj_BulletBoard.depth + 1);