@tool
extends Control
@onready var sprite_path = $"Panel/Sprite path"
@onready var sprite_name = $"Panel/Sprite name"
@onready var panel = $Panel/ScrollContainer/FlowContainer #named it panel too early and changed how it works but its the flow container
@onready var container = $Panel/ScrollContainer
var file_data
const file_path = "res://addons/Sprite Dictionary Plugin/Sprite_dict_stuff.json"
func check_if_file_exists():
	if !FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.WRITE)
		var empty_dict = {}
		file.store_string(JSON.stringify(empty_dict))
		file.close()
func grab_file_data():
	check_if_file_exists()
	var file = FileAccess.open(file_path, FileAccess.READ)
	file_data = JSON.parse_string(file.get_as_text())
	for files in file_data:
		if !FileAccess.file_exists(file_data[files]):
			file_data.erase(files)
			print(files, "This name is getting deleted because", file_data[files], "No longer exists. Make sure to replace it!")
	file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(file_data, "\t"))
	file.close()
	return

func _set_data_on_start():
	for i in file_data:
		_make_sprite(i, file_data[i])

func _make_sprite(_name, path):
	var textrect: TextureRectWText = TextureRectWText.new()
	textrect.name = _name
	textrect.texture = load(path)
	panel.add_child(textrect)
var sprite_dict_node
func _ready():
	check_if_file_exists()
	container.size_flags_vertical = SIZE_EXPAND
	grab_file_data()
	print(file_data)
	_set_data_on_start()




func save_sprite_to_file(_name, path):
	grab_file_data()
	file_data[_name] = path
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(file_data, "\t"))
	file.close()
	grab_file_data()
	print(file_data)


func _submit_sprite():
	if !FileAccess.file_exists(sprite_path.text):
		sprite_path.text = ""
		sprite_path.placeholder_text = "The file must exist in res://"
		return
	if sprite_name.text in file_data:
		sprite_name.text = ""
		sprite_name.placeholder_text = "This name already exists"
		return
		
	save_sprite_to_file(sprite_name.text, sprite_path.text)
	_make_sprite(sprite_name.text, sprite_path.text)
	sprite_name.text = ""
	sprite_path.text = ""
	sprite_name.placeholder_text = "Sprite name"
	sprite_path.placeholder_text = "Sprite path"

	



func _on_sprite_path_text_submitted(new_text: String) -> void:
	if sprite_name.text == "":
		sprite_name.placeholder_text = "Insert name before submission"
		return
	if !new_text.ends_with(".png"):
		sprite_path.text = ""
		sprite_path.placeholder_text = "Make sure it is a png file"
		return
	_submit_sprite()
		


func _on_sprite_name_text_submitted(new_text: String) -> void:
	if sprite_path.text == "":
		_on_sprite_name_text_submitted(sprite_path.text)
		return
	_submit_sprite()
	pass


func _on_sprite_name_text_changed(new_text: String) -> void:
	pass # Replace with function body.
