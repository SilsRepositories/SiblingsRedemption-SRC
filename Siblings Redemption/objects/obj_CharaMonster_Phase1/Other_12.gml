var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;

Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
Dialogue.TextToDraw = "* You tell Chara that you are&  too powerful to be stopped.";
Dialogue.TextQueue[0] = "* Chara takes it as a challenge&  for dominance.";
Dialogue.TextQueue[1] = "* All RED attacks will&  instantly kill you.";
if global.nohitmode
	Dialogue.TextQueue[2] = "* Not like it matters, anyway.";
Dialogue.CanAdvance = true;
Dialogue.Talker = "Battle";
Taunted = true;