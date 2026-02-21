extends Node3D

var host
var leitor
#PacketPeerUDP é usado em openseeface, ele não utiliza StreamPeerTCP, então StreamPeerTCP não funciona

func _ready() -> void: #aqui é o bloco que roda uma vez pra estabelecer conexão, etc
	host = PacketPeerUDP.new()
	host.bind(11573) #essa porta é a do openseeface padrão genérica
	leitor = StreamPeerBuffer.new()

func _process(_float) -> void:
	
	leitor.seek(0)
	
	if host.get_available_packet_count() > 0:
		var dados = host.get_packet()
		leitor.data_array = dados
		var tempo = leitor.get_double()
		print(tempo)

		var ID = leitor.get_32()
		print(ID)
		var teste = leitor.get_float()
		print(teste)		
		var teste2 = leitor.get_float()
		print(teste2)
		var teste3 = leitor.get_float()
		print(teste3)		
