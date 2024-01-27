extends Node


## A list of all flags of the game
var coiffeur : bool = false
var vetements : bool = false
var bar : bool = false

#hidden flag 
var autowash : bool = false


func setFlag(flagName : String, value : bool):
	
	if (flagName == "coiffeur"):
		
		coiffeur = value
		
		Dialogic.VAR.coiffeurVar = "true"
		
		print("Coiffeur is true")
	if (flagName == "vetements"):
		
		vetements = value
		
		Dialogic.VAR.vetementsVar = "true"
		
		print("vetements is true")
	if (flagName == "bar"):
		
		bar = value
		
		Dialogic.VAR.barVar = "true"
		
		print("bar")
	if (flagName == "autowash"):
		
		autowash = value
		
		Dialogic.VAR.WashVar = "true"
		
		print("autowash")
	
	
	
