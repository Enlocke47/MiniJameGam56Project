extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_button_pressed() -> void:
	EventManager.emit_signal("GAIN_CARROT")
	
	


func _on_button_button_up() -> void:
	sprite_2d.scale = Vector2(5, 5)


func _on_button_button_down() -> void:
	sprite_2d.scale = Vector2(4, 4)
