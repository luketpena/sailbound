function prop_seaweed() {
	return 	{
		name: "Seaweed",
		collection: [
			{
				sprite: spr_seaweed_48,
				depthLimit: 48,
			},
			{
				sprite: spr_seaweed_32,
				depthLimit: 32,
			},
			{
				sprite: spr_seaweed_16,
				depthLimit: 16,
			},
		],
		chance: 15,
		steepnessLimit: 20,
	}
}

function prop_coralReef() {
	return {
		name: "Coral Reefs",
		sprite: spr_coral,
		depthLimit: 64,
		chance: 15,
		steepnessLimit: 5,
	}
}

function prop_magmaPits() {
	return {
		name: "Magma Pits",
		sprite: s_prop_magmaPits,
		depthLimit: 32,
		chance: 15,
		steepnessLimit: 5,
	}
}

function prop_magmaStalagtite() {
	return {
		name: "Magma Stalagtite",
		sprite: s_prop_magmaStalagtite,
		depthLimit: 32,
		chance: 15,
		steepnessLimit: 5,
	}
}