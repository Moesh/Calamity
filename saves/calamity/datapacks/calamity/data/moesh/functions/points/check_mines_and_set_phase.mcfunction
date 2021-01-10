# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Check the iron mines in the crosslane every tick and update the score to track phases.
#---------------------------------------------------------------------------------------------------

# Check out how many iron_ore blocks are in this area and store it
execute store result score OreLeft gameVariable run clone 142 68 182 130 0 194 130 0 182 filtered minecraft:iron_ore move
# Update the bossbar
execute store result bossbar moesh:iron_ore value run scoreboard players get OreLeft gameVariable

#---------------------------------------------------------------------------------------------------
# Purpose: Determine what phase the map is in based on how much ore is left in the mines
# TODO: May need to figure out solution for ore, but let's see how it goes in playtesting.
#---------------------------------------------------------------------------------------------------
# Phase 1 is what the game starts at.

# Phase 2
# #tempVar is created here and reset immediately afterwards
execute if score Phase gameVariable matches 1 run scoreboard players operation #tempVar gameVariable = OreLeft gameVariable
execute if score Phase gameVariable matches 1 run scoreboard players operation #tempVar gameVariable -= Phase2 mapRules
execute if score #tempVar gameVariable matches ..0 unless score Phase gameVariable matches 2.. run function moesh:points/start_phase_2
# Phase 3
execute if score Phase gameVariable matches 2 run scoreboard players operation #tempVar gameVariable = OreLeft gameVariable
execute if score Phase gameVariable matches 2 run scoreboard players operation #tempVar gameVariable -= Phase3 mapRules
execute if score #tempVar gameVariable matches ..0 unless score Phase gameVariable matches 3.. run function moesh:points/start_phase_3
# Phase 4
execute if score Phase gameVariable matches 3 run scoreboard players operation #tempVar gameVariable = OreLeft gameVariable
execute if score Phase gameVariable matches 3 run scoreboard players operation #tempVar gameVariable -= Phase4 mapRules
execute if score #tempVar gameVariable matches ..0 unless score Phase gameVariable matches 4.. run function moesh:points/start_phase_4

bossbar set moesh:iron_ore name {"translate":"Ore Left (%s)","with":[{"score":{"name": "OreLeft","objective": "gameVariable"}}]}

# Reset our temp variable
scoreboard players reset #tempVar gameVariable

