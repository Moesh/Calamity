# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeRed prefix {"translate":"☒ ","color":"dark_red"}
tellraw @a {"translate":"%s%s %s says hol' up %s","color":"green","with":[{"translate":">>> ","color": "red"},{"translate":"team.red","color":"red"},{"translate":"r","font": "calamity:icons","color":"red"},{"translate":"☒ ","color":"dark_red"}]}
scoreboard players set ReadyRed gameVariable 0
execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/trigger_cancel_start