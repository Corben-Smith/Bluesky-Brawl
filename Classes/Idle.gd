#Creator: Corben
#Date Crated: 12/22/23
#Last Modified: 12/22/23
#Purpose: Idle State, For where there is not inputs
#Don't have most of this together yet

extends State
class_name Idle

func enter():
	animator.stop(true)
	animator.play("Idle")



func update(delta):
	pass
