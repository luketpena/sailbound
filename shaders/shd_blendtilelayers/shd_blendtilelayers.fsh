varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3		blendColor;
uniform sampler2D	s_lightsurf;
uniform float		ambience;
uniform float		strength;
varying vec2		lum_coord;	


void main()
{
	// Initial blend
    vec4 baseCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float brightness = (baseCol.r + baseCol.g + baseCol.b) / 3.0;
	baseCol.rgb *= blendColor;
	//baseCol = vec4(mix(vec3(0.0), blendColor, brightness), baseCol.a);
	
	 //Apply lighting

    vec4 lumCol	= texture2D( s_lightsurf, lum_coord);
	
	// Strength is multiplied based on brightness
	float str = strength * (brightness * brightness) * 4.0;
	
	baseCol.rgb = vec3(baseCol.rgb + (lumCol.rgb * str) * ambience);
	gl_FragColor = baseCol;
}
