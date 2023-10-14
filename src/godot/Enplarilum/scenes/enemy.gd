extends Node3D

@export var direction = Vector3(0, 0, 0)
@export var speed = 4
var sunPosition = Vector3(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var toSun = (sunPosition - self.position)
	var lenToSun = toSun.length()
	self.direction += (sunPosition - self.position) * delta * (1 - (lenToSun / 1000))
	#$p1.direction = $p1.direction.normalized() * 10
	self.direction.y = 0
	
	self.position += direction * speed * delta
	self.direction = direction.normalized()
	
	if lenToSun < 18:
		self.hide()
		self.queue_free()


func _on_area_3d_area_entered(area):
	self.hide()
	self.queue_free()
