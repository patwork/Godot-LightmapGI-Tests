extends Control


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_test_01_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test01/test_01.tscn")


func _on_test_02_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test02/test_02.tscn")


func _on_test_03_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test03/test_03.tscn")


func _on_test_04_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test04/test_04.tscn")
