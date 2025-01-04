class_name Asteroid extends Area2D

enum  AsteroidSize{LARGE, MEDIUM, SMALL}

@export var size := AsteroidSize.LARGE
@onready var sprite := $Sprite2D
@onready var collision := $CollisionShape2D
var movement_vector := Vector2(0, -1)
var speed := 100

var money_gained : int:
	get:
		match size:
			AsteroidSize.LARGE:
				return 100
			AsteroidSize.LARGE:
				return 50
			AsteroidSize.LARGE:
				return 250
			_:
				return 0

signal exploded

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = randf_range(0, 2*PI)
	match size:
		AsteroidSize.LARGE:
			speed = randf_range(50, 100)
			sprite.texture = preload("res://Assets/Meteor_1.png")
			collision.shape = preload("res://Resources/asteroid_cshape_large.tres")
		AsteroidSize.MEDIUM:
			speed = randf_range(100, 150)
			sprite.texture = preload("res://Assets/Meteor_2.png")
			collision.shape = preload("res://Resources/asteroid_cshape_medium.tres")
		AsteroidSize.SMALL:
			speed = randf_range(125, 200)
			sprite.texture = preload("res://Assets/Meteor_3.png")
			collision.shape = preload("res://Resources/asteroid_cshape_small.tres")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += movement_vector.rotated(rotation) * speed * delta
	var radius = collision.shape.radius
	var screen_size = get_viewport_rect().size
	if global_position.y < 0:
		global_position.y = screen_size.y
	elif global_position.y > screen_size.y:
		global_position.y = 0
	if global_position.x < 0:
		global_position.x = screen_size.x
	elif global_position.x > screen_size.x:
		global_position.x = 0

func explode():
	emit_signal("exploded", global_position, size, money_gained)
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "SpaceShip":
		emit_signal("exploded", global_position, size, money_gained)
		Global.life -= 10
		queue_free()
