//-----------------------------------------------------------------------------
// Blend Shader: Blends a sprite with a surface colour based on the sprites
// position on that surface
//
// Vertex Shader: get texture coordinates of the surface
//-----------------------------------------------------------------------------

attribute vec3	in_Position;
attribute vec4	in_Colour;
attribute vec2	in_TextureCoord;

varying vec2	v_vTexcoord;
varying vec4	v_vColour;

uniform vec2	surface_offset; // view postion in room in surface widths -> (view.x / view_width | view.y / view_h)

varying vec2	lum_coord;


void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position	= gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord	= in_TextureCoord;
	
	lum_coord.x =  gl_Position.x * 0.5 + 0.5 + surface_offset.x;
	lum_coord.y = -gl_Position.y * 0.5 + 0.5 + surface_offset.y; // -gl_Position because the y-axis of gl_Position is flipped
	
	/* EXPLANATION:
	//-------------------------------------------------------------------------
	First of the best part:
	
	Because we don't use uvs:
	- Sprite origin doesn't matter
	- Sprite doesn't need to be on its own texture page!!!
	
	Now to the how and why:
	All we need is another coordinate system for the second texture. We'll call it lum_coord.
	Now since the second texture is a surface spanning over the whole view we can use gl_Position.
	
	gl_Position ranges from -1|-1 to +1|+1
		0|0 is the center of the screen
		-1|-1 is the bottom-left (not top left!!!)
		1|1 is the top right (not bottom right!!)
		
	So we grab gl_Position, convert it to a system ranging from 0| to 1|1 and add a surface offset.
	The surface offset btw. is only needed in case the surfaces top-left is not at the room
	coordinates 0|0. In another words: if view size equals room size and never moves, we wont need 
	the offset.
	
	Since lum_coord is depending on gl_Position, gl_Position was caalculated from in_Position
	and in_Position is a vertex attribute, lum_coord will get interpolated like any other varying
	derived from a vertex attribute. And so we can use the interpolated value in the fragment shader.
	
	And since gl_Position ignores the rotation of the base tesxture we can completely ignore
	rotation as well.
	
	All there is to do is passing this coordinate system to the fragment shader and use it
	to get the sample on the surface.
	*/
}