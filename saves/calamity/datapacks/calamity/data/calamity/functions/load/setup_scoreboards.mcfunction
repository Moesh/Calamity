# Called from: #calamity:load
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

# Game rules are editable options, so they exist in the main directory, next to [calamity:tick] and
#	are called directly from calamity:load

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
scoreboard objectives remove captureScore
scoreboard objectives add captureScore dummy
scoreboard objectives remove killScore
scoreboard objectives add killScore minecraft.custom:minecraft.player_kills

# Players may disconnect and reconnect during matches, let's ensure they're in the right match.
scoreboard objectives remove SessionID
scoreboard objectives add SessionID dummy
# Minecraft will tick this up when a player disconnects from the game.
scoreboard objectives remove leaveGame
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game

# Player scores
scoreboard objectives remove selectedItem
scoreboard objectives add selectedItem dummy
scoreboard objectives remove giveSpawnItems
scoreboard objectives add giveSpawnItems deathCount

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
	scoreboard objectives remove leaveTeam
	scoreboard objectives add leaveTeam trigger
	scoreboard objectives remove spectate
	scoreboard objectives add spectate trigger

# The percentage of players who has to trigger the gg trigger before the team will forfeit
# Number has to be between 0(%) and 100(%).
scoreboard players set PercentPlayersToForfeit mapRules 75
    
# Craft items are worth points. This scoreboard tracks those points.
# iron_nugget and iron_block have been intentionally left out.
# Diamond can be found on the map, I am not counting these for points.
scoreboard objectives remove itemValues
scoreboard objectives add itemValues dummy
# Some recipes gives more items than 1. This scoreboard tracks how many items the recipe gives.
# This is needed since minecraft.crafted:minecraft.* goes up by the amount of items the recipe gives.
# (We don't want rails to give 6*16=96 points)
scoreboard objectives remove itemCounts
scoreboard objectives add itemCounts dummy
    # The number of lines in this list must exactly match the number of created objectives we
    #   create below.
    scoreboard players set activator_rail itemValues 6
    scoreboard players set activator_rail itemCounts 6
    scoreboard players set anvil itemValues 31
    scoreboard players set anvil itemCounts 1
    scoreboard players set blast_furnace itemValues 5
    scoreboard players set blast_furnace itemCounts 1
    scoreboard players set bucket itemValues 3
    scoreboard players set bucket itemCounts 1
    scoreboard players set cauldron itemValues 7
    scoreboard players set cauldron itemCounts 1
    scoreboard players set chain itemValues 1
    scoreboard players set chain itemCounts 1
    scoreboard players set compass itemValues 4
    scoreboard players set compass itemCounts 1
    scoreboard players set crossbow itemValues 1
    scoreboard players set crossbow itemCounts 1
    scoreboard players set detector_rail itemValues 6
    scoreboard players set detector_rail itemCounts 6
    scoreboard players set flint_and_steel itemValues 1
    scoreboard players set flint_and_steel itemCounts 1
    scoreboard players set heavy_weighted_pressure_plate itemValues 2
    scoreboard players set heavy_weighted_pressure_plate itemCounts 1
    scoreboard players set hopper itemValues 5
    scoreboard players set hopper itemCounts 1
    scoreboard players set iron_trapdoor itemValues 4
    scoreboard players set iron_trapdoor itemCounts 1
    scoreboard players set iron_axe itemValues 3
    scoreboard players set iron_axe itemCounts 1
    scoreboard players set iron_bars itemValues 6
    scoreboard players set iron_bars itemCounts 16
    scoreboard players set iron_boots itemValues 4
    scoreboard players set iron_boots itemCounts 1
    scoreboard players set iron_chestplate itemValues 8
    scoreboard players set iron_chestplate itemCounts 1
    scoreboard players set iron_door itemValues 6
    scoreboard players set iron_door itemCounts 3
    scoreboard players set iron_helmet itemValues 5
    scoreboard players set iron_helmet itemCounts 1
    scoreboard players set iron_hoe itemValues 2
    scoreboard players set iron_hoe itemCounts 1
    scoreboard players set iron_leggings itemValues 7
    scoreboard players set iron_leggings itemCounts 1
    scoreboard players set iron_pickaxe itemValues 3
    scoreboard players set iron_pickaxe itemCounts 1
    scoreboard players set iron_shovel itemValues 1
    scoreboard players set iron_shovel itemCounts 1
    scoreboard players set iron_sword itemValues 2
    scoreboard players set iron_sword itemCounts 1
    scoreboard players set minecart itemValues 5
    scoreboard players set minecart itemCounts 1
    scoreboard players set piston itemValues 1
    scoreboard players set piston itemCounts 1
    scoreboard players set rail itemValues 6
    scoreboard players set rail itemCounts 16
    scoreboard players set shears itemValues 2
    scoreboard players set shears itemCounts 1
    scoreboard players set shield itemValues 1
    scoreboard players set shield itemCounts 1
    scoreboard players set smithing_table itemValues 2
    scoreboard players set smithing_table itemCounts 1
    scoreboard players set stonecutter itemValues 1
    scoreboard players set stonecutter itemCounts 1
    scoreboard players set tripwire_hook itemValues 1
    scoreboard players set tripwire_hook itemCounts 2

