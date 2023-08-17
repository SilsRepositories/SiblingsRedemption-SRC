if (y >= 100) {
	var dir = random(360);
	for (var i = 0; i < 9; i++) {
		shrike = instance_create_depth(x, y, -1000, obj_Shrike_Small);
		shrike.direction = (45 * i) + dir;
		shrike.speed = 4;
		shrike.cenx = x;
		shrike.ceny = y;
	}
	audio_play_sound(snd_shakerbreaker, 0, false);
	instance_destroy();
}