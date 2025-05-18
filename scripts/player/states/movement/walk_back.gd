class_name PlayerStateWalkBack
extends PlayerState

func enter() -> void:
	super()
	print("4")
	player.animator.play(animation_walk_back())
	
func process_input(event: InputEvent) -> State:
	var attack_state := _check_attack_input(event)
	if attack_state: return attack_state
	
	if event.is_action_released(key_left):
		if player.input_buffer.is_held(key_right): return state_walk_front_start
		return state_idle
		
	return null
