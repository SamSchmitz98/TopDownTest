shader_type canvas_item;

uniform vec3 custom_color;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    
    // Check if the pixel is white
    if (color.rgb == vec3(1.0, 1.0, 1.0)) {
        // Change white pixels to red
        color.rgb = custom_color;
    }
    
    COLOR = color;
}