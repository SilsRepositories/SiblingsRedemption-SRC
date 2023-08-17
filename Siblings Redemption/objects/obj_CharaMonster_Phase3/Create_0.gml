MyName = "Chara";
MyHP = 1494;
MyMaxHP = 9999;
CheckDescription[0] = "* Chara - Unstable";
CheckDescription[1] = "* Seems as if something has&  gone wrong.~R  &* I WILL NOT STOP HERE.";
Act[0] = "Check";
Act[1] = "Cut String";
Strings = 9;
ShowHealthBar = false;
CanSpare = false;
Emotion = 0;
Checked = false;
KnifeSlash = 0;
Disarmed = false;
EndingTime = false;
Death = 0
window_set_caption("THE VOID: GASTER'S RETURN");
if (!global.nohitmode && global.FG_Heals > 0) || global.FG_Start != 1
	global.PlayerHP = 99;

Attack = 99;
Defense = -30;
Dialogue = noone;
ReadyForBattle = false;

follower1x = 60;
follower2x = 580;

Taunted = false;
Killed = false;

ShakeEffect = 0;
Myself = -1;
DodgeAnim = 0;
Siner = 0;
Alpha = 1;

MySpeechBubble = noone;

Turn = 0;