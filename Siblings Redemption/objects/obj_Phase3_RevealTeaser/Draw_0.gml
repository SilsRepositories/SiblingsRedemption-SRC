alp -= 0.07;
draw_set_alpha(alp);
draw_set_color(c_white);
if (side == 0) {
	draw_rectangle(320 - (global.BorderWidth / 2), 384 - global.BorderHeight, 320 + (global.BorderWidth / 2), 384 - (global.BorderHeight / 2), false);
}
else {
	draw_rectangle(320 - (global.BorderWidth / 2), 384 - (global.BorderHeight / 2), 320 + (global.BorderWidth / 2), 384, false);
}
if timer > 0 {
	timer -= 1;
	if (side == 0) {
		var si = choose(0, 1);
		if si == 0 {
			b1 = instance_create_depth(global.LeftEdge - 20, 384 - (global.BorderHeight / random_range(1, 2)), 1, obj_Gaster_Bullet);
			b1.hspeed = 6 + random(6);
			b1.Inside = true;
			b1.behav = -1;
		}
		if si == 1 {
			b1 = instance_create_depth(global.RightEdge + 20, 384 - (global.BorderHeight / random_range(1, 2)), 1, obj_Gaster_Bullet);
			b1.hspeed = -6 - random(6);
			b1.Inside = true;
			b1.behav = -1;
		}
	}
	else {
		var si = choose(0, 1);
		if si == 0 {
			b1 = instance_create_depth(global.LeftEdge - 20, 384 - random_range(0, (global.BorderHeight / 2)), 1, obj_Gaster_Bullet);
			b1.hspeed = 6 + random(6);
			b1.Inside = true;
			b1.behav = -1;
		}
		if si == 1 {
			b1 = instance_create_depth(global.RightEdge + 20, 384 - random_range(0, (global.BorderHeight / 2)), 1, obj_Gaster_Bullet);
			b1.hspeed = -6 - random(6);
			b1.Inside = true;
			b1.behav = -1;
		}
	}
}
draw_set_alpha(1);