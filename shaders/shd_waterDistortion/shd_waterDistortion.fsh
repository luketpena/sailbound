varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D distort_tex;
uniform float time;
uniform vec3 blend_color;

const float size = 1.0;
const float strength = 0.01;


void main() {
	vec2 distort;
	distort.x = texture2D( distort_tex, fract(v_vTexcoord * size + vec2(time, 0.0))).r * strength;
	distort.y = texture2D( distort_tex, fract(v_vTexcoord * size * 3.4 + vec2(0.0, time*1.6))).g * strength * 1.3;
	
	gl_FragColor = v_vColour * texture2D (gm_BaseTexture, v_vTexcoord + distort);
	gl_FragColor.rgb = mix(gl_FragColor.rgb, blend_color, .25);

}