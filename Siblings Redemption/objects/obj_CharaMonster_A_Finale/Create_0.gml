Stage = 1;

BG_x = 0;
BG_y = 0;

trueXS = 2;
trueYS = 2;
trueX = 427;
trueY = 96;
DamageTimer = 200;
HPCounter = 200;
WLT = 0;

BGSpeed = 2;
BGCol = c_red;
image_blend = c_black;
col = 0;

Timer = 0;

global.soul7_HP = 200;
global.soul7_MaxHP = 200;
global.soulInv = 0;

global.NoHeal = true;
global.NoHit = true;

if global.nohitmode {
	global.soul7_HP = 1;
	global.soul7_MaxHP = 1;
}

Hits = 255;
CurrentMus = p70;
audio_play_sound(CurrentMus, 1, true, 1);
CurrentDia = p7v1;
VoiceLine = 1;
ParalAlph = 0.3;
TargetAlph = 0.3;
NoHeal = false;
ShadowAlph = 1;
Siner = 0;
Words = 4;
WordConfirm = false;
WA = 0;
Can = false;
Charge = 0;

room_width = 854;
window_set_size(854, 480);
surface_resize(application_surface, 854, 480);