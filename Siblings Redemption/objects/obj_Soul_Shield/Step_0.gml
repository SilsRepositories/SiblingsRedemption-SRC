if keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
	Angle = 90;
if keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
	Angle = -90;
if keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))
	Angle = -180;
if keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))
	Angle = 0;
if abs((Angle - 90) - image_angle) > 180 {
	image_angle += 360;
}
image_angle = lerp(image_angle, Angle - 90, 0.5);
x = obj_Soul.x + lengthdir_x(26, image_angle + 90);
y = obj_Soul.y + lengthdir_y(26, image_angle + 90);