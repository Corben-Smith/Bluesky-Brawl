#Creator: Corben
#Date Crated: 12/22/23
#Last Modified: 12/22/23
#Purpose: DO NOT USE ON OWN. This is the class that other stats inherit from
extends Node
class_name State

@onready var Machine: Node = get_parent()
var animator: AnimationPlayer

var velocity: Vector2 = Vector2.ZERO

func _ready():
	animator = get_parent().animator

func update(_delta):
	pass

func physics_update(_delta):
	pass

func transitioned():
	pass

func enter():
	pass

func exit():
	pass
