function StoryMobUrchin() : StoryMob(
	"urchin",
	function() { spawn_urchin(); },
	MobDanger.Urchin,
	3, 8,
	seconds(1.5)
) constructor {}

function StoryMobSeagull() : StoryMob(
	"seagull",
	function() { spawn_seagull(); },
	MobDanger.Seagull,
	1, 15,
	seconds(.5),
	seconds(5)
) constructor {}

function StoryMobSeagullGang() : StoryMob(
	"seagullGang",
	function() { repeat(3) spawn_seagull(); },
	MobDanger.Seagull * 3,
	10, 30,
	seconds(4)
) constructor {}

function StoryMobChomper() : StoryMob(
	"chomper",
	function() { spawn_chomper(); },
	MobDanger.Chomper,
	1, 8,
	seconds(5),
	seconds(1)
) constructor {}

function StoryMobChomperSquad() : StoryMob(
	"chomperSquad",
	function() {
		spawn_chomper(1); // Left side, facing right
		spawn_chomper(-1); // Right side, facing left
	},
	MobDanger.Chomper * 2,
	10, 30, seconds(4)
) constructor {}

function StoryMobPuffer() : StoryMob(
	"puffer",
	function() { spawn_puffer(); },
	MobDanger.Puffer,
	3, 8,
	seconds(.5)
) constructor {}

function StoryMobLavaWall() : StoryMob(
	"lavaWall",
	function() { spawn_lavaFall(); },
	MobDanger.LavaWall,
	2, 8,
	seconds(.5),
	seconds(8)
) constructor {}

function StoryMob(
	_name,
	_spawnFunction,
	_MobDanger,
	_cooldownMin,
	_cooldownMax,
	_chance,
	_initialCooldown = 0,
) constructor {
	name = _name;
	spawnFunction = _spawnFunction;
	danger = _MobDanger;
	chance = _chance;
	
	cooldownMin = _cooldownMin;
	cooldownMax = _cooldownMax;
	cooldown = _initialCooldown;
}