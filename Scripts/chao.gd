extends StaticBody2D

@export var protagonista: CharacterBody2D

func _physics_process(delta: float) -> void:
	if protagonista != null:
		global_position.x = protagonista.global_position.x
