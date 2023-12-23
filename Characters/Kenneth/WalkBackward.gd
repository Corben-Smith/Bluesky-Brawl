extends State
class_name WalkBackward

# Called when the node enters the scene tree for the first time.
func enter():
	animator.stop()
	animator.play("WalkForward")

func physics_update(_delta):
	velocity = Vector2(-100,0)

func exit():
	pass
