//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float multiplier = ceil((base_col.r + base_col.g + base_col.b)/3.0);
	base_col.a = base_col.a * multiplier;
	gl_FragColor = base_col;
}
