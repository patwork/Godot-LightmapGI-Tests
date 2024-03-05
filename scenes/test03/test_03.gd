extends Node3D


@onready var camera_3d: Camera3D = $Camera3D
@onready var camera_3d_2: Camera3D = $cameras/Camera3D2
@onready var camera_3d_3: Camera3D = $cameras/Camera3D3
@onready var camera_3d_4: Camera3D = $cameras/Camera3D4
@onready var camera_3d_5: Camera3D = $cameras/Camera3D5


func _ready() -> void:
	_on_button_pressed()


func _on_button_pressed() -> void:
	camera_3d.current = true


func _on_button_2_pressed() -> void:
	camera_3d_2.current = true


func _on_button_3_pressed() -> void:
	camera_3d_3.current = true


func _on_button_4_pressed() -> void:
	camera_3d_4.current = true


func _on_button_5_pressed() -> void:
	camera_3d_5.current = true
