# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Determine if a player has scored points and handle accordingly.
#>--------------------------------------------------------------------------------------------------
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

# Add to point streak
execute as @a[tag=Playing] run scoreboard players operation @s streakPoints += @s prepScore

# Add the player score to their team score
scoreboard players operation BluePoints gameVariable += @a[tag=Playing,team=blue] prepScore
scoreboard players operation RedPoints gameVariable += @a[tag=Playing,team=red] prepScore

# Determine if the player is on the streak
# Remove point spree and announce that a spree was lost!
execute as @a[scores={timeSinceDeath=..0,streakLevel=1}] at @s run tellraw @a {"translate":"system.message","color": "green","with":[{ "translate":"calamity.streak.level1.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=2}] at @s run tellraw @a {"translate":"system.message","color": "yellow","with":[{ "translate":"calamity.streak.level2.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=3}] at @s run tellraw @a {"translate":"system.message","color": "gold","with":[{ "translate":"calamity.streak.level3.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=4}] at @s run tellraw @a {"translate":"system.message","color": "gold","with":[{ "translate":"calamity.streak.level4.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=5}] at @s run tellraw @a {"translate":"system.message","color": "gold","with":[{ "translate":"calamity.streak.level5.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=6}] at @s run tellraw @a {"translate":"system.message","color": "gold","with":[{ "translate":"calamity.streak.level6.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..}] run scoreboard players operation @s streakPoints /= 2 CONST
# Give team bonuses (these points never touch a player, and count towards no streaks)
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..},team=blue] at @s run scoreboard players operation BluePoints gameVariable -= @s streakPoints
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..},team=blue] at @s run scoreboard players operation RedPoints gameVariable += @s streakPoints
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..},team=blue] at @s run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.streak.steal.points","color":"green","with":[{"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"},{"translate":"r","font":"calamity:icons","color":"red"}]},{"score":{"name":"@s","objective":"streakPoints"},"color":"white"},{"text":"50","color":"white"},{"translate":"spacer.middle","with":[{"translate":"team.blue","color":"blue"},{"translate":"b","font":"calamity:icons","color":"blue"}]}]}]}
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..},team=red] at @s run scoreboard players operation RedPoints gameVariable -= @s streakPoints
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..},team=red] at @s run scoreboard players operation BluePoints gameVariable += @s streakPoints
execute as @a[scores={timeSinceDeath=..0,streakLevel=1..},team=red] at @s run tellraw @a {"translate":"system.message","with":[{ "translate":"calamity.streak.steal.points","color": "green", "with":[ {"translate":"spacer.middle","with":[{"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}]}, { "score": { "name": "@s","objective": "streakPoints" },"color": "white" },{"text": "50","color": "white"}, {"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}]} ] }]}

# Now we can reset the scores
scoreboard players set @a[scores={timeSinceDeath=..0,streakPoints=1..}] streakLevel 0
scoreboard players set @a[scores={timeSinceDeath=..0,streakPoints=1..}] streakPoints 0

