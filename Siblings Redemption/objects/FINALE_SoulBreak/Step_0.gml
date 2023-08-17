if obj_BattleEffects.CMAB > 0.6 {
	obj_BattleEffects.CMAB -= 0.05;
}
x = lerp(x, 427, 0.03);
y = lerp(y, 240, 0.03);
with (obj_SpeedrunTimer) {
	Running = false;
}
image_xscale = lerp(image_xscale, 0.8, 0.03);
image_yscale = lerp(image_yscale, 0.8, 0.03);