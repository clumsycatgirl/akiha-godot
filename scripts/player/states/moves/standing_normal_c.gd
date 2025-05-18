class_name PlayerStateStandingNormalC
extends PlayerStateMove

func _init() -> void:
	notepad = "5c"
	animation = animation_standing_normal_c

func enter() -> void:
	return super()

func exit(new_state: State = null) -> void:
	return super(new_state)

func process_input(event: InputEvent) -> State:
	return super(event)
	
func process_frame(delta: float) -> State:
	return super(delta)
