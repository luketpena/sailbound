function palette_arctic(){
	var skyPalette = new PaletteSky(
		new Swatch($c0b7a4, $feedb7, $806842, $412c25, $1e141), 
		new Swatch($dfeeff, $fffcdf, $c0e85c, $9aa132, $5b5116), 
		new Swatch($d6dee0, $ffffff, $b9c573, $978455, $735a31), 
		new Swatch($e9f8ff, $ffffff, $e9ff9e, $e9ff9e, $e9ff9e), 
		$fff100
	);
	
	var waterPalette = new PaletteWater(
		new Swatch($fefefe, $ffffff, $e3fbb3, $bfc467, $aa9e6b), 
		new Swatch($cec79b, $f6ca71, $b8b85d, $8d8751, $5e4d2b), 
		new Swatch($6b5d3b, $7b5e38, $5d5225, $2b2714, $150d084), 
		new Swatch($e8f1f6, $ffffff, $dce4c2, $a39e6c, $877559)
	);
	
	var palette = new Palette(
		skyPalette, 
		waterPalette, 
		new Swatch($d9e1ea, $fefefe, $dfe0ce, $bbb893, $868360)
	);

	return palette;
}