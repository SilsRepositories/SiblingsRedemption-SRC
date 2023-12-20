if instance_exists(obj_MonsterHP)
	instance_destroy(obj_MonsterHP);
if Phase4Timer > 17000 {
	if Phase4Timer < 18200
		global.Damage = 35000 + irandom(4999);
	if Phase4Timer >= 18200 && Phase4Timer < 20000
		global.Damage = 45000 + irandom(4999);
	if Phase4Timer >= 20000 && Phase4Timer < 23000
		global.Damage = 65000 + irandom(4999);
	if Phase4Timer >= 23000 && Phase4Timer < 32000
		global.Damage = 95000 + irandom(14999);
	if Phase4Timer >= 32000
		global.Damage = 245000 + irandom(14999);
}
else {
	global.FG_Heals += 1;
	global.Damage = round(sqrt(Phase4Timer - 1600) / 14) + irandom(5);
	if global.PlayerHP < global.PlayerMaxHP
		global.NoHeal = false;
	global.PlayerHP += 8;
	if global.PlayerHP >= global.PlayerMaxHP
		global.PlayerHP = global.PlayerMaxHP;
	alarm[2] = 150;
}
DamageWriter = instance_create_depth(320, y + 110, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = MyHP - global.Damage;
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.ShowBar = true;
DamageWriter.Damage = global.Damage;
DamageWriter.BarWidth = 550;
if global.Damage > 1000 {
	WhiteFlash = 1;
	ShakeEffect += 15;
}
MyHP -= global.Damage;
if (MyHP <= 0) {
	audio_stop_all();
	instance_destroy(obj_CharaPhase4_Master);
	instance_destroy(obj_Phase4_FightButton);
	alarm[2] = -1;
	alarm[4] = 60;
	global.PlayerHP = global.PlayerMaxHP;
	Timer = -1;
	NewAttack = 999;
	instance_destroy(obj_Phase4_Soul);
	if global.NoHeal {
		SetChaText("NO HEAL PHASE 4");
	}
	if global.NoHit {
		UnlockAchievement(7);
		SetChaText("NO HIT PHASE 4");
	}
	if global.FG_Heals == 0 && global.FG_Start == 1 {
		UnlockAchievement(2);
		SetChaText("NO HEAL NORMAL MODE");
	}
	if global.FG_Hits == 0 && global.FG_Start == 1 {
		UnlockAchievement(2);
		UnlockAchievement(3);
		SetChaText("NO HIT NORMAL MODE");
	}
	UpdateSF(4, global.NoHeal, global.NoHit);
}
if global.Damage < 1000
	audio_play_sound(MonsterHurt, 0, false);
else
	audio_play_sound(HeavyDamage, 0, false);