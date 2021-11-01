# Called from: calamity:points/sequencer
#
#--------------------------------------------------------------------------------------------------
# Purpose: If a player on a streak dies, the opposing team steals 50% of the points gained during
#   that player's life.
#--------------------------------------------------------------------------------------------------

# Players with higher streak levels get cooler messages.
execute if score @s streakLevel matches 1 run tellraw @a {"translate":"system.message","color": "gray","with":[{ "translate":"calamity.streak.level1.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute if score @s streakLevel matches 2 run tellraw @a {"translate":"system.message","color": "dark_aqua","with":[{ "translate":"calamity.streak.level2.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute if score @s streakLevel matches 3 run tellraw @a {"translate":"system.message","color": "aqua","with":[{ "translate":"calamity.streak.level3.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute if score @s streakLevel matches 4 run tellraw @a {"translate":"system.message","color": "white","with":[{ "translate":"calamity.streak.level4.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute if score @s streakLevel matches 5 run tellraw @a {"translate":"system.message","color": "yellow","with":[{ "translate":"calamity.streak.level5.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}
execute if score @s streakLevel matches 6 run tellraw @a {"translate":"system.message","color": "gold","with":[{ "translate":"calamity.streak.level6.death", "with":[ { "selector":"@s" }, { "score": { "name": "@s", "objective": "streakPoints" },"color": "white" } ] }]}

# We're going to do this math live and sloppy, since we assume this value will not change while
#   this function is running.
scoreboard players operation @s[scores={streakLevel=1..}] streakPoints /= 2 CONST

# Give team bonuses (these points never touch a player, and count towards no streaks)
execute if score @s[team=blue] streakLevel matches 1.. run scoreboard players operation BluePoints gameVariable -= @s streakPoints
execute if score @s[team=blue] streakLevel matches 1.. run scoreboard players operation RedPoints gameVariable += @s streakPoints
execute if score @s[team=blue] streakLevel matches 1.. run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.streak.steal.points","color":"green","with":[{"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"},{"translate":"r","font":"calamity:icons","color":"red"}]},{"score":{"name":"@s","objective":"streakPoints"},"color":"white"},{"text":"50","color":"white"},{"translate":"spacer.middle","with":[{"translate":"team.blue","color":"blue"},{"translate":"b","font":"calamity:icons","color":"blue"}]}]}]}
# If player is on the the red team...
execute if score @s[team=red] streakLevel matches 1.. run scoreboard players operation RedPoints gameVariable -= @s streakPoints
execute if score @s[team=red] streakLevel matches 1.. run scoreboard players operation BluePoints gameVariable += @s streakPoints
execute if score @s[team=red] streakLevel matches 1.. run tellraw @a {"translate":"system.message","with":[{ "translate":"calamity.streak.steal.points","color": "green", "with":[ {"translate":"spacer.middle","with":[{"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}]}, { "score": { "name": "@s","objective": "streakPoints" },"color": "white" },{"text": "50","color": "white"}, {"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}]} ] }]}

# Now we can reset the scores
scoreboard players set @s streakLevel 0
scoreboard players set @s streakPoints 0
scoreboard players set @s nextStreakLevel 0