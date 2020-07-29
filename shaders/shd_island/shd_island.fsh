//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 horizon_col;
uniform float pwr;

void main()
{
  vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	base_col.rgb = mix(base_col.rgb, horizon_col.rgb, pwr);
	
	gl_FragColor = base_col;
}
