var prop = engine.propEngine;

var xs1 = lengthdir_y(1, propeller.rot);
var xs2 = xs1 * -1;
var lerp1 = abs(xs1);
var c1 = merge_color(c_black, image_blend, .5 * lerp1);
var c2 = merge_color(image_blend, c_black, .5 * lerp1);


var xs3 = lengthdir_x(1, prop.rot);
var xs4 = xs3 * -1;
var lerp2 = abs(xs3);
var c3 = merge_color(c_black, image_blend, .5 * lerp2);
var c4 = merge_color(image_blend, c_black, .5 * lerp2);



// Cannon
draw_sprite_ext(spr_mob_piratesub_cannon, 1, cannon.x2, cannon.y2, 1, 1, engine.imageAngle, image_blend, 1);
draw_sprite_ext(spr_mob_piratesub_cannon, 0, cannon.x, cannon.y, 1, 1, engine.imageAngle, image_blend, 1);

// Body and Body Propellers
draw_sprite_ext(spr_mob_piratesub_propeller, 0, propeller.x, propeller.y, 1, xs1, image_angle, c1, 1);
draw_sprite_ext(spr_mob_piratesub_body, 0, xx, yy, 1, 1, image_angle, image_blend, 1);
draw_sprite_ext(spr_mob_piratesub_propeller, 0, propeller.x, propeller.y, 1, xs2, image_angle, c2, 1);

// Jaws
draw_sprite_ext(spr_mob_piratesub_body, 2, xx, yy, 1, 1, image_angle + random_range(-2, 2) + (jaw.bottomClosedAngle * jaw.closeAngle), image_blend, 1);
draw_sprite_ext(spr_mob_piratesub_body, 1, xx, yy, 1, 1, image_angle + random_range(-2, 2) + (jaw.topClosedAngle * jaw.closeAngle), image_blend, 1);

// Engine and Engine Propellers
draw_sprite_ext(spr_mob_piratesub_propeller_engine, 0, prop.x, prop.y, 1, xs3, engine.imageAngle, c3, 1);
draw_sprite_ext(spr_mob_piratesub_engine, 0, engine.x, engine.y, 1, 1, engine.imageAngle, image_blend, 1);
draw_sprite_ext(spr_mob_piratesub_propeller_engine, 0, prop.x, prop.y, 1, xs4, engine.imageAngle, c4, 1);
