class_name InputBuffer
extends Node

const BUFFER_SIZE: int = 10
const BUFFER_WINDOW: int = 150  # ms

var buffer: Array = []
var held_buffer: Array = []

func _input(event: InputEvent) -> void:
	if event is not InputEventKey: return 	# ignore non keyboard events
											# remember to change this if implementing 
											# other controllers
	
	if event.is_pressed() and not event.is_echo():
		var action_name := _event_to_action(event)
		if action_name:
			_add_to_buffer(action_name)
		_add_to_held_buffer(action_name)
	
	if event.is_released():
		var action_name := _event_to_action(event)
		if action_name and is_held(action_name):
			_remove_from_held_buffer(action_name)

func get_input() -> String:
	var dict: Dictionary = get_input_dict()
	return "" if dict.is_empty() else dict["action"]
	
func get_input_dict() -> Dictionary:
	_clean_inputs()
	if buffer.is_empty():
		return {}
	var input = buffer.pop_front()
	if input == null or not input.has("action"):
		return {}
	return input

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
	var actions := InputMap.get_actions()
	actions.reverse()
	for action in actions:
		if InputMap.event_is_action(event, action):
			return action
	if event is InputEventKey:
		return event.as_text().to_lower()
	return ""

func _add_to_held_buffer(action_name: String) -> void:
	var held_action = _get_held_by_action(action_name)
	# check if action is in the buffer
	if held_action.is_empty():
		# add new one 
		held_buffer.push_front({
			"action": action_name,
			"time": Time.get_ticks_msec()
		})
	else:
		# update it
		held_action[0]["time"] = Time.get_ticks_msec()
	
func _remove_from_held_buffer(action_name: String) -> void:
	var held_action = _get_held_by_action(action_name)
	if held_action.size() > 0:
		held_buffer.erase(held_action[0])  # erase the first *and only* matched action

	
func is_held(action_name: String) -> bool:
	return _get_held_by_action(action_name).size() > 0

func _get_held_by_action(action_name: String) -> Array:
	return held_buffer.filter(func(action: Dictionary) -> bool:
		return action["action"] == action_name
	)
