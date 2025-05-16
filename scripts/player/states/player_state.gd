class_name PlayerState
extends State

@onready var player: Player = get_tree().get_first_node_in_group("player")

static var input_buffer: Array = []
static var keys_pressed: Dictionary = {}

@export_group("states")
@export var state_idle: PlayerStateIdle
@export var state_standing_normal_a: PlayerStateStandingNormalA
@export var state_standing_normal_b: PlayerStateStandingNormalB
@export var state_standing_normal_c: PlayerStateStandingNormalC
@export var state_victory_hair_flip: PlayerStateVictory

const animation_idle = "idle"
const animation_standing_normal_a = "standing_normal_a"
const animation_standing_normal_b = "standing_normal_b"
const animation_standing_normal_c = "standing_normal_c"
const animation_victory_hair_flip = "victory"

const key_movement = "movement"
const key_left = "left"
const key_right = "right"
const key_jump = "jump"
const key_crouch = "crouch"
const key_a = "a"
const key_b = "b"
const key_c = "c"
const key_hair = "victory"

func process_input(event: InputEvent) -> State:
	if event is InputEventKey:
		if event.pressed:
			if not keys_pressed.has(event.as_text()):
				input_buffer.append(event.as_text())
				keys_pressed[event.as_text()] = true
		else:
			keys_pressed.erase(event.as_text())
				
	elif event is InputEventJoypadButton:
		if event.pressed:
			if not keys_pressed.has(event.button_index):
				input_buffer.append(event.button_index)
				keys_pressed[event.button_index] = true
		else:
			keys_pressed.erase(event.button_index)

	return null
