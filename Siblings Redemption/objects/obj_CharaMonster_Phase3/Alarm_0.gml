global.BorderHeight = 120;
global.BorderWidth = 180;
obj_Soul.x = 320;
obj_Soul.y = 384 - (global.BorderHeight / 2);
obj_Soul.visible = true;
instance_destroy(obj_TargetField);
instance_destroy(obj_TargetBar);

if !Checked && global.Damage > 0
	Turn += 1;
Checked = false;
global.Damage = 0;

// DON'T TOUCH, this is for when the speech bubble appears, it delays the attack until it is gone
alarm[4] = 3;