class_name PlayerStateIdle
extends PlayerState

var actions_pressed: Dictionary = {}

func enter() -> void:
	print("idle")
	player.animator.play(animation_idle)

func process_input(event: InputEvent) -> State:
	super(event)
	
	if _handle_press(event, key_a): return state_standing_normal_a
	if _handle_press(event, key_b): return state_standing_normal_b
	if _handle_press(event, key_c): return state_standing_normal_c
	if _handle_press(event, key_hair): return state_victory_hair_flip
	
	return null

func process_frame(delta: float) -> State:
	var keys = actions_pressed.keys()
	for key in keys:
		if not Input.is_action_just_pressed(key):
			actions_pressed.erase(key)
	
	return null

func _handle_press(event: InputEvent, key: String) -> bool:
	if event.is_action_pressed(key) and not actions_pressed.has(key):
		actions_pressed[key] = true
		return true
	return false
