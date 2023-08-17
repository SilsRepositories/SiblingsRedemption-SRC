if stage == 0 {
	audio_play_sound(snd_spearrise, 0, false);
	stage = 1;
	alarm[0] = 120;
}
if stage == 1 {
	y = lerp(y, 160, 0.1);
}
if stage == 2 {
	siner += 0.01;
	x = xstart - (sin(siner * 2) * 35);
	image_angle = (sin(siner * 3.4) * 80);
}