extends Node2D

@export var offsetX: int = 0
@export var offsetY: int = 0

@onready var toggleMap = {
	$"Control/Panel/Hat Btn": $Hat,
	$"Control/Panel/Shirt Btn": $Shirt,
	$"Control/Panel/Pant Btn": $Pant,
	$"Control/Panel/Shoes Btn": $Shoes
}

func _ready():
	for button in toggleMap.keys():
		if button == null:
			print("Error: A button path is incorrect!")
			continue
		
		var node = toggleMap[button]
		if node == null:
			print("Error: A target node path is incorrect!")
			continue
		
		node.visible = false
		button.pressed.connect(_on_button_pressed.bind(button))  # Fix connection
		print("Connected:", button.name, "to", node.name)
		
func _on_button_pressed(button: Button):
	var node = toggleMap[button]
	node.visible = true
	node.position = get_global_mouse_position() + Vector2(offsetX, offsetY)

func _process(delta: float):
	# if the button is pressed, set node position =  mouse position, else hide it and reset its position
	for button in toggleMap.keys():
		if toggleMap[button].visible and button.button_pressed:
			toggleMap[button].position = get_global_mouse_position() + Vector2(offsetX, offsetY)
		else: 
			toggleMap[button].visible = false

