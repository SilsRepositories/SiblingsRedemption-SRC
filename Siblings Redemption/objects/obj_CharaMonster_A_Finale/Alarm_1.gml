DamageWriter = instance_create_depth(x, 100, -100, obj_MonsterHP);
DamageWriter.MyHP = 9999999999;
DamageWriter.MyCurrentHP = 9999999999;
DamageWriter.MyHPToBe = 9999999999;
DamageWriter.MyMaxHP = 9999999999;
DamageWriter.ShowBar = false;
DamageWriter.BarWidth = 600;
instance_create_depth(0, 0, -10000, obj_HitFlash);
audio_play_sound(mus_sfx_abreak, 0, false);
if (trueY != 1000) {
	DamageWriter.Damage = "INVINCIBLE";
	audio_play_sound(HeavyDamage, 0, false);
}
else {
	DamageWriter.y = 360;
	DamageWriter.Damage = "NEGATED";
	repeat 30 {
		shard = instance_create_depth(427, 480, -100, obj_GameOver_SoulBit);
		shard.hspeed = random_range(-5, 5);
		shard.vspeed = random_range(-7, 1);
		shard.gravity = 0.1;
		shard.sprite_index = Soul_Bit_White;
		shard.image_blend = c_maroon;
	}
	trueY = 100;
}
alarm[2] = 120;
obj_BattleEffects.CMAB = 6;