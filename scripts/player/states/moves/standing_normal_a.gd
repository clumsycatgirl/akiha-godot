class_name PlayerStateStandingNormalA
extends PlayerStateMove

func _init() -> void:
	notepad = "5a"
	animation = animation_standing_normal_a

func enter() -> void:
	return super()
	
func exit(new_state: State = null) -> void:
	return super(new_state)

func process_input(event: InputEvent) -> State:
	return super(event)
	
func process_frame(delta: float) -> State:
	return super(delta)


func _on_sprite_frame_changed() -> void:
	if not active: return
	print(player.sprite.frame)
