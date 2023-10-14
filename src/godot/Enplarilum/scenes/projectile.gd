extends Node3D

var direction = Vector3(0,0,0)
var speed = 80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += direction * speed * delta


func _on_area_3d_area_entered(area):
	self.hide()
	self.queue_free()
