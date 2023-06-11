extends Node2D

var speed = 32
var character 


var move_dir = Vector2(1, 0)
var player_orientation = 0

func rotate_player_right():
	var alpha = 0.5 * PI
	player_orientation += alpha
	move_dir = Vector2(move_dir.x * cos(alpha) + move_dir.y * (-sin(alpha)),
					   move_dir.x * sin(alpha) + move_dir.y * cos(alpha))
	print(move_dir)

func rotate_player_left():
	var alpha = -0.5 * PI
	player_orientation += alpha
	move_dir = Vector2(move_dir.x * cos(alpha) + move_dir.y * (-sin(alpha)),
					   move_dir.x * sin(alpha) + move_dir.y * cos(alpha))
	print(move_dir)


# Called when the node enters the scene tree for the first time.
func _ready():
	(get_node("RigidBody2D/PlayerAnimation") as AnimatedSprite2D).play("run")
	character = get_node("RigidBody2D") as RigidBody2D

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = move_dir * speed
	self.position += velocity * delta
	# self.position.x += delta * speed
	pass


func _on_rigid_body_2d_body_entered(body):
	print("collision")
	self.position -= move_dir * speed * 0.2
	rotate_player_right()
	self.rotation = player_orientation
	