extends Node2D

func _ready() -> void:
	get_tree().change_scene_to_file("res://player.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://map_1.tscn")