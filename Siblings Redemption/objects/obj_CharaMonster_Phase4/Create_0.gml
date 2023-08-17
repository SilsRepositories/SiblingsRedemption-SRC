PreviousAttack = -1000;
NewAttack = -1000;
Phase4Timer = 0;
Timer = 0;
siner = 0;
Stage = 0;
MyHP = 999999;
MyMaxHP = 999999;
WhiteFlash = 0;
Heals = 5;
RemHP = 0;
BGAlp = 0;
BAlp = 0;
soa = 0;
window_set_caption("UNDERTALE: Siblings Redemption");
global.P4D = 0;
global.PlayerMaxHP = 99;
if global.FG_Heals > 0 || global.FG_Start != 1 {
	global.PlayerHP = 99;
}
global.NoHeal = true;
global.NoHit = true;
if global.nohitmode {
	global.PlayerHP = 1;
	global.PlayerMaxHP = 1;
}
ShakeEffect = 0;
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
ySta = -800;

//alarm[0] = 1;
//alarm[2] = 200;