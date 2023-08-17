MyName = "Chara";
MyHP = 9999;
MyMaxHP = 9999;
CheckDescription[0] = "* Chara - INF ATK INF DEF&* The combination of their soul&  and Flowey morph into this.";
CheckDescription[1] = "~R* WHAT AM I LOOKING AT?&* IT'S DISGUSTING!";
Act[0] = "Check";
ShowHealthBar = false;
CanSpare = false;
Emotion = 0;
KnifeSlash = 0;
Disarmed = false;
Death = 0
Hits = 410;
Fought = false;
died = false;
global.Item[0] = "Pie";
global.Item[1] = "S.Piece";
global.Item[2] = "S.Piece";
global.Item[3] = "S.Piece";
global.Item[4] = "Steak";
global.Item[5] = "G.Burger";
global.Item[6] = "G.Burger";
global.Item[7] = "G.Burger";
if string_lower(global.Name) == "kel" {
	global.Item[0] = "Coffee";
	global.Item[1] = "Coffee";
	global.Item[2] = "Coffee";
	global.Item[3] = "Coffee";
	global.Item[4] = "Coffee";
	global.Item[5] = "Coffee";
	global.Item[6] = "Coffee";
	global.Item[7] = "Coffee";
}

Attack = 999;
Defense = 99;
Dialogue = noone;
ReadyForBattle = false;

Taunted = false;
Killed = false;

ShakeEffect = 0;
Myself = -1;
DodgeAnim = 0;
Siner = 0;
Alpha = 1;

if global.FG_Start != 1 {
	global.PlayerHP = 99;
}

MySpeechBubble = noone;

Turn = 0;