extends CanvasLayer

func _ready() -> void:
	hide()

func Mostrar_Tela_Game_Over() -> void:
	show()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_ir_ao_menu_principal_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Cenas/menu_principal.tscn")
