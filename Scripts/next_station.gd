extends Panel
@onready var textLabel : RichTextLabel = $HBoxContainer/VBoxContainer2/RichTextLabel
@onready var acceptButton : Button = $HBoxContainer/VBoxContainer2/Accept

func _on_alpha_station_pressed() -> void:
	check_station("Alpha Station", 0)

func _on_beta_outpost_pressed() -> void:
	check_station("Beta Outpost", 1)

func _on_gamma_base_pressed() -> void:
	check_station("Gamma Base", 2)

func _on_delta_hub_pressed() -> void:
	check_station("Delta Hub", 3)

func _on_epsilon_colony_pressed() -> void:
	check_station("Epsilon Colony", 4)

func check_station(name_station : String, number : int):
	if Global.stations[Global.cur_station]["name"] == name_station:
		textLabel.text = "Actual Station"
		acceptButton.visible = false
	else:
		textLabel.text = "You have a mission! The " + name_station + " wants "
		for i in Global.stations[Global.cur_station]["resources"]:
			textLabel.text += i + ", "
		textLabel.text += "\nThey want to pay " + str(Global.distance[Global.cur_station][number] * 100)
		acceptButton.visible = true
		Global.target_station = number

func _on_accept_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/delivery.tscn")
