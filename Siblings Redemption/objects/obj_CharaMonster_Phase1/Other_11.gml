var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;

Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
Dialogue.TextToDraw = "* You apologize to Chara.&* They ignore you.";
Dialogue.CanAdvance = true;
Dialogue.Talker = "Battle";
