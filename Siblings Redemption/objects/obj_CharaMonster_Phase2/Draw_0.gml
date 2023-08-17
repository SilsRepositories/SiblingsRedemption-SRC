if !died {
	//draw_sprite_ext(BGGradient, 0, 320, 0, 1, -1 - (sin(Siner) / 6), 0, c_maroon, Alpha);
	//draw_sprite_ext(BGGradient, 0, 320, 480, 1, 1 + (sin(Siner) / 6), 0, c_maroon, Alpha);
	var Cutoff = (Siner * 100) % 400;
	draw_sprite_part_ext(spr_asrielbg_0, 0, 0 + Cutoff, 0, 320 + Cutoff, 240, -200, -200, 4, 4, c_maroon, 0.5);
	draw_sprite_part_ext(spr_asrielbg_0, 0, 480 - Cutoff, 0, 800 - Cutoff, 240, -200, -200, 4, 4, c_maroon, 0.5);
	sprite_index = Chara_Phase2;
	image_xscale = 2;
	image_yscale = 2;
	image_speed = 1;
	//draw_self();
	for (var i = 0; i < sprite_height; i++) {
		var glitchRNG = irandom_range(1, 300);
		var offset = 1;
		if (glitchRNG == 50) {
			offset += random_range(3, 90);
		}
		draw_sprite_part_ext(sprite_index, image_index, 0, i, sprite_width, 1, x - sprite_xoffset + random_range(-offset - ShakeEffect, offset + ShakeEffect), y - sprite_yoffset + (i * 2), 2, 2, c_white, image_alpha);
	}
}
else {
	CheckDescription[0] = "* Chara - Defenseless";
	CheckDescription[1] = "~R* It's time.";
	image_alpha = 1;
	image_blend = c_white;
	if MyHP == 2160 {
		sprite_index = Chara_Phase2_Death;
		image_index = 0;
	}
	else {
		sprite_index = CharaP2_Death;
		if (Death < 5) {
			image_index = Death;
			image_xscale = 2;
			//image_yscale = 2 - abs(sin(Siner) / 18);
			draw_self();
		}
	}
	draw_self();
}

if instance_exists(obj_BulletGenerator) && obj_Soul.Mode = 3 {
	if Hits < 400 {
		draw_healthbar(x - 40, y - 185, x + 40, y - 175, ((Hits + 200) / 600) * 100, c_red, c_lime, c_lime, 0, true, true);
	}
}

depth = 9;