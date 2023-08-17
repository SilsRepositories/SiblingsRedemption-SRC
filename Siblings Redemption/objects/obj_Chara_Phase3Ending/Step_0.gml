if y > 450 {
	gravity = 0;
	vspeed = 0;
	speed = 0;
	image_index += 1;
	y = 450;
	audio_play_sound(snd_test, 0, false);
	shake = 5;
}
x = xstart + random_range(-shake, shake);
shake -= 0.2;
if shake < 0
	shake = 0;