# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Determine if a player has scored points and handle accordingly.
#---------------------------------------------------------------------------------------------------

function moesh:points/check_mines_and_set_phase

# This is the most important variable in this function. We will add together all the aquired points
#   and then apply our modifiers. If any players has scored points, we will transfer them to their
#   team pool by the end of this function. This variable will then be wiped.
scoreboard players set @a prepScore 0

# If a player is Playing and have crafted something using an iron ingot
# We do not count iron_block, iron_ingot, or iron_nuggets.
execute as @a[tag=Playing] run function moesh:points/check_if_crafted_items

# Kills are worth as much as using 1 Iron Ingot to craft something.
execute as @a[tag=Playing] run scoreboard players operation @s prepScore += @s killScore
scoreboard players set * killScore 0

# Apply the phase multiplier determined in moesh:load/map_calamity_rules
execute if score Phase gameVariable matches 1 as @a[tag=Playing] run scoreboard players operation @s prepScore *= Phase1Multiplier mapRules
execute if score Phase gameVariable matches 2 as @a[tag=Playing] run scoreboard players operation @s prepScore *= Phase2Multiplier mapRules
execute if score Phase gameVariable matches 3 as @a[tag=Playing] run scoreboard players operation @s prepScore *= Phase3Multiplier mapRules
execute if score Phase gameVariable matches 4 as @a[tag=Playing] run scoreboard players operation @s prepScore *= Phase4Multiplier mapRules

# Add the player score to their team score
scoreboard players operation BluePoints gameVariable += @a[tag=Playing,team=blue] prepScore
scoreboard players operation RedPoints gameVariable += @a[tag=Playing,team=red] prepScore

execute as @a[tag=Playing,team=blue,scores={prepScore=1..}] run tellraw @a {"translate":"%s +%s points","color":"light_gray","with":[{"text":">>>","color":"gray"},{"score": {"name":"@s","objective":"prepScore"},"color":"white"}]}

# Update the display scoreboard
scoreboard players operation Blue displayPoints = BluePoints gameVariable
scoreboard players operation Red displayPoints = RedPoints gameVariable

# Wipe any player record on this objective. If an player went offline at the exact same time they
#   earned points, they will be lost as a result of losing connection.
scoreboard players reset * prepScore