class_name Player
extends CharacterBody2D

@onready var state_machine: StateMachine = $"StateMachine"
@onready var animator: AnimationPlayer = $"Animator"
@onready var collider: CollisionShape2D = $"Collider"
@onready var sprite: AnimatedSprite2D = $"Sprite"
@onready var input_buffer: InputBuffer = $"InputBuffer"

func _ready() -> void:
	state_machine.init()
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _input(event: InputEvent) -> void:
	state_machine.process_input(event)
