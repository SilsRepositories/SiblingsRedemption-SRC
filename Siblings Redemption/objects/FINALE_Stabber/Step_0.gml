if !Spawned {
	obj_BattleEffects.CMAB = 4;
	if (x >= 854) {
		x = 1334;
		TargetX = 854;
		TargetY = y;
	}
	if (x <= 0) {
		x = -480;
		TargetX = 0;
		TargetY = y;
	}
	if (y >= 480) {
		y = 960;
		TargetX = x;
		TargetY = 720;
	}
	if (y <= 0) {
		y = -480;
		TargetX = x;
		TargetY = -240;
	}
	Spawned = true;
}
else {
	if Stage == 0 {
		x = lerp(x, TargetX, 0.3);
		y = lerp(y, TargetY, 0.3);
		
		Timer += 1;
		if Timer == 30 {
			Stage = 1;
			audio_play_sound(Swipe, 0, false);
			if image_angle == 180 || image_angle == 0
				vspeed = y >= 240 ? -9 : 9;
			if image_angle == 90 || image_angle == -90
				hspeed = x >= 427 ? -9 : 9;
			friction = -0.8;
		}
	}
}

if (x < -2000 || x > 2000 || y > 2000 || y < -2000) {
	instance_destroy();
}