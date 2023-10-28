/*
	Can apply a blend shader to tiles
*/

targetLayer = null;
strength = 0;

function init(_targetLayer, _strength) {
	targetLayer = _targetLayer;
	strength = _strength;
	layer_shader(targetLayer, shd_blendTileLayers);
	layer_script_begin(targetLayer, function() {
		if (instance_exists(sys_town)) {
			sys_town.updateBlendShader(strength);	
		}
	});
	instance_destroy();
}
