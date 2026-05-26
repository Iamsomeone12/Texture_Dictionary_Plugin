@tool
extends EditorPlugin
var dock: EditorDock
func _enter_tree():
	add_autoload_singleton("SpriteDict", "res://addons/Sprite Dictionary Plugin/AutoLoadSpriteDict.gd")
	dock = EditorDock.new()
	dock.title = "Sprite Dictioanry"
	dock.default_slot = EditorDock.DOCK_SLOT_LEFT_BL
	var dock_content = preload("res://addons/Sprite Dictionary Plugin/Sprite dictionary dock scene.tscn").instantiate()
	dock.add_child(dock_content)
	add_dock(dock)

func _exit_tree() -> void:
	remove_autoload_singleton("SpriteDict")
	remove_dock(dock)
	dock.queue_free()
	dock = null
