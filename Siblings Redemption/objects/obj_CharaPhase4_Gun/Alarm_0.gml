hspeed = (x > 320 ? 5 : -5);
obj_CharaMonster_Phase4.ShakeEffect = 4;
bullet = instance_create_depth(x + (x > 320 ? -110 : 110), y, -1000, obj_CharaPhase4_Bullet);
bullet.hspeed = hspeed * -2;
repeat 4
	audio_play_sound(Phase4_Shoot, 0, false);