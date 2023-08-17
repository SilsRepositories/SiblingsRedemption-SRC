image_xscale += 0.1;
image_yscale += 0.1;
image_alpha -= 0.01;
if image_alpha < 0.01 {
	instance_destroy();
}