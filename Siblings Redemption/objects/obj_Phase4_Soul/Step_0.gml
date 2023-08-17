var SoulSpeed = global.SoulSpeed;
SoulSpeed *= 2;
if room == Room_Finale {
	SoulSpeed *= 2;
	image_blend = c_black;
	image_alpha = lerp(alp, image_alpha, 0.2);
}
if keyboard_check(vk_rshift) || keyboard_check(ord("X"))
	SoulSpeed /= 2;
if FinaleSoul < 2 {
	if keyboard_check(vk_left) || keyboard_check(ord("A"))
		x -= SoulSpeed;
	if keyboard_check(vk_right) || keyboard_check(ord("D"))
		x += SoulSpeed;
	if keyboard_check(vk_up) || keyboard_check(ord("W"))
		y -= SoulSpeed;
	if keyboard_check(vk_down) || keyboard_check(ord("S"))
		y += SoulSpeed;
}
else {
	x = lerp(x, mouse_x, 0.1);
	y = lerp(y, mouse_y, 0.1);
}
if room == Room_Finale {
	if FinaleSoul == 0
		sprite_index = Soul_Phase4;
	if FinaleSoul == 1 {
		sprite_index = Soul_Finale;
		image_index = 0;
	}
	if FinaleSoul == 2 {
		sprite_index = Soul_Finale;
		image_index = 1;
	}
}
siner += 0.02;

image_xscale = 0.17 + (sin(siner) / 70);
image_yscale = 0.17 + (sin(siner) / 70);
if room != Room_Finale {
	x = clamp(x, 16, 624);
	y = clamp(y, 16, 464);
}
else {
	x = clamp(x, 16, 838);
	y = clamp(y, 16, 464);
}
global.SoulX = x;
global.SoulY = y;