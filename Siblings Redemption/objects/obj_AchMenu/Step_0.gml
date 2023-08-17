if global.Choice == achInd {
	image_xscale = lerp(image_xscale, baseX * 1.5, 0.08);
	image_yscale = lerp(image_yscale, baseY * 1.5, 0.08);
}
else {
	image_xscale = lerp(baseX, image_xscale, 0.08);
	image_yscale = lerp(baseY, image_yscale, 0.08);
}
visible = global.Menu == 4;