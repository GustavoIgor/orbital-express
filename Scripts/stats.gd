extends Panel
@onready var fuel_progress_bar : ProgressBar = $HBoxContainer/VBoxContainer/Fuel/ProgressBar
@onready var fuel_label : Label = $HBoxContainer/VBoxContainer/Fuel/ProgressBar/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fuel_progress_bar.value = Global.fuel
	fuel_label.text = str(Global.fuel)
	pass
