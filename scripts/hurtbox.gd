class_name HurtBox
extends Area2D

func _ready() -> void:
	collision_layer = 0
	collision_mask = 1
	self.area_entered.connect(on_area_entered)
	
func on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null: return
	pass
