if (y < -20) {
	instance_destroy();
}
if sprite_index == BIGSHOT {
	image_xscale = lerp(image_xscale, 1, 0.17);
	image_yscale = lerp(image_yscale, 1, 0.17);
}