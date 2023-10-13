extends Node3D

@export var speed = 14
var target_velocity = Vector3.ZERO


func _physics_process(delta):
	self.position.z += speed * delta
