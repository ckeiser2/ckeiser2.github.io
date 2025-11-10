extends Node2D

func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://Slime Potion.png")
	else:
		$TextureRect.texture = load("res://Tree Branch.png")