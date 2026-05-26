extends Sprite2D
class_name BetterSprite
@export var sprite_texture: String
func _ready():
	texture = load(SpriteDict.get_sprite(sprite_texture))
