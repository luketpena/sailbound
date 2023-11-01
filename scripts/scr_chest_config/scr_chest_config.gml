function GoldChest() : Chest(s_chest_gold, 20, 17, -8) constructor {}
function SilverChest() : Chest(s_chest_silver, 10, 13, -6) constructor {}
function BronzeChest() : Chest(s_chest_bronze, 5, 9, -4) constructor {}

function Chest(
	_sprite,
	_coins,
	_glowWidth,
	_glowX
) constructor {
	sprite = _sprite;
	coins = _coins;
	glowWidth = _glowWidth;
	glowX = _glowX;
}