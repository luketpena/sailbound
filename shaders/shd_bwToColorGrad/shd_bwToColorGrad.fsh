//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 color1;
uniform vec3 color2;

void main()
{
    vec4 baseCol= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(mix(color1,color2,baseCol.r), 1.0);
}
