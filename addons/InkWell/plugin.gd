tool
extends EditorPlugin

var dock
func _enter_tree():
	add_custom_type("InkWell", "Node", load("res://addons/InkWell/InkWellNode/Assets/InkWell.gd"), load("res://addons/InkWell/InkWellNode/InkWell.png"))
	dock = load("res://addons/InkWell/Dock/Dock.tscn").instance()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL, dock)
	pass


func _exit_tree():
	remove_control_from_docks(dock)
	dock.free()
	pass
