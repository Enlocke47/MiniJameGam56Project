extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_chest_button_button_down() -> void:
	animated_sprite_2d.scale = Vector2(0.8, 0.8)
	animated_sprite_2d.frame = 1


func _on_chest_button_button_up() -> void:
	animated_sprite_2d.scale = Vector2(1, 1)
	animated_sprite_2d.frame = 0
