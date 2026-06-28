extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventManager.connect("HIDE_CARROT_UI", UI_control)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func UI_control():
	if visible:
		visible = false
	else:
		visible = true
