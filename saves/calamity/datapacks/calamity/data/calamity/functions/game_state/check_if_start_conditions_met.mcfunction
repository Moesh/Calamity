# Called from: calamity:game_state/timer_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Checks if the game can be started
#---------------------------------------------------------------------------------------------------

# At least one player must be active in order for the game to start. This is a hidden variable as it
#   is only checked here and no where else. We'll reset at the end of the file. This could be
#   considered one way to work with private variables...
scoreboard players set #TeamsPlaying gameVariable 2
execute unless entity @a[team=blue] run scoreboard players remove #TeamsPlaying gameVariable 1
execute unless entity @a[team=red] run scoreboard players remove #TeamsPlaying gameVariable 1

execute if score #TeamsPlaying gameVariable matches 0 run tellraw @a {"translate":"%s At least one player must be on a team to start a match","color":"red","with":[{"text":">>>","color":"white"}]}
execute if score #TeamsPlaying gameVariable matches 0 run function calamity:game_state/trigger_cancel_start
execute if score #TeamsPlaying gameVariable matches 1.. run function calamity:game_state/start_match

# Reset private variable
scoreboard players reset #TeamsPlaying gameVariable