# This list MUST exactly be double the amount of lines found in the list above.
scoreboard objectives remove craftedObjItem01
scoreboard objectives add craftedObjItem01 minecraft.crafted:minecraft.activator_rail
scoreboard objectives remove craftedObjItem02
scoreboard objectives add craftedObjItem02 minecraft.crafted:minecraft.anvil
scoreboard objectives remove craftedObjItem03
scoreboard objectives add craftedObjItem03 minecraft.crafted:minecraft.blast_furnace
scoreboard objectives remove craftedObjItem04
scoreboard objectives add craftedObjItem04 minecraft.crafted:minecraft.bucket
scoreboard objectives remove craftedObjItem05
scoreboard objectives add craftedObjItem05 minecraft.crafted:minecraft.cauldron
scoreboard objectives remove craftedObjItem06
scoreboard objectives add craftedObjItem06 minecraft.crafted:minecraft.chain
scoreboard objectives remove craftedObjItem07
scoreboard objectives add craftedObjItem07 minecraft.crafted:minecraft.compass
scoreboard objectives remove craftedObjItem08
scoreboard objectives add craftedObjItem08 minecraft.crafted:minecraft.crossbow
scoreboard objectives remove craftedObjItem09
scoreboard objectives add craftedObjItem09 minecraft.crafted:minecraft.detector_rail
scoreboard objectives remove craftedObjItem10
scoreboard objectives add craftedObjItem10 minecraft.crafted:minecraft.flint_and_steel
scoreboard objectives remove craftedObjItem11
scoreboard objectives add craftedObjItem11 minecraft.crafted:minecraft.heavy_weighted_pressure_plate
scoreboard objectives remove craftedObjItem12
scoreboard objectives add craftedObjItem12 minecraft.crafted:minecraft.hopper
scoreboard objectives remove craftedObjItem13
scoreboard objectives add craftedObjItem13 minecraft.crafted:minecraft.iron_trapdoor
scoreboard objectives remove craftedObjItem14
scoreboard objectives add craftedObjItem14 minecraft.crafted:minecraft.iron_axe
scoreboard objectives remove craftedObjItem15
scoreboard objectives add craftedObjItem15 minecraft.crafted:minecraft.iron_bars
scoreboard objectives remove craftedObjItem16
scoreboard objectives add craftedObjItem16 minecraft.crafted:minecraft.iron_boots
scoreboard objectives remove craftedObjItem17
scoreboard objectives add craftedObjItem17 minecraft.crafted:minecraft.iron_chestplate
scoreboard objectives remove craftedObjItem18
scoreboard objectives add craftedObjItem18 minecraft.crafted:minecraft.iron_door
scoreboard objectives remove craftedObjItem19
scoreboard objectives add craftedObjItem19 minecraft.crafted:minecraft.iron_helmet
scoreboard objectives remove craftedObjItem20
scoreboard objectives add craftedObjItem20 minecraft.crafted:minecraft.iron_hoe
scoreboard objectives remove craftedObjItem21
scoreboard objectives add craftedObjItem21 minecraft.crafted:minecraft.iron_leggings
scoreboard objectives remove craftedObjItem22
scoreboard objectives add craftedObjItem22 minecraft.crafted:minecraft.iron_pickaxe
scoreboard objectives remove craftedObjItem23
scoreboard objectives add craftedObjItem23 minecraft.crafted:minecraft.iron_shovel
scoreboard objectives remove craftedObjItem24
scoreboard objectives add craftedObjItem24 minecraft.crafted:minecraft.iron_sword
scoreboard objectives remove craftedObjItem25
scoreboard objectives add craftedObjItem25 minecraft.crafted:minecraft.minecart
scoreboard objectives remove craftedObjItem26
scoreboard objectives add craftedObjItem26 minecraft.crafted:minecraft.piston
scoreboard objectives remove craftedObjItem27
scoreboard objectives add craftedObjItem27 minecraft.crafted:minecraft.rail
scoreboard objectives remove craftedObjItem28
scoreboard objectives add craftedObjItem28 minecraft.crafted:minecraft.shears
scoreboard objectives remove craftedObjItem29
scoreboard objectives add craftedObjItem29 minecraft.crafted:minecraft.shield
scoreboard objectives remove craftedObjItem30
scoreboard objectives add craftedObjItem30 minecraft.crafted:minecraft.smithing_table
scoreboard objectives remove craftedObjItem31
scoreboard objectives add craftedObjItem31 minecraft.crafted:minecraft.stonecutter
scoreboard objectives remove craftedObjItem32
scoreboard objectives add craftedObjItem32 minecraft.crafted:minecraft.tripwire_hook

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
	# oreLeft is polled from calamity:points/update_mines
	scoreboard players set OreLeft gameVariable 0


# Index:
# 0 = Lobby
# 1 = In-progress
# 2 = Post game

# Game starts in lobby mode by default.
scoreboard players set GameState gameVariable 0

# Used to determine whether or not the game has started.
# This variable is accessed from calamity:tick, calamity:game_state/start_match,
# calamity:game_state/trigger_cancel_start, and calamity:game_state/trigger_start_match
scoreboard players set StartingMatch gameVariable 0


# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Teams and objectives removed and reset","color":"light_purple"}]}