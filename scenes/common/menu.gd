extends CanvasLayer


@export var issue_url: String
@export_node_path("LightmapGI") var lightmap_gi_path: NodePath
@export_node_path("Node3D") var scene_path: NodePath
@export_multiline var info_text: String

@onready var button_issue: Button = $Control/MarginContainer/HBoxContainer/VBoxContainer/ButtonIssue
@onready var label_godot: Label = $Control/MarginContainer/HBoxContainer/VBoxContainer/LabelGodot
@onready var label_os: Label = $Control/MarginContainer/HBoxContainer/VBoxContainer/LabelOS
@onready var label_gpu: Label = $Control/MarginContainer/HBoxContainer/VBoxContainer/LabelGPU
@onready var rich_text_label_info: RichTextLabel = $Control/MarginContainer/HBoxContainer/RichTextLabelInfo

@onready var scene_toggle: CheckButton = $Control/MarginContainer/HBoxContainer/VBoxContainer/SceneToggle


func _ready() -> void:
	button_issue.visible = not issue_url.is_empty()
	button_issue.text = "view Issue #" + issue_url.substr(issue_url.rfind("/") + 1)

	label_godot.text = "Godot " + Engine.get_version_info().string
	label_os.text = OS.get_name() + " " + OS.get_version()
	label_gpu.text = RenderingServer.get_video_adapter_name()

	assert(not lightmap_gi_path.is_empty())
	scene_toggle.visible = not scene_path.is_empty()
	rich_text_label_info.text = info_text


func return_to_main_scene() -> void:
	var main: String = ProjectSettings.get_setting("application/run/main_scene")
	get_tree().change_scene_to_file(main)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		return_to_main_scene()


func _on_lightmap_toggle_toggled(toggled_on: bool) -> void:
	(get_node(lightmap_gi_path) as LightmapGI).visible = toggled_on


func _on_scene_toggle_toggled(toggled_on: bool) -> void:
	if not scene_path.is_empty():
		(get_node(scene_path) as Node3D).visible = toggled_on


func _on_exit_pressed() -> void:
	return_to_main_scene()


func _on_button_issue_pressed() -> void:
	OS.shell_open(issue_url)
