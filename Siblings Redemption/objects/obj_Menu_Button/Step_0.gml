if global.Choice == image_index && global.Menu == 0 {
	image_xscale += ((1.4 - image_xscale) / 8);
	image_yscale += ((1.4 - image_yscale) / 8);
}
else {
	image_xscale -= ((image_xscale - 1.2) / 8);
	image_yscale -= ((image_yscale - 1.2) / 8);
}