var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;

if !Taunted {
	Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
	Dialogue.TextToDraw = "* You tell Chara that you are too&  powerful to be stopped.";
	Dialogue.TextQueue[0] = "* Chara takes it as a challenge&  for dominance.";
	Dialogue.TextQueue[1] = "* All RED attacks will now&  instantly kill you.";
	Dialogue.CanAdvance = true;
	Taunted = true;
}
else {
	Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
	Dialogue.TextToDraw = "* You say something disturbing,&  but they ignore you.";
	Dialogue.CanAdvance = true;
}
