# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Check the iron mines in the crosslane every tick and update the objective score
#---------------------------------------------------------------------------------------------------

# Update the bossbar max value to corrolate with how much ore is left in the mines
# Check out how many iron_ore blocks are in this area and store it
execute store result score OreLeft gameVariable run fill 142 67 181 130 0 195 minecraft:petrified_oak_slab[type=double] replace minecraft:iron_ore
fill 142 67 181 130 0 195 minecraft:iron_ore replace minecraft:petrified_oak_slab
execute store result bossbar calamity:iron_ore max run scoreboard players get OreLeft gameVariable

# Update the bossbar current value and color with the score of whoever is currently winning
# Check the scores
scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable
# Update bossbar color based on who is in the lead
    # Blue is in the lead!
    execute if score #tempVar gameVariable matches 1.. run bossbar set calamity:iron_ore color blue
    execute if score #tempVar gameVariable matches 1.. run execute store result bossbar calamity:iron_ore value run scoreboard players get BluePoints gameVariable
    # The game is tied!
    execute if score #tempVar gameVariable matches 0 run execute store result bossbar calamity:iron_ore value run scoreboard players get OreLeft gameVariable
    execute if score #tempVar gameVariable matches 0 run bossbar set calamity:iron_ore color purple
    # Read is in the lead!
    execute if score #tempVar gameVariable matches ..-1 run execute store result bossbar calamity:iron_ore value run scoreboard players get RedPoints gameVariable
    execute if score #tempVar gameVariable matches ..-1 run bossbar set calamity:iron_ore color red
# Always reset the #tempVar
scoreboard players reset #tempVar gameVariable

# Always update the bossbar name with new information
bossbar set calamity:iron_ore name {"translate":"%s %s","with":[{"translate":"i","font":"calamity:icons","color":"white"},{"score":{"name": "OreLeft","objective": "gameVariable"}}]}

# Update the sidebar
scoreboard players operation Goal displayPoints = OreLeft gameVariable
scoreboard players operation Blue displayPoints = BluePoints gameVariable
scoreboard players operation Red displayPoints = RedPoints gameVariable