extends Panel
@onready var fuel_progress_bar : ProgressBar = $HBoxContainer/VBoxContainer/Fuel/ProgressBar
@onready var fuel_label : Label = $HBoxContainer/VBoxContainer/Fuel/ProgressBar/Label
@onready var life_progress_bar : ProgressBar = $HBoxContainer/VBoxContainer/Life/ProgressBar
@onready var life_label : Label = $HBoxContainer/VBoxContainer/Life/ProgressBar/Label
@onready var money_label : Label = $HBoxContainer/VBoxContainer/Money/Label
@onready var days_label : Label = $HBoxContainer/VBoxContainer/Days/Label
@onready var info : RichTextLabel = $HBoxContainer/RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fuel_progress_bar.value = Global.fuel
	fuel_label.text = str(Global.fuel)
	life_progress_bar.value = Global.life
	life_label.text = str(Global.life)
	money_label.text = "Money: " + str(Global.money)
	days_label.text = "Days: " + str(Global.days)
	pass

func _on_fuel_mouse_entered() -> void:
	info.text = "Fuel: It's used to travel between galaxies, don't ask yourself how it makes the ship runs in lightspeed, maybe even the scientists are amazed."

func _on_money_mouse_entered() -> void:
	info.text = "Money: A currency. Most Universe uses this coin, it's gets crazy when election comes out... somethings never change even after thousands of years, right? Get 10000 to WIN the game."

func _on_days_mouse_entered() -> void:
	info.text = "Days: the how many times a celestial body rotates completely around its own axis. Even so many planets exists in the cosmos, it's still based on Earth (Now called 'Genisis') cycles."

func _on_life_mouse_entered() -> void:
	info.text = "Life: It's you ship integrity, the lower the more damaged the ship is. Be careful with your precious ship! When it gets to 0 it's Game Over!"
