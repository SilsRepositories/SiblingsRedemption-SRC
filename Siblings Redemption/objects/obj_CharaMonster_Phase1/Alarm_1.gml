/*
  Only use THIS when you want the enemy to DODGE attacks
*/
DamageWriter = instance_create_depth(x, y - 170, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = MyHP;
DamageWriter.MyMaxHP = MyMaxHP;
if obj_FloweyMonster_Phase1.MyHP > 0.5 {
	DamageWriter.ShowBar = false;
	DamageWriter.Damage = "BLOCK";
	Fought = true;
	DodgeAnim = 0;
	MyHP += global.Damage;
}
else {
	if !Disarmed && global.Damage > 0 {
		MyHP += global.Damage;
		DamageWriter.MyHPToBe = (MyHP - global.Damage);
		DamageWriter.ShowBar = false;
		DamageWriter.Damage = "DISARMED";
		audio_stop_sound(global.BattleMusic);
		Disarmed = true;
		Emotion = 10;
		audio_play_sound(MonsterHurt, 0, false);
	}
}
if (global.Damage <= 0) {
	DamageWriter.ShowBar = false;
	DamageWriter.Damage = "MISS";
	Fought = false;
}
else {
	ShakeEffect = 4;
	MyHP -= global.Damage;
	audio_play_sound(MonsterHurt, 0, false);
}

