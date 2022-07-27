//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;

void main()
{
	vec4 baseCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float baseAlpha = baseCol.a;
	float count = 0.0;
	vec2 offset;
	offset.y = pixelH;
	for (float i=1.0; i<50.0; i += 1.0) {
		float value = texture2D(gm_BaseTexture, v_vTexcoord - offset * i).a;
		if (value > 0.0) {
			count += 1.0;	
		}
	}
	baseCol.a = (1.0 - (count / 10.0)) * baseAlpha;
	gl_FragColor = baseCol;
}
