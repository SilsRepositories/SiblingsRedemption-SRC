sprite_index = Chara_Phase3;
image_xscale = 2;
image_yscale = 2;
image_speed = 0;

var Gaster_LeftHandX = 240 + sin(Siner);
var Gaster_LeftHandY = 40 + cos(Siner + 1) * 3;

var Gaster_RightHandX = 400 + sin(Siner);
var Gaster_RightHandY = 40 + cos(Siner + 1) * 3;

draw_sprite_ext(GasterHand, 0, Gaster_LeftHandX, Gaster_LeftHandY, 2, 2, sin(Siner), c_white, 1);
draw_sprite_ext(GasterHand, 0, Gaster_RightHandX, Gaster_RightHandY, -2, 2, -sin(Siner), c_white, 1);
draw_set_color(c_white);
for (var i = 60; i > 60 - (Strings * 5); i -= 6) {
	if i % 12 == 0
		draw_line(Gaster_LeftHandX, Gaster_LeftHandY, x - i, y);
	else
		draw_line(Gaster_RightHandX, Gaster_RightHandY, x + i, y);
}

draw_self();
var ign = false;
if instance_exists(obj_BulletGenerator) {
	if obj_BulletGenerator.Turn == 26 {
		ign = true;
		x = lerp(x, 320, 0.1);
		y = lerp(y, ystart - 40, 0.1);
		follower1x = lerp(follower1x, -320, 0.001);
		follower2x = lerp(follower2x, 960, 0.001);
	}
}

if !ign {
	follower1x = lerp(follower1x, 60, 0.1);
	follower2x = lerp(follower2x, 580, 0.1);
	y = ystart + sin(Siner) * 10;
	x = xstart + sin(Siner / 8) * 20;
}
draw_sprite_ext(spr_g_follower_3_0, 0, follower1x, 230, -2, 2, 0, c_white, 1);
draw_sprite_ext(spr_g_follower_2_0, 0, follower2x, 230, 2, 2, 0, c_white, 1);

for (var i = 0; i < sprite_height; i++) {
	var glitchRNG = 0;
	var offset = 1;
	if (glitchRNG == 50) {
		offset += random_range(3, 7);
	}
	draw_sprite_part_ext(sprite_index, image_index, 0, i, sprite_width, i + 1, x - sprite_xoffset + random_range(-offset - ShakeEffect, offset + ShakeEffect), y - sprite_yoffset + (i * 2), 2, 2, c_white, 1);
}
depth = 9;