# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Cancel the timer to start a match
#---------------------------------------------------------------------------------------------------
scoreboard players set StartingMatch gameVariable 0
execute as @a[scores={cancelStart=1..}] run tellraw @a {"translate":"%s %s ⏹ cancelled match ","color":"green","with":[{"text":">>>","color":"white"},{"selector":"@s"}]}
execute unless entity @a[scores={cancelStart=1..}] run tellraw @a {"translate":"%s Match ⏹ cancelled ","color":"green","with":[{"text":">>>","color":"white"}]}
execute if score ReadyBlue gameVariable matches 1 run function calamity:game_state/ready_team/blue_not_ready
execute if score ReadyRed gameVariable matches 1 run function calamity:game_state/ready_team/red_not_ready

# Setup new triggers for the player
scoreboard players reset * cancelStart
scoreboard players enable @a startMatch