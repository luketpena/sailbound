//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 baseCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	baseCol = floor(baseCol * 4.0) / 4.0;
    gl_FragColor = baseCol;
}
