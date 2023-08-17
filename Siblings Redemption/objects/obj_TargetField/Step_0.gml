if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
	global.PriorityBar += 1;
}
if (global.PriorityBar >= global.BarCount && !attacked) {
	alarm[0] = 1;
	attacked = true;
}