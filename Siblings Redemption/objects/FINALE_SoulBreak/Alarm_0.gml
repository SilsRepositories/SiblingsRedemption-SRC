WordStage += 1;
if global.nohitmode {
	Sel = 0;
	MoveOn = true;
	exit;
}
if global.SpeedrunMode > 0 {
	Sel = 1;
	MoveOn = true;
	exit;
}
alarm[0] = 20;
audio_sound_pitch(Gigatalk, 1);
audio_play_sound(Gigatalk, 0, false, 1, 0, 1);
obj_BattleEffects.CMAB = 4;
if WordStage == 4 {
	alarm[0] = -1;
}