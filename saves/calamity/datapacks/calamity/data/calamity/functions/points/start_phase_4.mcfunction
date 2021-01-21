# Called from: calamity:points/check_mines_and_set_phase

#---------------------------------------------------------------------------------------------------
# Purpose: Start a specific phase and update the players.
#---------------------------------------------------------------------------------------------------

scoreboard players operation PhaseMultiplier gameVariable = Phase4Multiplier mapRules
scoreboard players operation PointsToSteal gameVariable = StealPointsBase mapRules
scoreboard players operation PointsToSteal gameVariable *= PhaseMultiplier gameVariable
scoreboard players set Phase gameVariable 4
execute at @e[type=area_effect_cloud,tag=StealPoints] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"sign.moesh.stealPoints\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.stealPoints\",\"with\":[{\"score\":{\"name\":\"PointsToSteal\",\"objective\":\"gameVariable\"}}]}"}
tellraw @a {"translate":"%s Phase %s begins! %sx points multiplier.","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name": "Phase","objective": "gameVariable"},"color":"white"},{"score":{"name":"PhaseMultiplier","objective":"gameVariable"},"color":"white"}]}