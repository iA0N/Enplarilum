shader_type spatial;

uniform float height_scale = 0.5;
uniform sampler2D noise;
uniform sampler2D normalmap;

varying vec2 tex_position;

void vertex() {
  VERTEX.y += cos(VERTEX.x * 4.0 * TIME) * sin(VERTEX.z * 4.0 + TIME);
}