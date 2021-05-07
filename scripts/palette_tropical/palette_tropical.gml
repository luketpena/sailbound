function palette_tropical(){
	var skyPalette = new PaletteSky(
		new Swatch($a5946f, $ffa462, $59092f, $360f15, $190a0a),
		new Swatch($f0deec, $ffe7cf, $0063ff, $2b0051, $44341a),
		new Swatch($dcdce6, $ffffff, $c86f77, $86506c, $6c5035),
		new Swatch($eefaff, $ffffff, $a5e1ff, $a5e1ff, $a5e1ff),
		$00dcff
	);
	
	var waterPalette = new PaletteWater(
		new Swatch($ffecfa, $ffffff, $84c2ff, $5e58b0, $b0987c),
		new Swatch($b09651, $fa7d02, $894e20, $4e2e1a, $4b2c23),
		new Swatch($3a2b2f, $411a1e, $280a11, $17040c, $060004),
		new Swatch($f4e6f2, $ffffff, $c2dce4, $746a9d, $877559),
	);
	
	var palette = new Palette(
		skyPalette,
		waterPalette,
		new Swatch($e6dfe5, $ffffff, $d8d5ce, $99897e, $aa7f76),
	);

	return palette;
}