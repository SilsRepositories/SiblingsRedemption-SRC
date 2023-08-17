var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;

Taunts += 1;
Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
Dialogue.CanAdvance = true;
if Taunts == 1 {
	Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
	Dialogue.TextToDraw = "* You tell Flowey that you killed&  his parents.";
	Dialogue.TextQueue[0] = "* Flowey feels deeply hurt by&  your words.&* Flowey's DEFENSE dropped!";
	Defense -= 20;
}
if Taunts == 2 {
	Dialogue.TextToDraw = "* You tell Flowey that he could&  never have killed you, even&  if he tried.";
	Dialogue.TextQueue[0] = "* Flowey looks at Chara, then&  back at you. He's not going to&  give up.";
	Dialogue.TextQueue[1] = "* Flowey's ATTACK increased!";
	Attack += 4;
}
if Taunts == 3 {
	Dialogue.TextToDraw = "* You tell Flowey that despite&  his best efforts, he will die.";
	Dialogue.TextQueue[0] = "* Flowey ignores you, but his&  DEFENSE weakens!";
	Defense -= 20;
}
if Taunts >= 4 {
	Dialogue.TextToDraw = "* You say something nasty to him,&  but he ignores you.";
	Dialogue.TextQueue[0] = "~R* Seems as if verbal abuse won't&  work...";
}