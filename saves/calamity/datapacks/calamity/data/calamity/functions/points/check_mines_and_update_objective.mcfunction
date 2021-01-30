# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Check the iron mines in the crosslane every tick and update the score to track phases.
#---------------------------------------------------------------------------------------------------

# Check out how many iron_ore blocks are in this area and store it
execute store result score OreLeft gameVariable run clone 142 68 182 130 0 194 130 0 182 filtered minecraft:iron_ore move
# Update the bossbar
execute store result bossbar calamity:iron_ore value run scoreboard players get OreLeft gameVariable

bossbar set calamity:iron_ore name {"translate":"Ore Left (%s)","with":[{"score":{"name": "OreLeft","objective": "gameVariable"}}]}

# Reset our temp variable
scoreboard players reset #tempVar gameVariable

