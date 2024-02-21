shader_type spatial;

//Uniforms defined here
uniform vec4 color;
uniform float normalmap_scale;
uniform float spec;
uniform float rough;
uniform float water_speed;
uniform sampler2D normals;

void fragment() {
	//The normal map thing here is for both making the water move and increasing the size
	vec4 normal = texture(normals, UV * vec2(6,6) * (TIME * water_speed));
	
	//Standard PBR stuff here
	ALBEDO = color.xyz;
	SPECULAR = spec;
	ROUGHNESS = rough;
	ALPHA = color.a;
	NORMALMAP = normal.xyz;
}