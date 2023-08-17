if (image_index == 1) {
	if global.EnemyGroup == 3 {
		if image_alpha == 1 {
			audio_play_sound(Undertale, 0, false);
			alarm[0] = -1;
		}
		image_alpha -= 0.005;
	}
}