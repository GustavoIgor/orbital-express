extends CanvasLayer

func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	Global.change_scene_with_fade("res://Scenes/station.tscn")
