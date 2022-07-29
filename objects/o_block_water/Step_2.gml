setMinMax();
for (var i=0; i<waveCount; i++) {
	var wave = waves[i];
	wave.angle = (wave.angle + wave.rate) mod 360;
}

for (var i=0; i<waveCount; i++) {
	var wave = waves[i];
	waveOffset[i] =	[];
	for (var j=0; j<wave.divCount; j++) {
		var offset = wave.setOffset(j);
		array_push(waveOffset[i], offset);
	}
}


for (var i=minMax.iMin; i<minMax.iMax; i++) {
	var point = points[i];
	var pointOffset = 0;
	for (var j=0; j<waveCount; j++) {
		var wave = waves[j];
		pointOffset += wave.getOffset(i);
	}
	point.y = y + pointOffset;
}

log(minMax);