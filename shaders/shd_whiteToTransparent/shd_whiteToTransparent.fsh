//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 baseCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	baseCol.a = 1.0 - ((baseCol.r + baseCol.g + baseCol.b) / 3.0);
	gl_FragColor = baseCol;
	
}
