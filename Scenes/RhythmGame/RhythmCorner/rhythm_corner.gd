extends Node2D
@export var keyPress: String
@export var color: Color = Color.WHITE:
	set(value):
		color = value
		update_shader_color()
		
var cur_color: Color = color:
	set(value):
		cur_color = value
		update_shader_color()

func update_shader_color():
	if has_node("Sprite2D"):
		var sprite = $Sprite2D
		if sprite.material and sprite.material is ShaderMaterial:
			var shader_material = sprite.material as ShaderMaterial
			if shader_material.resource_local_to_scene == false:
				shader_material = shader_material.duplicate()
				shader_material.resource_local_to_scene = true  # Ensure this material is local to the instance
				sprite.material = shader_material
			shader_material.set_shader_parameter("custom_color", cur_color)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_shader_color()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	if event.is_action_pressed(keyPress):
		cur_color = Color.WHITE
	else:
		cur_color = color
	pass
