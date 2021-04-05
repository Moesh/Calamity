# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Determine if a player has scored points and handle accordingly.
#---------------------------------------------------------------------------------------------------

# This is the most important variable in this function. We will add together all the aquired points
#   and then apply our modifiers. If any players has scored points, we will transfer them to their
#   team pool by the end of this function. This variable will then be wiped.
scoreboard players set @a prepScore 0

# If a player is Playing and has crafted something using an iron ingot
# We do not count iron_block, iron_ingot, or iron_nuggets.
execute as @a[tag=Playing] run function calamity:points/check_if_crafted_items

# Players can also capture a generator for 1 point. We're really trying to make everyone feel
# like they are contributing, even by gathering resources. Frankly speaking, it's a bit of travesty
# that capturing resources is just as valuable as ending a life.
execute as @a[tag=Playing] run scoreboard players operation @s prepScore += @s captureScore
scoreboard players set @a captureScore 0

# Kills are only worth one point because this map isn't about who can kill the most.
execute as @a[tag=Playing] run scoreboard players operation @s prepScore += @s killScore
scoreboard players set @a killScore 0

# Add the player score to their team score
scoreboard players operation BluePoints gameVariable += @a[tag=Playing,team=blue] prepScore
scoreboard players operation RedPoints gameVariable += @a[tag=Playing,team=red] prepScore

# Send a progressively fancier message based on the amount of points the player gained
execute as @a[tag=Playing,scores={prepScore=1..2}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"gray", "with":[ {"score": {"name":"@s","objective":"prepScore"}} ] } ] } ] }
execute as @a[tag=Playing,scores={prepScore=3..8}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"dark_aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"}} ] } ] } ] }
execute as @a[tag=Playing,scores={prepScore=9..15}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"}} ] } ] } ] }
execute as @a[tag=Playing,scores={prepScore=16..21}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"yellow", "with":[ {"score": {"name":"@s","objective":"prepScore"}} ] } ] } ] }
execute as @a[tag=Playing,scores={prepScore=22..}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"gold", "with":[ {"score": {"name":"@s","objective":"prepScore"}} ] } ] } ] }

function calamity:player/update_displays