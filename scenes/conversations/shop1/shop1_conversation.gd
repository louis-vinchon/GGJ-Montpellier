extends Node2D


var dialogic_timeline := "shop1_timeline"

@onready var conversation :Conversation = $Conversation

func _ready():
	conversation.dialogic_timeline = dialogic_timeline
	conversation.trigger()
	await conversation.conversation_finished
	
	print("YAY")
