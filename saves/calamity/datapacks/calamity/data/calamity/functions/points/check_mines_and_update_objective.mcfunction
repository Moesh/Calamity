# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Check the iron mines in the crosslane every tick and update the objective score
#---------------------------------------------------------------------------------------------------

# Check out how many iron_ore blocks are in this area and store it
execute store result score OreLeft gameVariable run fill 142 68 182 130 0 194 minecraft:petrified_oak_slab[type=double] replace minecraft:iron_ore
fill 142 68 182 130 0 194 minecraft:iron_ore replace minecraft:petrified_oak_slab

# Update the bossbar and sidebar
execute store result bossbar calamity:iron_ore value run scoreboard players get OreLeft gameVariable
scoreboard players operation Goal displayPoints = OreLeft gameVariable

bossbar set calamity:iron_ore name {"translate":"Ore Left (%s)","with":[{"score":{"name": "OreLeft","objective": "gameVariable"}}]}

# Reset our temp variable
scoreboard players reset #tempVar gameVariable

