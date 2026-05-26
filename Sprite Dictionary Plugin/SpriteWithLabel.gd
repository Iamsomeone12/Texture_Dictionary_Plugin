@tool
extends TextureRect
class_name TextureRectWText
func _make_tex64x64():
	custom_minimum_size = Vector2(115, 115)
	size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	expand_mode = TextureRect.EXPAND_FIT_WIDTH
	while texture == null:
		await get_tree().process_frame
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	
func _create_label():
	var label = Label.new()
	label.text = str(name, "\n", texture.get_width(), "x", texture.get_width())
	label.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	label.add_theme_font_size_override("font_size", 15)
	add_child(label)
	await get_tree().process_frame
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
func _ready():
	await _make_tex64x64()
	_create_label()
