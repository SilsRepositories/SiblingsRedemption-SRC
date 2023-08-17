image_xscale -= 0.003;
image_yscale = 2;
image_alpha -= 0.006;
if (image_alpha <= 0) {
	instance_destroy();
}