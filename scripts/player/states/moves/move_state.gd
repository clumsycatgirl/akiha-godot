class_name PlayerStateMove
extends PlayerState

var done: bool = false
var notepad: String
var animation: String

func enter() -> void:
	print(notepad)
	done = false
	player.animator.animation_finished.connect(func(_animation: String) -> void: done = true)
	player.animator.play(animation)

func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_frame(delta: float) -> State:
	super(delta)
	if done: 
		return state_idle
	return null
