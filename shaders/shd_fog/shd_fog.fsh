//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float alpha;
uniform vec3 color;

void main()
{
	vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	base_col.a = (base_col.r + base_col.g + base_col.b) / 3.0;
	base_col.a *= alpha;
	base_col.rgb = color.rgb;
	
  gl_FragColor = base_col;
}
