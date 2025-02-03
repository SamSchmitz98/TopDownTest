extends Node2D

@onready var sprite = $AnimatedSprite2D  # Reference to the sprite

func _ready():
	sprite.animation_finished.connect(_on_animation_finished)  # Connect signal
	sprite.play("default")  # Start animation

func _on_animation_finished():
	queue_free()  # Destroy the sprite when the animation ends
