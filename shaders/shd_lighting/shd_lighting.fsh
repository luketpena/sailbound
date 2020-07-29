//-----------------------------------------------------------------------------
// Blend Shader: Blends a sprite with a surface colour based on the sprites
// position on that surface
//
// Fragment Shader: blend the sprite colour with the surface colour
//-----------------------------------------------------------------------------

varying vec2 v_vTexcoord;
varying vec4 v_vColour;


uniform sampler2D	s_lightsurf;	// light surface sampler id
uniform float		ambience;		// ambience colour
varying vec2		lum_coord;		// coordinate for the light surface sample, calcualted in vertex shader
uniform float flash;

void main()
{
	vec4 base_col	= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
    vec4 lum_col	= texture2D( s_lightsurf, lum_coord);
	
	float str	= clamp((base_col.r + base_col.g + base_col.b),0.0,0.6);
	str *= str;
	
	gl_FragColor = vec4((base_col.rgb + flash + (lum_col.rgb*0.1) + (lum_col.rgb*str) * ambience * 2.0),base_col.a);
}


