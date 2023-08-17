// Scrapped, was used before achievement book

ini_open("file0");
image_index = 9;
if ini_read_real("achievements", "ach" + string(achInd), 0) == 1 {
	image_index = achInd;
}
ini_close();
baseX = image_xscale;
baseY = image_yscale;