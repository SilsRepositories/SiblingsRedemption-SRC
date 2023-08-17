for (var i = 0; i < sprite_height; i++) {
	var glitchRNG = irandom_range(1, 100);
	var offset = 1;
	if (glitchRNG == 50) {
		offset += random_range(3, 9);
	}
	draw_sprite_part_ext(sprite_index, image_index, 0, i, sprite_width, 1, x - sprite_xoffset + random_range(-offset, offset), y - sprite_yoffset + (i * image_yscale), image_xscale, image_yscale, 0xFCE1FF, image_alpha);
}