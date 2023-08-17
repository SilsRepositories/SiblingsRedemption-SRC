inspeed += 0.01;
if (inspeed > 2) {
	inspeed = 2;
}
image_angle += inspeed;
if SendOff {
	image_xscale = lerp(image_xscale, 0, 0.2);
	image_yscale = lerp(image_yscale, 0, 0.2);
	if (image_xscale < 0.03) {
		instance_destroy();
	}
}
else {
	image_xscale = lerp(image_xscale, 2, 0.2);
	image_yscale = lerp(image_yscale, 2, 0.2);
}