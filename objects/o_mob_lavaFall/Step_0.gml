x += ceiling.move.speed;

array_foreach(colliders, function(_collider, _index) {
	_collider.phy_position_x = x;
	_collider.phy_position_y += scrollRate;
	if (_collider.phy_position_y >= y + height) {
		_collider.phy_position_y = y - colliderHeight - gap
	}
});


lightBottom.x = x + 8;
lightTop.x = x + 8;

if (!instance_exists(ceiling) || x < -ceiling.margin) instance_destroy();