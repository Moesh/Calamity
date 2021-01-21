# Called from: calamity:resource_point/output

#---------------------------------------------------------------------------------------------------
# Purpose: Calculates whether or not there is points to steal based on the player it is executing
#   from. If there are points, steal them. If there are no points, or less than the max value,
#   make adjustments as necessary.
#---------------------------------------------------------------------------------------------------

# If the team has no points to be stolen
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable matches 0 run tellraw @a {"translate":">>> %s","color":"white","with":[{"translate":"Blue tried, but Red had no points to steal!","color":"blue"}]}
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable matches 0 run tag @s remove GivePoints
# If the team does not have enough points to be stolen
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable < PointsToSteal gameVariable run scoreboard players operation BluePoints gameVariable += RedPoints gameVariable
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable < PointsToSteal gameVariable run tellraw @a {"translate":"%s Blue stole %s points from Red!","color":"blue","with":[{"translate":">>>","color":"white"},{"score": {"name":"RedPoints","objective":"gameVariable"},"color": "white"}]}
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable < PointsToSteal gameVariable run scoreboard players set RedPoints gameVariable 0
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable < PointsToSteal gameVariable run tag @s remove GivePoints
# If team has enough points to be stolen
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable >= PointsToSteal gameVariable run tellraw @a {"translate":"%s Blue stole %s points from Red!","color":"blue","with":[{"translate":">>>","color":"white"},{"score": {"name":"PointsToSteal","objective":"gameVariable"},"color": "white"}]}
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable >= PointsToSteal gameVariable run scoreboard players operation BluePoints gameVariable += PointsToSteal gameVariable
execute if entity @s[team=blue,tag=GivePoints] if score RedPoints gameVariable >= PointsToSteal gameVariable run scoreboard players operation RedPoints gameVariable -= PointsToSteal gameVariable
tag @s[team=blue,tag=GivePoints] remove GivePoints

# If the team has no points to be stolen
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable matches 0 run tellraw @a {"translate":">>> %s","color":"white","with":[{"translate":"Red tried, but Blue had no points to steal!","color":"red"}]}
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable matches 0 run tag @s remove GivePoints
# If the team does not have enough points to be stolen
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable < PointsToSteal gameVariable run scoreboard players operation RedPoints gameVariable += BluePoints gameVariable
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable < PointsToSteal gameVariable run tellraw @a {"translate":"%s Red stole %s points from Blue!","color":"red","with":[{"translate":">>>","color":"white"},{"score": {"name":"BluePoints","objective":"gameVariable"},"color": "white"}]}
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable < PointsToSteal gameVariable run scoreboard players set BluePoints gameVariable 0
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable < PointsToSteal gameVariable run tag @s remove GivePoints
# If team has enough points to be stolen
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable >= PointsToSteal gameVariable run tellraw @a {"translate":"%s Red stole %s points from Blue!","color":"red","with":[{"translate":">>>","color":"white"},{"score": {"name":"PointsToSteal","objective":"gameVariable"},"color": "white"}]}
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable >= PointsToSteal gameVariable run scoreboard players operation RedPoints gameVariable += PointsToSteal gameVariable
execute if entity @s[team=red,tag=GivePoints] if score BluePoints gameVariable >= PointsToSteal gameVariable run scoreboard players operation BluePoints gameVariable -= PointsToSteal gameVariable
tag @s[team=red,tag=GivePoints] remove GivePoints