extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_start_pressed():
	get_tree().change_scene("res://accesorios/ui/selectionMenu/carSelection.tscn")

func _on_settings_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
