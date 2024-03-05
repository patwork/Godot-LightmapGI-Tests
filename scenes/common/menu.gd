extends CanvasLayer


@export_node_path("LightmapGI") var lightmap_gi_path: NodePath
@export_node_path("Node3D") var scene_path: NodePath

@onready var label_godot: Label = $Control/MarginContainer/VBoxContainer/LabelGodot
@onready var label_os: Label = $Control/MarginContainer/VBoxContainer/LabelOS
@onready var label_gpu: Label = $Control/MarginContainer/VBoxContainer/LabelGPU

@onready var scene_toggle: CheckButton = $Control/MarginContainer/VBoxContainer/SceneToggle


func _ready() -> void:
	label_godot.text = "Godot " + Engine.get_version_info().string
	label_os.text = OS.get_name() + " " + OS.get_version()
	label_gpu.text = RenderingServer.get_video_adapter_name()

	assert(not lightmap_gi_path.is_empty())
	scene_toggle.visible = not scene_path.is_empty()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var main: String = ProjectSettings.get_setting("application/run/main_scene")
		get_tree().change_scene_to_file(main)


func _on_lightmap_toggle_toggled(toggled_on: bool) -> void:
	(get_node(lightmap_gi_path) as LightmapGI).visible = toggled_on


func _on_scene_toggle_toggled(toggled_on: bool) -> void:
	if not scene_path.is_empty():
		(get_node(scene_path) as Node3D).visible = toggled_on
