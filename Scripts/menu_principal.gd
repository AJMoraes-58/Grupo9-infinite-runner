extends Control
@onready var textoDeCreditos = $textoDeCreditos

func _ready() -> void:
	textoDeCreditos.hide()
	
func _on_jogo_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/mundo.tscn")

func _on_credito_pressed() -> void:
	textoDeCreditos.visible = !textoDeCreditos.visible

func _on_mutar_pressed() -> void:
	var somMusica = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(somMusica, not AudioServer.is_bus_mute(somMusica))

func _on_sair_pressed() -> void:
	get_tree().quit()
