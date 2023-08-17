image_angle = sin(siner) * 8;
x = xstart + (sin(siner / 5) * 50);
y += sin(siner / 6) + 3;
siner += 0.065;
if y > 640 {
	instance_destroy();
}