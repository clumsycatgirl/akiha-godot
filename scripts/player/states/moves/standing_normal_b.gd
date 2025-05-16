class_name PlayerStateStandingNormalB
extends PlayerStateMove

var goto_bb: bool

func _init() -> void:
	notepad = "5b"
	animation = animation_standing_normal_b
	
func enter() -> void:
	goto_bb = false
	super()

func process_input(event: InputEvent) -> State:
	print(player.input_buffer.buffer)
	var input = player.input_buffer.get_input()
	if (input != ""):
		match input:
			key_b: goto_bb = true
	return null

func process_frame(delta: float) -> State:
	if done:
		if goto_bb: return state_standing_normal_bb
		return state_idle
	return null
