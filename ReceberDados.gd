extends Node3D

var host

#PacketPeerUDP é usado em openseeface, ele não utiliza StreamPeerTCP, então StreamPeerTCP não funciona

func _ready() -> void: #aqui é o bloco que roda uma vez pra estabelecer conexão, etc
	host = PacketPeerUDP.new()
	host.bind(11573) #essa porta é a do openseeface padrão genérica

func _process(_float) -> void:
	if host.get_available_packet_count() > 0:
		print("pegando dados")
		print(host.get_packet().size())
