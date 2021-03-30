# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeBlue prefix {"translate":"☒ ","color":"dark_red"}
tellraw @a {"translate":"%s%s %s needs a moment %s","color":"green","with":[{"translate":">>> ","color": "blue"},{"translate":"team.blue","color":"blue"},{"translate":"b","font": "calamity:icons","color":"blue"},{"translate":"☒ ","color":"dark_red"}]}
scoreboard players set ReadyBlue gameVariable 0
execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/trigger_cancel_start