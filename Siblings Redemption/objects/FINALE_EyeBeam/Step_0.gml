if !Die {
	image_xscale = 0.4 * abs(sin(ehe));
}
else {
	audio_stop_sound(mus_sfx_rainbowbeam_hold);
	image_xscale = lerp(image_xscale, 0, 0.3);
	if (image_xscale < 0.03) {
		instance_destroy();
	}
}
if (x < 427)
	image_angle -= clamp(ehe / 100, 0, 2);
else
	image_angle += clamp(ehe / 100, 0, 2);
ehe += 1;