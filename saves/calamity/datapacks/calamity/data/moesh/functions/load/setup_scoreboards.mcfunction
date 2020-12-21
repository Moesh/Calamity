# Called from: #moesh:load
# TODO: Remove this from map loading state on release.

#---------------------------------------------------------------------------------------------------
# Purpose: When a scoreboard objective is removed, all of its data is wiped clean. Since we use the
#	scoreboard primarily for storing data, this becomes an efficient way to hard reset the project
#	to its "factory state". If this projet were to ever need some kind of persistent data between
#	sessions, another solution should be designed.
#---------------------------------------------------------------------------------------------------

# Remove Scoreboard Objectives
# CONSTANT scoreboard stores values which should not be changed or altered in any way. They are
#	primarily numbers which are used in math operations.
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set 6 CONST 6
	scoreboard players set 12 CONST 12
	scoreboard players set 20 CONST 20
	scoreboard players set 80 CONST 80
	scoreboard players set 100 CONST 100
	scoreboard players set -100 CONST -100

# Game rules are editable options, so they exist in the main directory, next to [moesh:tick] and
#	are called directly from moesh:load

scoreboard objectives remove AffectedItems
scoreboard objectives add AffectedItems dummy
scoreboard objectives remove health
scoreboard objectives add health health
scoreboard objectives remove QueryResult
scoreboard objectives add QueryResult dummy
scoreboard objectives remove SuccessCount
scoreboard objectives add SuccessCount dummy
scoreboard objectives remove loggedOff
scoreboard objectives add loggedOff minecraft.custom:minecraft.leave_game

scoreboard objectives remove teamSelected
scoreboard objectives remove classSelected
scoreboard objectives remove startRound
scoreboard objectives remove spectate
scoreboard objectives add teamSelected trigger
scoreboard objectives add classSelected trigger
scoreboard objectives add startRound trigger
scoreboard objectives add spectate trigger

scoreboard objectives remove PointTimer
scoreboard objectives add PointTimer dummy
scoreboard objectives remove progressLights
scoreboard objectives add progressLights dummy
scoreboard objectives remove progressSecond
scoreboard objectives add progressSecond dummy
scoreboard objectives remove progressSound
scoreboard objectives add progressSound dummy

scoreboard objectives remove displayPercent
scoreboard objectives add displaySecond dummy
scoreboard objectives remove displaySecond
scoreboard objectives add displayPercent dummy

scoreboard objectives remove outputMajor
scoreboard objectives add outputMajor dummy