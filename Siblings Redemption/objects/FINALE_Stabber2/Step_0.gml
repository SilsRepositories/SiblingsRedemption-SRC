image_angle = direction;
if !Minitype {
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = lerp(image_yscale, 1, 0.1);
}
if (x < 0 || x > 854 || y < 0 || y > 480) {
	if !Minitype {
		audio_play_sound(snd_scytheburst, 0, false);
		for (var i = -8; i < 8; i++) {
			mini = instance_create_depth(xprevious, yprevious, 0, FINALE_Stabber2);
			mini.direction = (direction + 160) + (40 * i);
			mini.speed = 3;
			mini.friction = -0.6;
			mini.Minitype = true;
			mini.image_xscale = 0.5;
			mini.image_yscale = 0.5;
			mini.alarm[0] = 240;
		}
		instance_destroy();
	}
}