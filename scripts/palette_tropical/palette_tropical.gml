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
		new Swatch($f4e6f2, $ffffff, $c2dce4, $746a9d, $877559)
	);
	
	var palette = new Palette(
		skyPalette,
		waterPalette,
		new Swatch($e6dfe5, $ffffff, $d8d5ce, $99897e, $aa7f76)
	);

	return palette;
}

function palette_tropical2() {
	return {
	  "water":{
	    "surface":{
	      "night":4530191.0,
	      "array":[
	        11571779.0,
	        16738816.0,
	        7814194.0,
	        5118506.0,
	        4530191.0
	      ],
	      "morning":11571779.0,
	      "day":16738816.0,
	      "sunset":7814194.0,
	      "sunfall":5118506.0
	    },
	    "depths":{
	      "night":393220.0,
	      "array":[
	        5187891.0,
	        4266526.0,
	        2624017.0,
	        1508364.0,
	        393220.0
	      ],
	      "morning":5187891.0,
	      "day":4266526.0,
	      "sunset":2624017.0,
	      "sunfall":1508364.0
	    },
	    "highlight":{
	      "night":8877401.0,
	      "array":[
	        16049906.0,
	        16777215.0,
	        12770532.0,
	        7629469.0,
	        8877401.0
	      ],
	      "morning":16049906.0,
	      "day":16777215.0,
	      "sunset":12770532.0,
	      "sunfall":7629469.0
	    },
	    "horizon":{
	      "night":8417844.0,
	      "array":[
	        16771321.0,
	        16777215.0,
	        8700671.0,
	        6183088.0,
	        8417844.0
	      ],
	      "morning":16771321.0,
	      "day":16777215.0,
	      "sunset":8700671.0,
	      "sunfall":6183088.0
	    }
	  },
	  "front":{
	    "night":11173750.0,
	    "array":[
	      15130597.0,
	      16777215.0,
	      14210510.0,
	      10062206.0,
	      11173750.0
	    ],
	    "morning":15130597.0,
	    "day":16777215.0,
	    "sunset":14210510.0,
	    "sunfall":10062206.0
	  },
	  "sky":{
	    "space":{
	      "night":984580.0,
	      "array":[
	        11630492.0,
	        16750412.0,
	        8064065.0,
	        3542805.0,
	        984580.0
	      ],
	      "morning":11630492.0,
	      "day":16750412.0,
	      "sunset":8064065.0,
	      "sunfall":3542805.0
	    },
	    "horizon":{
	      "night":4469017.0,
	      "array":[
	        15785708.0,
	        16767411.0,
	        25599.0,
	        2818129.0,
	        4469017.0
	      ],
	      "morning":15785708.0,
	      "day":16767411.0,
	      "sunset":25599.0,
	      "sunfall":2818129.0
	    },
	    "clouds":{
	      "night":7098421.0,
	      "array":[
	        14474470.0,
	        16777215.0,
	        13135735.0,
	        8802412.0,
	        7098421.0
	      ],
	      "morning":14474470.0,
	      "day":16777215.0,
	      "sunset":13135735.0,
	      "sunfall":8802412.0
	    },
	    "sun":{
	      "night":10871295.0,
	      "array":[
	        15661823.0,
	        16777215.0,
	        5621503.0,
	        2575103.0,
	        10871295.0
	      ],
	      "morning":15661823.0,
	      "day":16777215.0,
	      "sunset":5621503.0,
	      "sunfall":2575103.0
	    },
	    "moon":56575.0
	  }
	}	
}