image_angle = direction;
image_xscale = lerp(image_xscale, 2, 0.1);
image_yscale = lerp(image_yscale, 2, 0.1);
tim += 1;
if speed < 10
	direction += (speed / 4);
if (tim == 60) {
	friction = -0.2;
}