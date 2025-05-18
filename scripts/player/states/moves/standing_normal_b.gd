class_name PlayerStateStandingNormalB
extends PlayerStateMove

var goto_bb: bool
var input_data: Dictionary
var accept_input_time: int

func _init() -> void:
	notepad = "5b"
	animation = animation_standing_normal_b

func enter() -> void:
	goto_bb = false
	input_data = {}
	accept_input_time = _get_frame_time(4)
	super()

func exit(new_state: State = null) -> void:
	return super(new_state)

func process_input(event: InputEvent) -> State:
	var temp := player.input_buffer.get_input_dict()
	if not temp.is_empty() and temp["action"] == key_b:
		input_data = temp
	return super(event)

func process_frame(delta: float) -> State:
	if not input_data.is_empty() and input_data["time"] >= accept_input_time:
		goto_bb = true

	if done and goto_bb:
		return state_standing_normal_bb

	return super(delta)
