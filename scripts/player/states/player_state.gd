class_name PlayerState
extends State

@onready var player: Player = get_tree().get_first_node_in_group("player")

@export_group("states")
@export var state_idle: PlayerStateIdle
@export var state_standing_normal_a: PlayerStateStandingNormalA
@export var state_standing_normal_b: PlayerStateStandingNormalB
@export var state_standing_normal_bb: PlayerStateStandingNormalBB
@export var state_standing_normal_c: PlayerStateStandingNormalC
@export var state_victory_hair_flip: PlayerStateVictory

const animation_idle = "idle"
const animation_standing_normal_a = "standing_normal_a"
const animation_standing_normal_b = "standing_normal_b"
const animation_standing_normal_bb = "standing_normal_bb"
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
