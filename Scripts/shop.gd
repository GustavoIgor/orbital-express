extends Panel

@onready var label_cure = $VBoxContainer/HBoxContainer/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label_cure.text = "Money needed: " + str(Global.money * 0.1)
	pass

func _on_cure_pressed() -> void:
	Global.money = Global.money - Global.money * 0.1
	Global.life = 100
