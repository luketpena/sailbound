varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D distort_tex;
uniform vec3 blend_color;

const float size = 1.0;
const float strength = 0.005;


void main() {
	vec2 distort;
	distort.x = texture2D( distort_tex, fract(v_vTexcoord * size )).r;
	distort.y = texture2D( distort_tex, fract(v_vTexcoord * size )).g;
	
	distort = ((distort*2.0)-1.0) * strength;
	distort.x *= 3.0;
	
	gl_FragColor = v_vColour * texture2D (gm_BaseTexture, v_vTexcoord + distort);
	gl_FragColor.rgb = mix(gl_FragColor.rgb, blend_color, .2);
}