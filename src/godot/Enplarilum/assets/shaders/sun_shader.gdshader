shader_type spatial;

uniform float height_scale = 0.9;
uniform sampler2D noise;
uniform sampler2D jitter;
uniform sampler2D sa;
uniform sampler2D normalmap;

varying vec2 tex_position;




void vertex() {
  VERTEX.y += texture(noise, VERTEX.xz / 23.0 + 0.01 * TIME).y;
}
void fragment() {
	//EMISSION = vec3(10,10,10);
}