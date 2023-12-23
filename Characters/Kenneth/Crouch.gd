extends State
class_name Crouch

# Called when the node enters the scene tree for the first time.
func enter():
	animator.play("IntoCrouch")
	animator.queue("Crouched")

func physics_update(_delta):
	pass

func exit():
	animator.queue("OutCrouch")
