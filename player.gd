extends Node2D

var speed = 32
var character 

# Called when the node enters the scene tree for the first time.
func _ready():
	(get_node("RigidBody2D/PlayerAnimation") as AnimatedSprite2D).play("run")
	character = get_node("RigidBody2D") as RigidBody2D

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x += delta * speed
	pass


func _on_rigid_body_2d_body_entered(body):
	print("collision")
	self.rotation = 3.1415 / 2
	pass # Replace with function body.
