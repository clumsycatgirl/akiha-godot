class_name InputBuffer
extends Node

const BUFFER_SIZE: int = 10
const BUFFER_WINDOW: int = 150  # ms

var buffer: Array = []

func _ready() -> void:
	set_process_input(true)

func _input(event: InputEvent) -> void:
	if event.is_pressed() and not event.is_echo():
		var action_name := _event_to_action(event)
		if action_name:
			_add_to_buffer(action_name)

func get_input() -> String:
	_clean_inputs()
	if buffer.is_empty():
		return ""
	var input = buffer.pop_front()
	if input == null or not input.has("action"):
		return ""
	return input["action"]

func _add_to_buffer(action_name: String) -> void:
	if buffer.size() >= BUFFER_SIZE:
		buffer.pop_back()
	buffer.push_front({
		"action": action_name,
		"time": Time.get_ticks_msec()
	})

func _clean_inputs() -> void:
	var current_time = Time.get_ticks_msec()
	buffer = buffer.filter(func(item):
		return item["time"] + BUFFER_WINDOW >= current_time
	)

func _event_to_action(event: InputEvent) -> String:
	for action in InputMap.get_actions():
		if InputMap.event_is_action(event, action):
			return action
	if event is InputEventKey:
		return event.as_text().to_lower()
	return ""
