extends CharacterBody2D
@onready var animacao = $AnimatedSprite2D

#var para vaiaveis; const para constantes
#valor do pulo tem que ser negativo porque y=0 eh o topo da tela

const ALCANCE_DO_PRIMEIRO_PULO: float = -475.0
const ALCANCE_DO_SEGUNDO_PULO: float = -390.0
const MAXIMO_DE_PULOS: int = 2
const VELOCIDADE_MAXIMA_DA_CORRIDA: float = 900.0
const ACELERADOR_DE_QUEDA: float = 2.7
const TAXA_DE_ACELERACAO_CORRIDA: float = 4.0

var velocidadeDaCorrida: float = 400.0
var gravidade = ProjectSettings.get_setting("physics/2d/default_gravity") #valor padrao do godot
var quantidadeDePulos: int = 0

func _physics_process(delta: float) -> void: #loop para o jogo rodar
	if not is_on_floor():
		if Input.is_action_pressed("ui_down"): #mecanica de descer mais rapido
			velocity.y += (gravidade*ACELERADOR_DE_QUEDA) * delta
		else:
			velocity.y += gravidade*delta
	else:
		quantidadeDePulos = 0
	
	#ui_up eh a seta pra cima
	if Input.is_action_just_pressed("ui_up") and quantidadeDePulos < MAXIMO_DE_PULOS:
		if is_on_floor():
			velocity.y = ALCANCE_DO_PRIMEIRO_PULO
			quantidadeDePulos += 1

		elif quantidadeDePulos < MAXIMO_DE_PULOS:
			if quantidadeDePulos > 0:
				velocity.y = ALCANCE_DO_SEGUNDO_PULO
			else:
				velocity.y = ALCANCE_DO_PRIMEIRO_PULO
				
			quantidadeDePulos += 1
			animacao.stop()
			animacao.play("pulo")
	
	#animacao
	if is_on_floor():
		animacao.play("corrida")
	elif animacao.animation != "pulo":
		animacao.play("pulo")
		
	if velocidadeDaCorrida < VELOCIDADE_MAXIMA_DA_CORRIDA:
		velocidadeDaCorrida += TAXA_DE_ACELERACAO_CORRIDA * delta
	
	velocity.x = velocidadeDaCorrida
	move_and_slide()
