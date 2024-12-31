extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var colorRect = $ColorRect
# Callback que será chamado após o fade
var on_fade_complete: Callable = Callable()

func _ready() -> void:
	colorRect.visible = false
	animation_player.animation_finished.connect(_on_AnimationPlayer_animation_finished)

# Inicia o fade in (desaparece para transparente)
func fade_in(callback: Callable = Callable()) -> void:
	colorRect.visible = true
	on_fade_complete = callback
	animation_player.play("fade_in")

# Inicia o fade out (aparece para opaco)
func fade_out(callback: Callable = Callable()) -> void:
	colorRect.visible = true
	on_fade_complete = callback
	animation_player.play("fade_out")

# Chamado no final da animação (defina isso como sinal no AnimationPlayer)
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name in ["fade_in", "fade_out"]:
		if on_fade_complete and on_fade_complete.is_valid():
			on_fade_complete.call_deferred()
