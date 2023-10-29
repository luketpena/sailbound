islandTypes = [TropicalIsland, SpikedIsland];

islandList = [];
islandSpeed = new MinMax(-.1, -.5);

u_color = shader_get_uniform(shd_fadeColor,"color"); //To what color does it fade?
u_pwr = shader_get_uniform(shd_fadeColor,"pwr"); //How far does it fade to that color?

alarm[0] = seconds(1);

function addIsland(_island) {
	array_push(islandList, _island);
	array_sort(islandList, function(_a, _b) {
		return round(_a.depth * 100) - round(_b.depth * 100);
	})	
}