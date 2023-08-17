/*
  Only use THIS when you want the enemy to DODGE attacks
*/
DamageWriter = instance_create_depth(x, y - 80, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = MyHP - global.Damage;
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.ShowBar = false;
DamageWriter.Damage = global.Damage;
DodgeAnim = 0;
if (global.Damage <= 0) {
	DamageWriter.ShowBar = false;
	DamageWriter.Damage = "MISS";
}
else {
	ShakeEffect = 2;
	global.Damage = 170;
	MyHP -= global.Damage;
	DamageWriter.Damage = "";
	audio_play_sound(Heal, 0, false);
	if global.PlayerHP < global.PlayerMaxHP {
		global.NoHeal = false;
		global.FG_Heals += 1;
	}
	global.PlayerHP += 20;
	if global.PlayerHP > global.PlayerMaxHP {
		global.PlayerHP = global.PlayerMaxHP;
	}
	image_index += 1;
	repeat 18 {
		shard = instance_create_depth(x, y, -100, obj_GameOver_SoulBit);
		shard.hspeed = random_range(-5, 5);
		shard.vspeed = random_range(-5, 1);
		shard.gravity = 0.02;
		shard.sprite_index = Soul_Bit_White;
	}
	audio_play_sound(MonsterHurt, 0, false);
	audio_play_sound(DialupMashup, 0, false);
}