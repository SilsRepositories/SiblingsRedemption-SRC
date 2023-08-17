var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;

Apologise += 1;
Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
if Apologise == 1
	Dialogue.TextToDraw = "* You apologize to Flowey.&* He ignores you.";
else if Apologise == 2
	Dialogue.TextToDraw = "* You tell Flowey you're sorry.&* He doesn't believe you..";
else if Apologise >= 3
	Dialogue.TextToDraw = "* You keep telling Flowey you're&  sorry.&* He isn't listening.";
Dialogue.CanAdvance = true;