class_name PlayerStateStandingNormalBB
extends PlayerStateMove

func _init() -> void:
	notepad = "5bb"
	animation = animation_standing_normal_bb

func enter() -> void:
	return super()

func exit(new_state: State = null) -> void:
	return super(new_state)

func process_input(event: InputEvent) -> State:
	return super(event)
	
func process_frame(delta: float) -> State:
	return super(delta)
