extends CanvasLayer

@onready var colorRect = $ColorRect
@onready var animation = $AnimationPlayer

signal transition_finished

func _ready() -> void:
	colorRect.visible = false
	animation.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_in":
		transition_finished.emit()
		animation.play("fade_out")
	elif anim_name == "fade_out":
		colorRect.visible = false

func transition():
	colorRect.visible = true
	animation.play("fade_in")
