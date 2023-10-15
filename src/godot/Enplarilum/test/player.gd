extends Node3D

@export var speed = 0.56
var direction = Vector3(0,0,0)
var projectile_scene = preload("res://scenes/projectile.tscn")
@onready var main

func _ready():
	fire()

func _physics_process(delta):
	self.position += direction * speed * delta

func fire():
	while true:
		await get_tree().create_timer(0).timeout
		var p = spawn_projectile()
	
func spawn_projectile():
	var new_projectile = projectile_scene.instantiate()
	new_projectile.position = position
	new_projectile.direction = direction.normalized()
	main.add_child(new_projectile)
	new_projectile.look_at(direction)
	
