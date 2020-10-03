extends KinematicBody2D

onready var player : KinematicBody2D = self
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass
	
func _physics_process(delta: float):
#	https://www.davidepesce.com/2019/09/30/godot-tutorial-5-player-movement/

	# Get player input
	var direction: Vector2
		
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	# Apply movement
	var movement = speed * direction
	move_and_slide(movement)
	
	# rotate player
	# player.look_at(get_global_mouse_position())
