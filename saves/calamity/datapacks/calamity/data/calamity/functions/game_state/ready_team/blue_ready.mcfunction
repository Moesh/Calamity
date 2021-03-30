# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeBlue prefix {"translate":"☑ ","color":"green"}
tellraw @a {"translate":"%s%s %s is ready ☑","color":"green","with":[{"translate":">>> ","color": "blue"},{"translate":"team.blue","color":"blue"},{"translate":"b","font": "calamity:icons","color":"blue"}]}
scoreboard players set ReadyBlue gameVariable 1