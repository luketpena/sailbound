//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float alpha;

void main()
{
	vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	float myAlpha = alpha;
	if (base_col.a == 0.0) myAlpha = 0.0;
	gl_FragColor = v_vColour * vec4(base_col.rgb, myAlpha);
}