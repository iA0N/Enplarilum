shader_type spatial;

uniform float time : hint_range(0.0, 10.0);
uniform float scale : hint_range(1.0, 10.0);
uniform float intensity : hint_range(0.1, 1.0);

void fragment() {
    // Create a noise value based on time and coordinates
    vec2 noiseCoords = FRAGCOORD.xy / (SCREEN_SIZE * scale);
    float noiseValue = noise(noiseCoords + vec2(time, time)) * 0.5 + 0.5;

    // Apply intensity and set it as the color
    COLOR = vec4(vec3(noiseValue) * intensity, 1.0);
}
