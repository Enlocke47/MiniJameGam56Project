extends Node2D

var carrots = 0
var carrots_per_click = 1
var carrots_multiplier = 2
var carrots_upgrade_cost = 10
var carrots_scale = 3

var dollars = 0 
var dollars_per_carrots = 1
var dollars_multiplier = 2
var base_dpc_upgrade_cost = 10
var dollars_scale = 3
var dpc_upgrades = 0
var dpc_cost_text
var dpc_value_label

@onready var carrots_number: Label = $Currencies/carrots_number
@onready var dollar_number: Label = $Currencies/dollar_number
@onready var dp_c_button_upgrade: Button = $Carrot_Upgrade_UI/DpCButtonUpgrade
@onready var upgrade_info: Panel = $Carrot_Upgrade_UI/UpgradeInfo



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dpc_cost_text = dp_c_button_upgrade.get_node("RichTextLabel")
	dpc_value_label = upgrade_info.get_node("RichTextLabel")
	EventManager.connect("GAIN_CARROT", carrot_gainer)
	update_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_chest_button_pressed() -> void:
	dollar_gainer()
	print("test")
	
func carrot_gainer():
	carrots = carrots + carrots_per_click
	update_text()

func dollar_gainer():
	dollars = dollars + (carrots * carrot_sell_value())
	carrots = 0
	update_text()

func carrot_sell_value() -> int:
	return (dollars_per_carrots * pow(dollars_multiplier, dpc_upgrades))

func update_text(): 
	dollar_number.text = str(int(dollars))
	carrots_number.text = str(int(carrots))
	dpc_cost_text.text = str(int(dpc_upgrade_cost())) + " [img]res://assets/dollar_pixel_icon.png[/img]"
	dpc_value_label.text = "1 [img]res://assets/carrot_05.png[/img] = " + str(int(carrot_sell_value())) +" [img]res://assets/dollar_pixel_icon.png[/img]"


func _on_button_upgrade_pressed() -> void:
	if dollars > dpc_upgrade_cost():
		dollars = dollars - dpc_upgrade_cost()
		dpc_upgrades = dpc_upgrades + 1
		update_text()


func dpc_upgrade_cost() -> float:
	return base_dpc_upgrade_cost * pow(dollars_scale, dpc_upgrades)
