extends CharacterBody2D

@onready var hatArea: Area2D = $"Hat Area/HatArea2D"
@onready var shirtArea: Area2D = $"Shirt Area/ShirtArea2D"
@onready var pantArea: Area2D = $"Pant Area/PantArea2D"
@onready var shoesArea: Area2D = $"Shoes Area/ShoesArea2D"

func _ready():
	$PlayerSprite2D.visible = true
	$HatSprite2D.visible = false
	$ShirtSprite2D.visible = false
	$PantSprite2D.visible = false
	$ShoesSprite2D.visible = false
	
	hatArea.monitoring = true
	shirtArea.monitoring = true
	pantArea.monitoring = true
	shoesArea.monitoring = true
	
	hatArea.connect("area_entered", Callable(self, "_on_area_entered").bind(0))
	print("Connected hatArea signal")

	shirtArea.connect("area_entered", Callable(self, "_on_area_entered").bind(1))
	pantArea.connect("area_entered", Callable(self, "_on_area_entered").bind(2))
	shoesArea.connect("area_entered", Callable(self, "_on_area_entered").bind(3))

func _on_area_entered(area: Area2D, areaNumber: int):
	print("_on_area_entered called with areaNumber: ", areaNumber)
	match areaNumber:
		0:
			$HatSprite2D.visible = true
		1:
			$ShirtSprite2D.visible = true
		2:
			$PantSprite2D.visible = true
		3:
			$ShoesSprite2D.visible = true
