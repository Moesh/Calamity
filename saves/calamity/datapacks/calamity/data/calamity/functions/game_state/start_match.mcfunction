# Called from: calamity:game_state/timer_start_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the map and player states to neutral
#>--------------------------------------------------------------------------------------------------

# Set map rules
difficulty normal
gamerule doInsomnia false
gamerule showDeathMessages true
gamerule announceAdvancements false
gamerule doFireTick true

#> Purpose: Establish a SessionID by using game time
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a sessionID = SessionID gameVariable

# Make the ore counter visible
function calamity:points/setup_bossbar

#>--------------------------------------------------------------------------------------------------
#> Purpose: Give players items and effects and let them play the game.
#>--------------------------------------------------------------------------------------------------

# Any player on a blue/red team are playing the game
tag @a[team=blue] add Playing
tag @a[team=red] add Playing

# Clear the player's items and effects, give them items, refill their health and hunger
clear @a
effect give @a[tag=Playing] minecraft:regeneration 3 10 false
execute as @a[tag=Playing] run function calamity:player/give_match_effects
gamemode survival @a[tag=Playing]
gamemode spectator @a[tag=!Playing]

scoreboard players set @a[tag=Playing] streakPoints 0
scoreboard players set @a[tag=Playing] streakLevel 0
scoreboard players set @a[tag=Playing] nextStreakLevel 0

# Set the correct scoreboard
scoreboard players operation ░░░░░ displayPoints = OreLeft gameVariable
scoreboard players set Blue displayPoints 0
scoreboard players set Red displayPoints 0
scoreboard objectives setdisplay sidebar displayPoints
scoreboard players set ReadyBlue gameVariable 0
scoreboard players set ReadyRed gameVariable 0
team join blue Blue
team join red Red
team modify fakeRed prefix {"translate":"spacer.right","with":[{"translate":"☒","color":"dark_red"}]}
team modify fakeBlue prefix {"translate":"spacer.right","with":[{"translate":"☒","color":"dark_red"}]}
# Update player triggers
scoreboard players reset * cancelStart
scoreboard players reset * selectTeam
scoreboard players reset * readyTeam
scoreboard players reset * leaveTeam
scoreboard players reset * shuffle
scoreboard players reset * toggleSpectator
scoreboard players enable @a[tag=Playing] gg

# Reset fall damage for everyone, so players that are currently falling won't die after the game has started
effect give @a minecraft:slow_falling 1 0 true
effect clear @a minecraft:slow_falling

execute as @a[tag=Playing] run function calamity:player/set_match_spawnpoint

# Reset the match timer
scoreboard players set MatchTimeInTicks gameVariable 0
scoreboard players set displayMinute gameVariable 0
scoreboard players set displaySecond gameVariable 0

# Give starting items
scoreboard players set #arenaAction gameVariable 8
execute as @a[tag=Playing] run function calamity:arena/handler

# Arena-specific actions (like removing blocks or entities)
scoreboard players set #arenaAction gameVariable 5
function calamity:arena/handler

# Send tellraw BEFORE changing any game modes!
execute if score displaySecond gameVariable matches 0..9 run tellraw @a {"translate":"system.timestamped.message","color":"green","with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, {"translate":"calamity.seekGlory"}]}
execute if score displaySecond gameVariable matches 10.. run tellraw @a {"translate":"system.timestamped.message","color":"green","with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]}, {"translate":"calamity.seekGlory"}]}
playsound minecraft:event.raid.horn master @a 136 150 89 999999
playsound calamity:calamity.announcer.match.started master @a 136 150 89 500

# Update game state
scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1