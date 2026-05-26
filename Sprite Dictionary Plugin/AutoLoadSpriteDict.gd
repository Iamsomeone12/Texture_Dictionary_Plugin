@tool
extends Node
@export var empty_sprite: CompressedTexture2D
var sprite_dict: Dictionary
func _ready():
	var file = FileAccess.open("res://addons/Sprite Dictionary Plugin/Sprite_dict_stuff.json", FileAccess.READ)
	sprite_dict = JSON.parse_string(file.get_as_text())
	file.close()
func print_stuff():
	print("This is the start of the dict", sprite_dict, "This is the end of the dict")
func get_sprite(sprite):
	assert(sprite in sprite_dict, str(sprite, "is not in SpriteDict heres, here is the sprite dictionary", sprite_dict))
	return sprite_dict[sprite]
		
