# Called from: moesh:points/check_mines_and_set_phase

#---------------------------------------------------------------------------------------------------
# Purpose: Start a specific phase and update the players.
#---------------------------------------------------------------------------------------------------

scoreboard players operation PhaseMultiplier gameVariable = Phase3Multiplier mapRules
scoreboard players set Phase gameVariable 3
tellraw @a {"translate":"%s Phase %s begins! %sx points multiplier.","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name": "Phase","objective": "gameVariable"},"color":"white"},{"score":{"name":"PhaseMultiplier","objective":"gameVariable"},"color":"white"}]}