extends Node

const SCORES_PATH: String = "user://tappy.tres"

var highscore: int = 0
# properties ..... ??
var highscore_gs: int:
	get:
		return highscore
	set(value):
		if value > highscore:
			highscore = value;
			save_high_score()
			
# load up high scores when the game is booted
func _ready() -> void:
	load_high_score()

func save_high_score() -> void:
	var hsr: HighScoreResource = HighScoreResource.new();
	hsr.high_score = highscore;
	#ResourceSaver.save(RESOURCE_I_WANT_TO_SAVE, SYSTEM_DIRECTORY_PATH_TO_SAVE_IT_TO)
	ResourceSaver.save(hsr, SCORES_PATH) #using debugger, after my error, NOW this line is getting hit!! its saving the score to file now!!
	
func load_high_score() -> void:
#	 check if we have a resource saved that exists first, so game doesnt crash loading something it doesnt have
	if ResourceLoader.exists(SCORES_PATH): #breakpoint good
		var hsr: HighScoreResource = ResourceLoader.load(SCORES_PATH) #Debugging: for some reason this line is not being hit? the data is not loading?
		if hsr: # if hsr has a value in it
			highscore = hsr.high_score #?? not sure why this says 0 when the score is loaded, but at least the high score is saved and persists on the main screen...?
