class_name PlayerStateWalkFront
extends PlayerState

func enter() -> void:
	super()
	print("6")
	player.animator.play(animation_walk_front())
	
func process_input(event: InputEvent) -> State:
	var attack_state := _check_attack_input(event)
	if attack_state: return attack_state
	
	if event.is_action_pressed(key_left):
		return state_walk_back_start
	if event.is_action_released(key_right):
		return state_idle
		
	return null
