//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float strength;
uniform vec3 color;

void main()
{
    vec4 baseCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(mix(baseCol.rgb,color,strength),1.0);
}
