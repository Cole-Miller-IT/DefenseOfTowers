shader_type canvas_item;

// Uniform for the erosion texture
uniform sampler2D erosion;

// Uniform for controlling erosion over time
uniform float erosion_time = 0.0;

// Maximum offset for the erosion
const float erosion_max_offset = 2.0;

void fragment() {
    // Get the base UV coordinates
    vec2 base_uv = UV;

    // Get the color from the current texture of the sprite
    vec4 albedo_tex = texture(TEXTURE, base_uv);
    
    // Get the value from the erosion texture
    vec4 erosion_tex = texture(erosion, base_uv);
    
    // Calculate erosion values based on the erosion_time uniform
    float erosion_min = erosion_time;
    float erosion_max = erosion_min + erosion_max_offset;
    float erosion_val = smoothstep(erosion_min, erosion_max, erosion_tex.r);
    
    // Set the alpha value of the fragment based on the erosion value
    albedo_tex.a *= erosion_val;
    
    // Set the final color and alpha for the fragment
    COLOR = albedo_tex;
}