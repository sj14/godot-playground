extends Node2D

# Networking based on https://www.youtube.com/watch?v=K0luHLZxjBA

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonHost_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_server(6969,100)
	get_tree().set_network_peer(net)
	print("hosting")


func _on_ButtonJoin_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_client("127.0.0.1", 6969)
	get_tree().set_network_peer(net)
	print("joining")


func _player_connected(id):
	Globals.player2id = id
	var game = preload("res://scenes/Game/TopDown.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
