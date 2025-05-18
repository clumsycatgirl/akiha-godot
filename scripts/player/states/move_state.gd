class_name PlayerStateMove
extends PlayerState

var done: bool = false
var allow_walk_out: bool = true
var _walk_left: bool
var _walk_right: bool

var notepad: String
var animation: String

func enter() -> void:
	super()
	print(notepad)
	done = false
	_walk_left = false
	_walk_right = false
	player.animator.animation_finished.connect(func(_animation: String) -> void: done = true)
	player.animator.play(animation)

func exit(new_state: State = null) -> void:
	if new_state is PlayerStateMove:
		new_state._walk_right = _walk_right
		new_state._walk_left = _walk_left
	return super(new_state)

func process_input(event: InputEvent) -> State:
	super(event)
	#_walk_left = event.is_action_pressed(key_left(), true)
	#_walk_right = event.is_action_pressed(key_right(), true)
	_walk_left = player.input_buffer.is_held(key_left)
	_walk_right = player.input_buffer.is_held(key_right)
	return null

func process_frame(delta: float) -> State:
	super(delta)
	if done:
		if _walk_left and allow_walk_out: return state_walk_back_start
		if _walk_right and allow_walk_out: return state_walk_front_start
		return state_idle
	return null

func _get_frame_time(frame: int) -> int:
	return Time.get_ticks_msec() + int(1000 * (float(frame) / (1 / player.animator.get_animation(animation).step)))
