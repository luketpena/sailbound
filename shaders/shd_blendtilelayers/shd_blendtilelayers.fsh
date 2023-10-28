varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3		blendColor; // The color we want to blend with as a base
uniform sampler2D	s_lightsurf; // The light surface texture
uniform float		ambience; // Environmental light strength
uniform float		strength; // How much the light can effect it
varying vec2		lum_coord; // Passed from the vertex shader


void main()
{
	// Get base pixel color
    vec4 baseCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Mix base color with input blend color
	baseCol.rgb *= blendColor;
	
	// Get the brightness value of that base  color
	float brightness = (baseCol.r + baseCol.g + baseCol.b) / 3.0;
	
	 // Get light color at coordinate
    vec4 lumCol	= texture2D( s_lightsurf, lum_coord);
	
	// Strength is multiplied based on brightness
	float str = strength * (brightness * brightness) * 4.0;
	
	// Blend light color, ambient color, base color
	baseCol.rgb = vec3(baseCol.rgb + (lumCol.rgb * str * ambience));
	gl_FragColor = baseCol;
}
