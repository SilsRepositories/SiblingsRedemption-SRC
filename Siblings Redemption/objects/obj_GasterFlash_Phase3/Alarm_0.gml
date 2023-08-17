if ang != 0 {
	obj_BattleEffects.Rotation = ang;
	obj_BattleEffects.TRotation = ang;
	ang = 0;
}
else {
	obj_BattleEffects.Rotation = 0;
	obj_BattleEffects.TRotation = 0;
}
audio_play_sound(snd_test, 0, false);
instance_destroy();