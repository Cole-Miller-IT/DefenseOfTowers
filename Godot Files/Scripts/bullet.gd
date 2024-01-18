extends CharacterBody2D

var damage

func _ready():
	velocity = Vector2(35,0) #remove later, testing

func _physics_process(delta):
	
	move_and_slide()
