# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Cancel the timer to start a match
#---------------------------------------------------------------------------------------------------
scoreboard players set StartingMatch gameVariable 0
execute as @a[scores={cancelStart=1..},team=blue] run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.match.cancelled.byPlayer","color":"blue","with":[{"selector":"@s"},{"translate":"calamity.unicode.stop"}]}]}
execute as @a[scores={cancelStart=1..},team=red] run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.match.cancelled.byPlayer","color":"red","with":[{"selector":"@s"},{"translate":"calamity.unicode.stop"}]}]}
execute unless entity @a[scores={cancelStart=1..}] run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.match.cancelled","color":"red","with":[{"translate":"calamity.unicode.stop"}]}]}
execute if score ReadyBlue gameVariable matches 1 run function calamity:game_state/ready_team/blue_not_ready
execute if score ReadyRed gameVariable matches 1 run function calamity:game_state/ready_team/red_not_ready

# Setup new triggers for the player
scoreboard players reset * cancelStart
scoreboard players enable @a startMatch