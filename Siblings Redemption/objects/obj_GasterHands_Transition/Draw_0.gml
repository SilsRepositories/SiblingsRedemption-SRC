Siner += 0.04;
Alpha += 0.002;
if Alpha > 0.5 {
	Alpha = 0.5;
}

var Gaster_LeftHandX = 240 + sin(Siner);
var Gaster_LeftHandY = 40 + cos(Siner + 1) * 3;

var Gaster_RightHandX = 400 + sin(Siner);
var Gaster_RightHandY = 40 + cos(Siner + 1) * 3;

follower1x = lerp(follower1x, 60, 0.006);
follower2x = lerp(follower2x, 580, 0.006);

draw_sprite_ext(spr_g_follower_3_0, 0, follower1x, 230, -2, 2, 0, c_white, 1);
draw_sprite_ext(spr_g_follower_2_0, 0, follower2x, 230, 2, 2, 0, c_white, 1);

draw_sprite_ext(GasterHand, 0, Gaster_LeftHandX, Gaster_LeftHandY, 2, 2, sin(Siner), c_white, Alpha);
draw_sprite_ext(GasterHand, 0, Gaster_RightHandX, Gaster_RightHandY, -2, 2, -sin(Siner), c_white, Alpha);
draw_set_color(c_white);
if LeftOut
	draw_line(Gaster_LeftHandX, Gaster_LeftHandY, 300, obj_CharaMonster_Phase2.y - 10);
if RightOut
	draw_line(Gaster_RightHandX, Gaster_RightHandY, 340, obj_CharaMonster_Phase2.y - 10);