#> Points messages
    #
    execute as @a[tag=Playing,scores={prepScore=1..,streakLevel=0}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points", "color":"gray", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"} ] } ] } ] }
    execute as @a[tag=Playing,scores={prepScore=1..,streakLevel=1}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"dark_aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"} ] } ] } ] }
    execute as @a[tag=Playing,scores={prepScore=1..,streakLevel=2}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"aqua", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"} ] } ] } ] }
    execute as @a[tag=Playing,scores={prepScore=1..,streakLevel=3}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"yellow", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"} ] } ] } ] }
    execute as @a[tag=Playing,scores={prepScore=1..,streakLevel=4..}] run tellraw @a { "translate":"system.message", "color":"gray", "with":[ { "translate":"spacer.colon", "with":[ {"selector": "@s"}, { "translate":"calamity.points.streak", "color":"gold", "with":[ {"score": {"name":"@s","objective":"prepScore"},"color": "white"},{"score":{"name":"@s","objective": "streakPoints"},"color": "white"} ] } ] } ] }

#> Send point streak message
# Level 1
execute as @a[tag=Playing,scores={streakPoints=15..29}] at @s unless score @s streakLevel matches 1 run tellraw @a {"translate":"system.message","color":"white","with":[ {"translate":"calamity.streak.level1","color":"dark_aqua","with":[ {"selector":"@s"}, {"score": {"name":"@s","objective":"streakPoints"},"color":"white"}]},{"text":"10","color":"white"}] }
execute as @a[tag=Playing,scores={streakPoints=15..29}] at @s unless score @s streakLevel matches 1 run tag @s add BonusForTeam
execute as @a[tag=Playing,scores={streakPoints=15..29}] at @s run scoreboard players set @s streakLevel 1
# Level 2
execute as @a[tag=Playing,scores={streakPoints=30..44}] at @s unless score @s streakLevel matches 2 run tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level2", "color":"aqua", "with":[ {"selector": "@s"}, {"score": {"name":"@s","objective":"streakPoints"},"color": "white" } ] },{"text":"10","color":"white"} ] }
execute as @a[tag=Playing,scores={streakPoints=30..44}] at @s unless score @s streakLevel matches 2 run tag @s add BonusForTeam
execute as @a[tag=Playing,scores={streakPoints=30..44}] at @s run scoreboard players set @s streakLevel 2
# Level 3
execute as @a[tag=Playing,scores={streakPoints=45..59}] at @s unless score @s streakLevel matches 3 run tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level3", "color":"yellow", "with":[ {"selector": "@s"}, {"score": {"name":"@s","objective":"streakPoints"},"color": "white" } ] },{"text":"10","color":"white"} ] }
execute as @a[tag=Playing,scores={streakPoints=45..59}] at @s unless score @s streakLevel matches 3 run tag @s add BonusForTeam
execute as @a[tag=Playing,scores={streakPoints=45..59}] at @s run scoreboard players set @s streakLevel 3
# Level 4
execute as @a[tag=Playing,scores={streakPoints=60..74}] at @s unless score @s streakLevel matches 4 run tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level4", "color":"gold", "with":[ {"selector": "@s"}, {"score": {"name":"@s","objective":"streakPoints"},"color": "white" } ] },{"text":"10","color":"white"} ] }
execute as @a[tag=Playing,scores={streakPoints=60..74}] at @s unless score @s streakLevel matches 4 run tag @s add BonusForTeam
execute as @a[tag=Playing,scores={streakPoints=60..74}] at @s run scoreboard players set @s streakLevel 4
# Level 5
execute as @a[tag=Playing,scores={streakPoints=75..89}] at @s unless score @s streakLevel matches 5 run tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level5", "color":"gold", "with":[ {"selector": "@s"}, {"score": {"name":"@s","objective":"streakPoints"},"color": "white" } ] },{"text":"10","color":"white"} ] }
execute as @a[tag=Playing,scores={streakPoints=75..89}] at @s unless score @s streakLevel matches 5 run tag @s add BonusForTeam
execute as @a[tag=Playing,scores={streakPoints=75..89}] at @s run scoreboard players set @s streakLevel 5
# Level 6
execute as @a[tag=Playing,scores={streakPoints=90..}] at @s unless score @s streakLevel matches 6 run tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level6", "color":"gold", "with":[ {"selector": "@s"}, {"score": {"name":"@s","objective":"streakPoints"},"color": "white" } ] },{"text":"10","color":"white"} ] }
execute as @a[tag=Playing,scores={streakPoints=90..}] at @s unless score @s streakLevel matches 6 run tag @s add BonusForTeam
execute as @a[tag=Playing,scores={streakPoints=90..}] at @s run scoreboard players set @s streakLevel 6
# Give blue rewards
execute as @a[team=blue,tag=BonusForTeam] run scoreboard players add BluePoints gameVariable 10
execute as @a[team=blue,tag=BonusForTeam] at @s run tellraw @a {"translate":"system.message","with":[{"translate":"%s gains a %s point bonus!","color": "green","with":[{"translate":"spacer.middle","with":[{"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}]},{"text":"10","color":"white"}]}]}
# Give red rewards
execute as @a[team=red,tag=BonusForTeam] run scoreboard players add RedPoints gameVariable 10
execute as @a[team=red,tag=BonusForTeam] at @s run tellraw @a {"translate":"system.message","with":[{"translate":"%s gains a %s point bonus!","color": "green","with":[{"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}]}]}]}
tag @a[tag=BonusForTeam] remove BonusForTeam


scoreboard players set @a prepScore 0

function calamity:player/update_displays