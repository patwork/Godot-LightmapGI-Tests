extends CanvasLayer


@export_node_path("LightmapGI") var lightmap_gi: NodePath

@onready var label_godot: Label = $Control/MarginContainer/VBoxContainer/LabelGodot
@onready var label_os: Label = $Control/MarginContainer/VBoxContainer/LabelOS
@onready var label_gpu: Label = $Control/MarginContainer/VBoxContainer/LabelGPU


func _ready() -> void:
	assert(not lightmap_gi.is_empty())
	label_godot.text = "Godot " + Engine.get_version_info().string
	label_os.text = OS.get_name() + " " + OS.get_version()
	label_gpu.text = RenderingServer.get_video_adapter_name()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var main = ProjectSettings.get_setting("application/run/main_scene")
		get_tree().change_scene_to_file(main)


func _on_lightmap_toggle_toggled(toggled_on: bool) -> void:
	(get_node(lightmap_gi) as LightmapGI).visible = toggled_on
