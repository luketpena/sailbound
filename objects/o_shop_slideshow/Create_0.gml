function ShopSlideshowCard(_sprite, _price, _title, _description, _index) constructor {
	sprite = _sprite;
	price = _price;
	title = _title;
	index = _index;
	description = _description;
	scale = 1;
	
	function draw() {
		var active = (o_shop_slideshow.selectIndex = index);
		var w = o_shop_slideshow.cardWidth;
		var h = o_shop_slideshow.cardHeight;
		var m = o_shop_slideshow.margin;
		
		var offset = (index - o_shop_slideshow.slideIndex) * (w + m);
		var xx = global.hvw + offset;
		var yy = (h * .5) + 32;
		var a = active ? 1 : .25;
		
		if (!active) {
			draw_set_alpha(a);
			draw_set_font(global.font_normal_small);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_text_ext(xx, yy, title, 12, w);
			
			if (scale > 1) scale += (1 - scale) * .2;
		} else {
			if (scale < 2) scale += (1.5 - scale) * .2;	
		}
		
		draw_sprite_ext(s_shop_slideshow_cardBorder, 0, xx, yy, 1, 1, 0, c_white, a);
		draw_sprite_ext(sprite, 0, xx, yy - h * .25, scale, scale, 0, c_white, a);		
	}
}

selectIndex = 0;
slideIndex = 0;
cardCount = 5;
cardWidth = 96;
cardHWidth = cardWidth / 2;
cardHeight = 128;
margin = 24;
deck = [];
bottom = 64 + cardHeight;

for (var i=0; i<cardCount; i++) {
	var newCard = new ShopSlideshowCard(
		spr_hull_classic, 200,
		"SHIP NAME" + string(i),
		"AN AWESOME SHIP THAT WE HOPE YOU WANT TO BUY. THIS TEXT OUGHT TO BE VERY LONG TO TEST HOW IT FITS ON THE SCREEN!##SHOULD BE A NEW LINE.",
		i);
	array_push(deck, newCard);
}

function next() {
	selectIndex = (selectIndex + 1) mod cardCount;	
}

function prev() {
	selectIndex--;
	if (selectIndex < 0) {
		selectIndex = cardCount - 1;	
	}
}