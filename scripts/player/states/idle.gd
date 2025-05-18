class_name PlayerStateIdle
extends PlayerState

func enter() -> void:
	print("idle")
	player.animator.play(animation_idle)

func process_input(event: InputEvent) -> State:
	super(event)
	var attack_state := _check_attack_input(event)
	if attack_state: return attack_state
			
	if event.is_action_pressed(key_left): return state_walk_back_start
	if event.is_action_pressed(key_right): return state_walk_front_start
	
	return null
