/*
  Only use THIS when you want the enemy to DODGE attacks
*/
DamageWriter = instance_create_depth(x, y - 110, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = (MyHP - global.Damage);
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.Damage = global.Damage;
if (global.Damage <= 0) {
	DamageWriter.ShowBar = false;
	DamageWriter.Damage = "MISS";
}
else {
	ShakeEffect = 20;
	Fought = true;
	MyHP -= global.Damage;
	audio_play_sound(MonsterHurt, 0, false);
}