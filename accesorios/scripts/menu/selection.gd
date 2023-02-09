extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_car = 1
var scene
var selected_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	selected_scene = get_node("selected_scene")
	#if current_car == 0:

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_right_pressed():
	current_car = current_car + 1
	selected_scene.text = str(current_car)
	if current_car > 2:
		current_car = 2

func _on_left_pressed():
	current_car = current_car - 1
	selected_scene.text = str(current_car)
	if current_car <1:
		current_car = 1

func _on_start_pressed():
	if current_car == 1:
		get_tree().change_scene("res://accesorios/scenes/race/raceOne.tscn")
	elif current_car == 2:
		get_tree().change_scene("res://accesorios/scenes/race/raceOneCarTwo.tscn")
	#elif current_car == 3:
		#get_tree().change_scene("res://accesorios/scenes/gamePlayHearse.tscn")
