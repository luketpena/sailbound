function hullStats_classic() {
	hullSetGameplayStats(20);
	return new HullStats(
		new VerticalStats(40, 6, .8, 30, 5, .8, .6, 4, 80),
		new HorizontalStats(2, .95, 3),
		new HullSizeStats(48, 10, 4, 4),
		new HullDrawStats(spr_hull_classic, spr_sail_classic, 180, 8),
		new ColliderStats(28, 12),
		new HullWakeStats(-10, 4)
	);
}

function hullStats_banana() {
	hullSetGameplayStats(16);
	return new HullStats(
		new VerticalStats(35, 7, .8, 40, 6, .8, .7, 5, 70),
		new HorizontalStats(2.5, .98, 2),
		new HullSizeStats(48, 7, 2, 2),
		new HullDrawStats(s_hull_banana, s_sail_banana, 180, 8),
		new ColliderStats(28, 12),
		new HullWakeStats(-10, 4)
	);
}

function hullStats_raft() {
	hullSetGameplayStats(12);
	return new HullStats(
		new VerticalStats(30, 7, .9, 20, 5, 1, .7, 6, 65),
		new HorizontalStats(2, .95, 3),
		new HullSizeStats(32, 10, 4, 4),
		new HullDrawStats(spr_hull_raft, spr_sail_raft, 180, 8),
		new ColliderStats(30, 8),
		new HullWakeStats(-10, 4)
	);
}

function hullStats_steamboat() {
	hullSetGameplayStats(24);
	return new HullStats(
		new VerticalStats(35, 6, .95, 25, 5, 1, .8, 8, 100),
		new HorizontalStats(3.5, .8, 3),
		new HullSizeStats(48, 10, 6, 6),
		new HullDrawStats(s_hull_steamboat, null, 180, 8),
		new ColliderStats(30, 16),
		new HullWakeStats(10, 24)
	);
}