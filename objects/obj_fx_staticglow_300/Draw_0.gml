if (flicker) {
	var alphaTarget = random_range(alphaSet - .2, alphaSet);
	image_alpha += (alphaTarget - image_alpha) * .2;
}

gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
gpu_set_blendmode(bm_normal);