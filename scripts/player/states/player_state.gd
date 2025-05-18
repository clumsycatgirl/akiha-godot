class_name PlayerState
extends State

@onready var player: Player = get_tree().get_first_node_in_group("player")

@export_category("States")
@export var state_idle: PlayerStateIdle
@export_group("Input")
@export var state_standing_normal_a: PlayerStateStandingNormalA
@export var state_standing_normal_b: PlayerStateStandingNormalB
@export var state_standing_normal_bb: PlayerStateStandingNormalBB
@export var state_standing_normal_c: PlayerStateStandingNormalC
@export_group("Movement")
@export var state_walk_front_start: PlayerStateWalkFrontStart
@export var state_walk_front: PlayerStateWalkFront
@export var state_walk_back_start: PlayerStateWalkBackStart
@export var state_walk_back: PlayerStateWalkBack
@export_group("Other")
@export var state_victory_hair_flip: PlayerStateVictory

const animation_idle = "idle"
# --- Inputs ---
const animation_standing_normal_a = "standing_normal_a"
const animation_standing_normal_b = "standing_normal_b"
const animation_standing_normal_bb = "standing_normal_bb"
const animation_standing_normal_c = "standing_normal_c"
# --- Movement --- 
#const animation_walk_front = "walk_front"
#const animation_walk_front_start = "walk_front_start"
#const animation_walk_back = "walk_back"
#const animation_walk_back_start = "walk_back_start"
func animation_walk_front() -> StringName: return "walk_front" if not flipped else "walk_back"
func animation_walk_front_start() -> StringName: return "walk_front_start" if not flipped else "walk_back_start"
func animation_walk_back() -> StringName: return "walk_back" if not flipped else "walk_front" 
func animation_walk_back_start() -> StringName: return "walk_back_start" if not flipped else "walk_front_start"
# --- Other ---
const animation_victory_hair_flip = "victory"

# --- Input Actions --- 
const key_movement = "movement"
# func key_left() -> StringName: return "left" if not flipped else "right"
# func key_right() -> StringName: return "left" if flipped else "right"
const key_left = "left"
const key_right = "right"
const key_jump = "jump"
const key_crouch = "crouch"
const key_a = "a"
const key_b = "b"
const key_c = "c"
const key_hair = "victory"

var flipped: bool = false
var current_animation: StringName
var active: bool = false

func enter() -> void:
	active = true

func exit(new_state: State = null) -> void:
	super(new_state)
	if new_state is PlayerState:
		new_state.flipped = flipped
	active = false

func _check_attack_input(_event: InputEvent) -> State:
	var input: String = player.input_buffer.get_input()
	if (input != ''):
		match input:
			# --- input ---
			key_a: return state_standing_normal_a
			key_b: return state_standing_normal_b
			key_c: return state_standing_normal_c
			# --- other ---
			key_hair: return state_victory_hair_flip
			key_crouch: 
				flipped = not flipped
				player.sprite.flip_h = flipped
	return null
