class_name State
extends Node2D

func enter() -> void:
	pass

func exit(_new_state: State = null) -> void:
	pass
	
func process_frame(_delta: float) -> State:
	return null
	
func process_input(_event: InputEvent) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
