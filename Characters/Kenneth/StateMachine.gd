#Creator: Corben
#Date Crated: 12/22/23
#Last Modified: 12/22/23
#Purpose: 
#This is the statemachine for the character
#This controls which of the states the player is currently in. i think that we should have it to where the 
#the player goes into different states to move, do moves, etc.

#Note 12/22/23
#I am currently working on making it to where the character have a move and idle state. Not sure how to get moves working yet tho.


extends Node
class_name StateMachine

var current_state: State
var velocity: Vector2

@export var animator: AnimationPlayer

var states: Dictionary = {}

func _ready():
	if !animator:
		animator = get_parent().get_node("AnimatedSprite2D").get_node("AnimationPlayer")
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	
	states["idle"].enter()
	current_state = states["idle"]

func _process(delta):
	velocity = current_state.velocity
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)

func on_child_transitioned(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state

func change_state(new_state_name: String):
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	current_state.exit()
	current_state = new_state
	new_state.enter()

