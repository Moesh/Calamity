# Called from: #moesh:load
# TODO: Remove this from map loading state on release.

#---------------------------------------------------------------------------------------------------
# Purpose: When a objective is removed, all of its data is wiped clean. Since we use the scoreboard
#	primarily for storing data, this becomes an efficient way to hard reset the project to its
#	"factory state". If this projet were to ever need some kind of persistent data between sessions,
#	another solution should be designed.
#---------------------------------------------------------------------------------------------------

# Remove Scoreboard Objectives
# CONSTANT scoreboard stores values which should not be changed or altered in any way. They are
#	primarily numbers which are used in math operations.
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set -100 CONST -100
	scoreboard players set 2 CONST 2
	scoreboard players set 3 CONST 3
	scoreboard players set 4 CONST 4
	scoreboard players set 6 CONST 6
	scoreboard players set 12 CONST 12
	scoreboard players set 20 CONST 20
	scoreboard players set 80 CONST 80
	scoreboard players set 100 CONST 100

# Game rules are editable options, so they exist in the main directory, next to [moesh:tick] and
#	are called directly from moesh:load

# This section removes and recreates read-only scoreboards. You can assume the game will never
# call these.
scoreboard objectives remove AffectedItems
scoreboard objectives add AffectedItems dummy
scoreboard objectives remove health
scoreboard objectives add health health {"text":"❤","color":"purple"}
	scoreboard objectives setdisplay belowName health
	scoreboard objectives modify health rendertype hearts
scoreboard objectives remove QueryResult
scoreboard objectives add QueryResult dummy
scoreboard objectives remove SuccessCount
scoreboard objectives add SuccessCount dummy
scoreboard objectives remove loggedOff
scoreboard objectives add loggedOff minecraft.custom:minecraft.leave_game

scoreboard objectives remove PointTimer
scoreboard objectives add PointTimer dummy
scoreboard objectives remove progressLights
scoreboard objectives add progressLights dummy
scoreboard objectives remove progressSecond
scoreboard objectives add progressSecond dummy
scoreboard objectives remove progressSound
scoreboard objectives add progressSound dummy

# Display scoreboards
scoreboard objectives remove displayPercent
scoreboard objectives add displaySecond dummy
scoreboard objectives remove displaySecond
scoreboard objectives add displayPercent dummy
scoreboard objectives remove displayPoints
scoreboard objectives add displayPoints dummy {"translate":"Score"}

# Objectives for determining score
scoreboard objectives remove prepScore
scoreboard objectives add prepScore dummy
scoreboard objectives remove craftedScore
scoreboard objectives add craftedScore dummy
scoreboard objectives remove killScore
scoreboard objectives add killScore minecraft.custom:minecraft.player_kills

# Players may disconnect and reconnect during matches, let's ensure they're in the right match.
scoreboard objectives remove SessionID
scoreboard objectives add SessionID dummy
# Minecraft will tick this up when a player disconnects from the game.
scoreboard objectives remove leaveGame
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game

# Player triggers
# These are ALWAYS reset when they are enabled. Players have no score by default.
# Enabled during the match. Players are moved to spectator if they want to gg out early.
scoreboard objectives remove gg
scoreboard objectives add gg trigger
# Players can use this to reset the level after a match has concluded.
scoreboard objectives remove reset
scoreboard objectives add reset trigger
# Objectives which can only be triggered during the lobby stage.
	# Start match
	scoreboard objectives remove startMatch
	scoreboard objectives add startMatch trigger
	# Cancel start 
	scoreboard objectives remove cancelStart
	scoreboard objectives add cancelStart trigger
	# Select a team
	scoreboard objectives add teamSelected trigger
	scoreboard objectives remove teamSelected
	# Spectate
	scoreboard objectives add spectate trigger
	scoreboard objectives remove spectate
	# Reset after match is complete
	scoreboard objectives remove reset
	scoreboard objectives add reset trigger
	# Used in [lobby/team_selected]
	scoreboard objectives remove teamSelected
	scoreboard objectives add teamSelected trigger

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up scoreboard for customizable game variables.
#---------------------------------------------------------------------------------------------------
# Many more gameVariables are set from custom-level:set_game_variables

# SET GAME VARIABLES
# This objective is removed and reset after each round to ensure no hanky panky has occurred. 
scoreboard objectives remove gameVariable
scoreboard objectives add gameVariable dummy
	scoreboard players set TimeToStartMatch gameVariable 300
	scoreboard players set BluePoints gameVariable 0
	scoreboard players set RedPoints gameVariable 0
	# oreLeft is polled from moesh:points/update_mines
	scoreboard players set OreLeft gameVariable 0


# Index:
# 0 = Lobby
# 1 = In-progress
# 2 = Post game

# Game starts in lobby mode by default.
scoreboard players set GameState gameVariable 0

# Used to determine whether or not the game has started.
# This variable is accessed from moesh:tick, moesh:game_state/start_match,
# moesh:game_state/trigger_cancel_start, and moesh:game_state/trigger_start_match
scoreboard players set StartingMatch gameVariable 0


# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Teams and objectives removed and reset","color":"light_purple"}]}