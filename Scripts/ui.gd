extends CanvasLayer
@onready var life_label = $Control/VBoxContainer/HBoxContainer/Life
@onready var money_gained = $Control/VBoxContainer/HBoxContainer2/MoneyGained
@onready var asteroid_spawner = $"../AsteroidSpawner"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	life_label.text = "Life: " + str(Global.life)
	money_gained.text = "Money until now: " + str(asteroid_spawner.money_now)
	pass
