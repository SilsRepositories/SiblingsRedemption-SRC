DamageWriter = instance_create_depth(x, y - 200, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = MyHP;
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.ShowBar = false;
DamageWriter.Damage = (global.Damage > 0 ? "???" : "MISS");
if global.Damage > 0
	audio_play_sound(DialupMashup, 0, false);