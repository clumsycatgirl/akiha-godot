class_name StateMachine
extends Node2D

var current_state: State
@export var initial_state: State

func init() -> void:
	update_state(initial_state)

func update_state(new_state: State) -> void:
	if (!new_state): return
	if (current_state): current_state.exit(new_state)
	current_state = new_state
	current_state.enter()

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	update_state(new_state)
	
func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	update_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	update_state(new_state)
