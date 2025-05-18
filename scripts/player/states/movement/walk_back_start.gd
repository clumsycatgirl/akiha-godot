class_name PlayerStateWalkBackStart
extends PlayerStateMove

func _init() -> void:
	notepad = "4 (start)"
	animation = animation_walk_back_start()
	
func process_input(event: InputEvent) -> State:
	var attack_state := _check_attack_input(event)
	if attack_state: return attack_state
	return null

func process_frame(_delta: float) -> State:
	if done:
		return state_walk_back
	return null
