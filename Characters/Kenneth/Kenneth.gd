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
	
	var desired_state: String = ""
	if input_direction.x < 0:
		desired_state = "WalkForward"
	elif input_direction.x > 0 :
		desired_state = "WalkBackward"
	elif input_direction.y > 0 :
		desired_state = "Crouch"
	elif Input.is_action_just_pressed("Light"):
		desired_state = "NLight"
	elif input_direction.x == 0:
		desired_state = "Idle"
		
	
	if desired_state.to_lower() != Machine.current_state.name.to_lower():
		Machine.change_state(desired_state)

func _physics_process(delta):
	print_debug(Machine.current_state.name)
	if Machine:
		velocity = Machine.velocity
	move_and_slide()
