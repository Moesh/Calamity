# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeRed prefix {"translate":"☑ ","color":"green"}
tellraw @a {"translate":"%s%s %s is ready ☑","color":"green","with":[{"translate":">>> ","color": "red"},{"translate":"team.red","color":"red"},{"translate":"r","font": "calamity:icons","color":"red"}]}
scoreboard players set ReadyRed gameVariable 1