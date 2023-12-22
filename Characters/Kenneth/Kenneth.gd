extends CharacterBody2D

@export var Machine: StateMachine

func _ready():
	if !Machine:
		Machine = $StateMachine

func _process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("Left") - Input.get_action_strength("Right"),
		Input.get_action_strength("Down") - Input.get_action_strength("Up")
	)
	
	if input_direction.x < 0 && Machine.current_state.name.to_lower() == "idle":
		print_debug("Wal")
		Machine.change_state("walkforward")
	elif input_direction.x > 0 && Machine.current_state.name.to_lower() == "idle":
		print_debug("Wal")
		Machine.change_state("walkbackward")
	elif input_direction == Vector2.ZERO && Machine.current_state.name.to_lower() != "idle":
		Machine.change_state("idle")

func _physics_process(delta):
	print_debug(Machine.current_state.name)
	if Machine:
		print_debug(Machine.velocity)
		velocity = Machine.velocity
	move_and_slide()
