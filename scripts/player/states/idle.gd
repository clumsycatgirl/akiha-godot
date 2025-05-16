class_name PlayerStateIdle
extends PlayerState

var actions_pressed: Dictionary = {}

func enter() -> void:
	print("idle")
	player.animator.play(animation_idle)

func process_input(event: InputEvent) -> State:
	super(event)
	var input: String = player.input_buffer.get_input()
	if (input != ''):
		match input:
			key_a: return state_standing_normal_a
			key_b: return state_standing_normal_b
			key_c: return state_standing_normal_c
			key_hair: return state_victory_hair_flip
	return null

func process_frame(delta: float) -> State:
	var keys = actions_pressed.keys()
	for key in keys:
		if not Input.is_action_just_pressed(key):
			actions_pressed.erase(key)
	
	return null
